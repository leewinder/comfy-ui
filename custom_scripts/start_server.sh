#!/usr/bin/env bash
set -euo pipefail

# ComfyUI Server Startup Script
# This script starts the ComfyUI server with split cross-attention enabled

echo "Starting ComfyUI server..."

# Change to the ComfyUI root directory
cd "$(dirname "$0")/.." || {
    echo "Error: Failed to change to ComfyUI root directory"
    exit 1
}

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "Error: Virtual environment not found. Please run the installation script first."
    exit 1
fi

# Source the virtual environment
echo "Activating virtual environment..."
source venv/bin/activate || {
    echo "Error: Failed to activate virtual environment"
    exit 1
}

# Check if main.py exists
if [ ! -f "main.py" ]; then
    echo "Error: main.py not found in ComfyUI root directory"
    exit 1
fi

# Start the ComfyUI server with split cross-attention
echo "Starting ComfyUI server with --use-split-cross-attention..."
python main.py --use-split-cross-attention || {
    echo "Error: Failed to start ComfyUI server"
    exit 1
}