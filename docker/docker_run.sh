usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") 

Script description here.

Available options:

-h, --help      Print this help and exit
-v, --verbose   Print script debug info
-l, --load-only If true, only load the docker's local rep. Don't run it.
-f, --file      The path to the tarball file to load an image from.
-t, --tag       container:tag name, if not provided jq extracts this from the tarball
EOF
  exit $1
}

msg() {
  echo >&2 -e "${1-}"
}

tarball_file=""
load_only=0
tag=""
verbose=0
no_color=0
PARSED_ARGUMENTS=$(getopt -a -n docker_run.sh -o hvlf:t: --long help,verbose,load-only,file:,tag: -- "$@")
VALID_ARGUMENTS=$?
if [ "$VALID_ARGUMENTS" != "0" ]; then
  usage 1
fi
printf "Parsed args are: $PARSED_ARGUMENTS\n"
eval set -- "$PARSED_ARGUMENTS"
# default values of variables set from params
while : ; do
  case "${1}" in
  -h | --help) usage 0             ; shift ;;
  -v | --verbose) verbose=1        ; shift ;;
  --no-color) NO_COLOR=1           ; shift ;;
  -l | --load-only) load_only=1    ; shift ;;
  -f | --file) tarball_file="${2}" ; shift 2 ;;
  -t | --tag) tag="${2}"           ; shift 2 ;;
  --) shift; break ;;

  *) echo "Unexpected option: $1 - this should not happen." ; echo "Parameters remaining are: $@" ; usage 1 ;;
  esac
done
args=("$@") 
# check required params and arguments
[[ -z "${tarball_file-}" ]] && die "Missing required parameter: file"


setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
  else
    NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}


setup_colors

# script logic here

get_tag_from_tar() {
  printf "$(tar -xOf $1 | jq -r '.[] | .RepoTags | add' 2> /dev/null)"
}


if [[ ! -z "${tag-}" ]] ; then
  if ! command -v jq &> /dev/null ; then
      echo "Tag must be provided using -t if jq isn't installed on host machine."
      echo "https://github.com/stedolan/jq"
      exit
  fi
else
  tag="$(get_tag_from_tar "$tarball_file")"
fi


verb=""
if [ "$load_only" = "0" ] ; then
  verb="Loading"
else
  verb="Running"
fi

msg "${RED}$verb docker with the following:${NOFORMAT}"
msg "- ${GREEN}tarball_file${NOFORMAT}: ${tarball_file}"
msg "- ${GREEN}tag${NOFORMAT}: ${tag}"
msg "- ${GREEN}load_only${NOFORMAT}: ${load_only}"
msg "- ${GREEN}docker args${NOFORMAT}: ${args[*]}"

set -x
docker load --input "$tarball_file"
if [ "$load_only" = "0" ]; then
  docker run --rm ${args[*]} $tag
fi


