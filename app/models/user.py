from sqlalchemy import Column, Integer, String
from app.db.session import Base

class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    firstName = Column("firstName", String(50))   # snake_case attribute, camelCase column
    lastName = Column("lastName", String(50))
    email = Column("email", String(100), unique=True, index=True)
    phone = Column("phone", String(20))
    hashed_password = Column("hashedPassword", String(255))
    password = Column("password", String(255))
    role = Column("role", Integer)
    preschoolId = Column("preschoolId", Integer)
    qualification = Column("qualification", String(255))
    # ...other fields...