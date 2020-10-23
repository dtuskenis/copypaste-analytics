#!/bin/sh

EX_PATH=$(pwd)
REPO_PATH=$1

for i in $(seq 1 7 730)
do
    currentDate=$(date -v -"${i}"d '+%Y-%m-%d')

    cd ${REPO_PATH}

    git reset --hard
    git clean -xffd
    git checkout "$(git rev-list -1 --date=short --before="${currentDate}" develop)" --quiet

    cd ${EX_PATH}

    sh ./generate-report.sh reports/"${currentDate}" $REPO_PATH
done
