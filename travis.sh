#!/bin/bash
#
# File:         travis.sh
# Created:      200520
#

### FUNCTIONS ###

 docker_hub()
 {
  typeset target="$1"

  [ -z "$DOCKER_PASSWORD" -o -z "$DOCKER_USERNAME" ] && { echo "docker_hub: Docker environment not set-up correctly"; return 1; }
  echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
  rc=$?
  [ $rc -ne 0 ] && { echo "docker_hub: Docker hub login failed with rc = $rc"; return $rc; }

  return 0
 }

### MAIN ###

 make build

 build_rc="$?"
 echo "build_rc: $build_rc"
 [ $build_rc -eq 0 ] && docker_hub && make push
 exit $build_rc

### EOF ###
