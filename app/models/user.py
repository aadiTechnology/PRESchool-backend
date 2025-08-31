from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from app.db.session import Base

class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    firstName = Column("firstName", String(50))
    lastName = Column("lastName", String(50))
    email = Column("email", String(100), unique=True, index=True)
    phone = Column("phone", String(20))
    hashed_password = Column("hashedPassword", String(255))
    password = Column("password", String(255))
    role_id = Column(Integer, ForeignKey("roles.id"), nullable=False)
    role = relationship("Role")