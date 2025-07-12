#!/bin/bash

echo "🔍 Pre-flight Check for GitHub Actions"
echo "======================================"

# Check Python syntax
echo "🐍 Checking Python syntax..."
python3 -m py_compile blog/*.py minimalist_blog/*.py 2>/dev/null && echo "✅ Python syntax OK" || echo "❌ Python syntax errors found"

# Check if we can import Django
echo "🚀 Checking Django setup..."
python3 manage.py check && echo "✅ Django setup OK" || echo "❌ Django setup issues found"

# Run tests
echo "🧪 Running tests..."
python3 manage.py test blog && echo "✅ All tests passing" || echo "❌ Some tests failing"

# Check migrations
echo "📊 Checking migrations..."
python3 manage.py makemigrations --dry-run --check blog >/dev/null 2>&1 && echo "✅ Migrations up to date" || echo "⚠️  New migrations needed"

# Check collectstatic
echo "📁 Checking static files..."
python3 manage.py collectstatic --noinput --dry-run >/dev/null 2>&1 && echo "✅ Static files OK" || echo "⚠️  Static files check skipped (normal for dev)"

# Check flake8 (only critical errors)
if command -v flake8 &> /dev/null; then
    echo "🔍 Checking critical syntax errors..."
    flake8 . --select=E9,F63,F7,F82 --quiet && echo "✅ No critical errors" || echo "❌ Critical errors found"
else
    echo "⚠️  flake8 not installed, skipping lint check"
fi

echo ""
echo "🎯 Summary:"
echo "   If all checks show ✅, your GitHub Actions should pass!"
echo "   If any show ❌, please fix the issues before pushing"
echo ""
echo "💡 Quick fixes:"
echo "   • Install tools: pip install black isort flake8"
echo "   • Format code: black . && isort ."
echo "   • Run tests: python3 manage.py test"
