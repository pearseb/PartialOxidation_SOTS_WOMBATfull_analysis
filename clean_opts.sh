#!/bin/bash

wrkdir="/g/data/p93/pjb581/experiments"
nexp=2048
cd "$wrkdir" || exit 1

for nn in $(seq 1501 1 "$nexp"); do
    expdir="${wrkdir}/om3_mom6_1D-SOTSfull_opt${nn}"
    archivedir="${expdir}/archive"
    cd ${archivedir}
    rm -r output00[0-8]
done

