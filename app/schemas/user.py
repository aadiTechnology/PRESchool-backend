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
    role: int
    preschoolId: Optional[int]
    qualification: Optional[str]

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
    role: int
    preschoolId: Optional[int]
    qualification: Optional[str]

    class Config:
        orm_mode = True
        allow_population_by_field_name = True
        by_alias = True
        from_attributes = True

class UserUpdate(BaseModel):
    firstName: Optional[str]
    lastName: Optional[str]
    email: Optional[str]
    phone: Optional[str]
    password: Optional[str]
    role: Optional[int]
    preschoolId: Optional[int]
    child_name: Optional[str]
    child_age: Optional[int]
    otp: Optional[str]
    otp_expiry: Optional[datetime]
    class_id: Optional[int]
    division_id: Optional[int]
    qualification: Optional[str]