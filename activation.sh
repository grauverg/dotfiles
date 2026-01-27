#!/bin/bash

venv="${1:-venv}"
filename="$venv/bin/activate"

if [ -e "$filename" ]; then
    source "$filename"
    echo "Virtual environment $venv has been activated."
else 
    echo "Virtual environment $venv not found."
fi
