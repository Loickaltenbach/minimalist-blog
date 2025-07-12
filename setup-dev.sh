#!/bin/bash

echo "🛠️  Setting up development environment for Minimalist Blog"
echo "=========================================================="

# Install production dependencies
echo "📦 Installing production dependencies..."
pip3 install -r requirements.txt

# Install development dependencies
echo "🔧 Installing development dependencies..."
pip3 install black isort flake8 pre-commit

# Install pre-commit hooks
echo "🪝 Installing pre-commit hooks..."
pre-commit install

# Run initial code formatting
echo "🎨 Running initial code formatting..."
black .
isort .

echo ""
echo "✅ Development environment setup complete!"
echo ""
echo "🚀 Available commands:"
echo "   • python3 manage.py runserver  - Start development server"
echo "   • python3 manage.py test       - Run tests"
echo "   • black .                      - Format code"
echo "   • isort .                      - Sort imports"
echo "   • flake8 .                     - Check code quality"
echo "   • pre-commit run --all-files   - Run all pre-commit hooks"
