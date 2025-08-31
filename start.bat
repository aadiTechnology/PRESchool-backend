@echo off
REM ==== Setup virtual environment (only if not already created) ====
IF NOT EXIST venv (
    python -m venv venv
    echo Virtual environment created.
)

REM ==== Activate virtual environment ====
call venv\Scripts\activate

REM ==== Upgrade pip (only once usually) ====
python -m pip install --upgrade pip

REM ==== Install dependencies (skip if already installed) ====
pip install -r requirements.txt

REM ==== Start FastAPI with auto-reload ====
uvicorn app.main:app --reload
