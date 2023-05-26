SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

REQUIREMENTS_LOCK="$(realpath ${SCRIPT_DIR}/../third_party/pip_deps/requirements_lock.txt)"
pip freeze > $REQUIREMENTS_LOCK
cat "$REQUIREMENTS_LOCK"