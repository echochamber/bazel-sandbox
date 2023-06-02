WORKSPACE_ROOT="$(bazel info workspace)"
BAZEL_ENV_FILE=$WORKSPACE_ROOT/.bazel.env
if [ -f $BAZEL_ENV_FILE ]
then
  export $(cat $BAZEL_ENV_FILE | xargs)
fi
