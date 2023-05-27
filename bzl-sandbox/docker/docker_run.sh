usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") 

Script description here.

Available options:

-h, --help      Print this help and exit
-v, --verbose   Print script debug info
-f, --file      The path to the tarball file to load an image from.
-c, --container Name of the container
-l, --load-only If true, only load the docker's local rep. Don't run it.
EOF
  exit
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  # script cleanup here
}

setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
  else
    NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

msg() {
  echo >&2 -e "${1-}"
}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}


parse_params() {
  # default values of variables set from params
  tarball_file=""
  load_only=0

  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    --no-color) NO_COLOR=1 ;;
    -l | --load-only) load_only=1 ;; 
    -f | --file) tarball_file="${2-}" ; shift ;;
    # -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  args=("$@")

  # check required params and arguments
  [[ -z "${tarball_file-}" ]] && die "Missing required parameter: file"
  [[ ${#args[@]} -eq 0 ]] && die "Missing script arguments"

  return 0
}

parse_params "$@"
setup_colors

# script logic here

get_tag_from_tar() {
  printf "$(tar -xOf $1 | jq -r '.[] | .RepoTags | add' 2> /dev/null)"
}

if ! command -v jq &> /dev/null
then
    echo "This script requires jq be installed on your machine."
    echo "https://github.com/stedolan/jq"
    exit
fi


verb=""
if [ "$load_only" ] ; then
  verb="Loading"
else
  verb="Running"
fi
tag="$(get_tag_from_tar "$tarball_file")"
msg "${RED}$verb docker with the following:${NOFORMAT}"
msg "- ${GREEN}tarball_file${NOFORMAT}: ${tarball_file}"
msg "- ${GREEN}tag${NOFORMAT}: ${tag}"
msg "- ${GREEN}load_only${NOFORMAT}: ${load_only}"
msg "- ${GREEN}docker args${NOFORMAT}: ${args[*]-}"

set -x
docker load --input "$tarball_file"
if [ "$load_only" ] ; then
  docker run --rm ${args[*]-} "$tag" 
fi


