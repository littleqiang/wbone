#!/bin/bash

function package(){
    ./gradlew clean build "$@"
}

function run(){
    package && java -jar wbone-cas/wbone-cas-server/build/libs/cas-1.0-SNAPSHOT.war
}

if [ $# -eq 0 ]; then
    echo -e "No commands provided,Defaulting to [run]\n"
    run
    exit 0
fi

case "$1" in
"package")
    shift
    package "$@"
    ;;
"run")
    run "$@"
    ;;
*)
    help
    ;;
esac