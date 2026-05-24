#!/bin/bash

echo "Creating Python Virtual Environment..."
python3 -m venv .venv

echo "Upgrading pip"
./.venv/bin/python -m pip install --upgrade pip

echo "Installing Required Packages..."
./.venv/bin/pip install -r requirements.txt -q -q

echo "Done Installing"