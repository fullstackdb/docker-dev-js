#!/bin/bash
set -e

cd k8s

# read tag from command line
while [ $# -gt 0 ]; do
  case "$1" in
    --tag=*)
      TAG="${1#*=}"
      ;;
    *)
      printf "***************************\n"
      printf "* Error: Invalid argument.*\n"
      printf "***************************\n"
      exit 1
  esac
  shift
    case "$1" in
    --component=*)
      COMPONENT="${1#*=}"
      ;;
    *)
      printf "***************************\n"
      printf "* Error: Invalid component argument.*\n"
      printf "***************************\n"
      exit 1
  esac
  shift

done

echo "Component $COMPONENT"
echo "Tag $TAG"

collect () {
  find apps/$COMPONENT \
    -name "$1.yml" \
    | xargs -I % sh -c 'cat %; echo "\n---";' \
    | sed -e 's/{app:master}/app:'$2'/g' 
}

# find the files deploy.yaml inside apps folder
collect "deploy" $TAG | kubectl apply -f  -
# collect "deploy"
# collect "expose"
# collect "expose" | kubectl apply -f - --force