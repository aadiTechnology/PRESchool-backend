from pydantic import BaseModel, Field, validator
from typing import Optional
from datetime import datetime

class UserCreate(BaseModel):
    firstName: str
    lastName: str
    email: str
    phone: str
    password: str
    confirmPassword: str
    role_id: int

    @validator("confirmPassword")
    def passwords_match(cls, v, values):
        if "password" in values and v != values["password"]:
            raise ValueError("Passwords do not match")
        return v

    class Config:
        allow_population_by_field_name = True
        from_attributes = True

class UserOut(BaseModel):
    id: int
    firstName: str
    lastName: str
    email: str
    phone: str
    role_id: int

    class Config:
        orm_mode = True
        allow_population_by_field_name = True
        by_alias = True
        from_attributes = True

class UserUpdate(BaseModel):
    firstName: str = None
    lastName: str = None
    email: str = None
    phone: str = None
    password: str = None