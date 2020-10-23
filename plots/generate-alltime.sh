#!/bin/sh

rm -rf data
mkdir data

mkdir -p alltime

for tokens in 20 50 100; do
    plotDataFilename=${tokens}

    for dayReportPath in ../reports/*; do
        date=${dayReportPath##*/}

        numberOfDuplications=0

        for lang in java kotlin
        do
            reportFilename=${lang}-${tokens}
            numberOfDuplicationsPerLanguage=$(echo "$(sh ../how-many.sh ${dayReportPath}/${reportFilename}.xml)")
            numberOfDuplications=$(($numberOfDuplications + $numberOfDuplicationsPerLanguage))
        done

        echo "${date}\t${numberOfDuplications}" >> data/${plotDataFilename}.txt
    done

    title="Duplications of minimum ${tokens} tokens"

    gnuplot -c ./alltime.gp ${plotDataFilename} "${title}"
done

rm -rf data
