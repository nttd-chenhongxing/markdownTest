#!/bin/bash
# Simple test script to validate markdown files

echo "Running markdown tests..."

# Check if test.md exists and is readable
if [ -f "test.md" ]; then
    echo "✓ test.md exists"
else
    echo "✗ test.md not found"
    exit 1
fi

# Check if test-sjis.md exists and is readable
if [ -f "test-sjis.md" ]; then
    echo "✓ test-sjis.md exists"
else
    echo "✗ test-sjis.md not found"
    exit 1
fi

# Check if readme exists
if [ -f "readme" ]; then
    echo "✓ readme exists"
else
    echo "✗ readme not found"
    exit 1
fi

# Verify test.md is UTF-8
if file test.md | grep -q "UTF-8"; then
    echo "✓ test.md is UTF-8 encoded"
else
    echo "✗ test.md encoding issue"
    exit 1
fi

# Verify test.md contains tables
if grep -q "|" test.md; then
    echo "✓ test.md contains table syntax"
else
    echo "✗ test.md missing table syntax"
    exit 1
fi

echo ""
echo "All tests passed!"
exit 0
