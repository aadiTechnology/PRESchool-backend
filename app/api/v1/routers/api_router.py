from fastapi import APIRouter
from app.api.v1.routers import auth
from app.api.v1.routers import admin
from app.api.v1.routers import login
from app.api.v1.routers import role

api_router = APIRouter()

api_router.include_router(auth.router, tags=["auth"])
api_router.include_router(admin.router, tags=["admin"])
api_router.include_router(login.router, tags=["login"])
api_router.include_router(role.router, tags=["role"])