#!/bin/bash

# Setup script for data-projects workspace
# Works on both Linux and macOS

set -e  # Exit on error

echo "🚀 Setting up data-projects workspace..."
echo ""

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3 first."
    exit 1
fi

echo "✓ Python 3 found: $(python3 --version)"
echo ""

# Create virtual environment
if [ -d "venv" ]; then
    echo "⚠️  Virtual environment already exists. Skipping creation."
else
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
    echo "✓ Virtual environment created"
fi
echo ""

# Activate virtual environment
echo "🔄 Activating virtual environment..."
source venv/bin/activate
echo "✓ Virtual environment activated"
echo ""

# Upgrade pip
echo "⬆️  Upgrading pip..."
pip install --upgrade pip --quiet
echo "✓ pip upgraded"
echo ""

# Install required packages
echo "📥 Installing required packages from requirements.txt..."
echo "   - jupyterlab"
echo "   - ipywidgets"
echo "   - plotly"
echo "   - pandas"
echo "   - numpy"
echo "   - scikit-learn"
echo "   - tqdm"
echo ""

pip install -r requirements.txt --quiet

echo ""
echo "✅ Setup complete!"
echo ""
echo "📝 Next steps:"
echo "   1. Activate the virtual environment: source venv/bin/activate"
echo "   2. Open the workspace: code data-projects.code-workspace"
echo ""
echo "🎯 Or run Jupyter Lab directly:"
echo "   source venv/bin/activate && jupyter lab"
echo ""
