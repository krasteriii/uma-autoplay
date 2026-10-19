@echo off
REM Change directory to the script location
cd /d "%~dp0"

REM Run the Python script with uv.
REM - Python is pinned to 3.13: torch 2.7.1 has no wheels for newer Pythons.
REM - PyPI's Windows torch is CPU-only, so the CUDA 12.6 build comes from the PyTorch index.
REM   unsafe-best-match lets uv take the rest of the pins from PyPI, because the PyTorch
REM   index carries only some versions of packages such as idna and numpy.
uv run --python 3.13 --with-requirements requirements.txt --index https://download.pytorch.org/whl/cu126 --index-strategy unsafe-best-match main.py

REM Keep the window open after execution (optional)
pause
