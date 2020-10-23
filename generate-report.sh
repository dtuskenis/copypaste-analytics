#!/bin/sh

OUT_PATH=$1

REPO_PATH=$2

mkdir -p "${OUT_PATH}"

echo "Generating CPD report at ${OUT_PATH}"

for lang in java kotlin
do
    for tokens in 20 50 100
    do
        outfile=${OUT_PATH}/${lang}-${tokens}.xml

        pmd cpd --minimum-tokens ${tokens} \
                --language ${lang} \
                --files ${REPO_PATH} \
                --format xml \
                > "${outfile}"

        echo "[${lang} by ${tokens} tokens] : $(sh ./how-many.sh "${outfile}") duplications"
    done
done
