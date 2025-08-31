from fastapi import APIRouter, HTTPException, status, Depends
from sqlalchemy.orm import Session
from sqlalchemy.exc import IntegrityError
from fastapi.responses import JSONResponse

from app.schemas.user import UserCreate, UserOut
from app.db.session import get_db
from app.utils.security import get_password_hash
from app.models.user import User

router = APIRouter()


@router.post("/register", response_model=UserOut)
def register(user: UserCreate, db: Session = Depends(get_db)):
    try:
        existing = db.query(User).filter(User.email == user.email).first()
        if existing:
            raise HTTPException(status_code=400, detail="Email already registered")
        hashed_password = get_password_hash(user.password)
        db_user = User(
            firstName=user.firstName,
            lastName=user.lastName,
            email=user.email,
            phone=user.phone,
            hashed_password=hashed_password,
            password=user.password,
            role_id=user.role_id,
        )
        db.add(db_user)
        db.commit()
        db.refresh(db_user)
        return UserOut.from_orm(db_user).dict(by_alias=True)
    except IntegrityError as e:
        db.rollback()
        raise HTTPException(status_code=400, detail="Email already registered")
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))