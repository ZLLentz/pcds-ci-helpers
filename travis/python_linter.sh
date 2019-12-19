#!/bin/bash
# usage: 
#   * set LINT_PYTHON to be the arguments to flake8 (e.g., package name)
#   * source `python_linter.sh` on Travis CI

pip install flake8
linter_header=$(cat <<EOF
Working directory: $PWD

=====================
Python linter results
=====================

EOF
)

linter_footer=$(cat <<'EOF'
=====================
EOF
)

echo "$linter_header"
echo "$ flake8 $LINT_PYTHON"
flake8 $LINT_PYTHON; FLAKE8_EXIT_CODE=$?
echo "$linter_footer"
if [ $FLAKE8_EXIT_CODE -ne 0 ]; then
    echo "Exit code: $FLAKE8_EXIT_CODE" 
fi

sleep 1.0

exit $FLAKE8_EXIT_CODE