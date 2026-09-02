#!/bin/bash

wrkdir="/g/data/p93/pjb581/experiments"
target=9
nexp=100

cd "$wrkdir" || exit 1

n_done=0
n_need=0
n_missing=0

for nn in $(seq 1 1 "$nexp"); do

    expdir="${wrkdir}/om3_mom6_1D-SOTSfull_optimal${nn}"
    archivedir="${expdir}/archive"

    if [[ ! -d "$expdir" ]]; then
        echo "Experiment directory missing: om3_mom6_1D-SOTSfull_optimal${nn}"
        n_missing=$((n_missing+1))
        continue
    fi

    latest=-1

    # Find latest existing outputXXX directory
    for outdir in "${archivedir}"/output[0-9][0-9][0-9]; do
        [[ -d "$outdir" ]] || continue

        base=$(basename "$outdir")       # output009
        num=${base#output}               # 009
        num=$((10#$num))                 # force base-10 conversion

        if (( num > latest )); then
            latest=$num
        fi
    done

    if (( latest >= target )); then
        echo "Experiment ${nn}: already complete to output$(printf "%03d" "$latest")"
        n_done=$((n_done+1))
        continue
    fi

    if (( latest < 0 )); then
        nrun=$((target + 1))
        echo "Experiment ${nn}: no outputs found; running ${nrun} cycles"
    else
        nrun=$((target - latest))
        echo "Experiment ${nn}: latest output$(printf "%03d" "$latest"); running ${nrun} more cycles"
    fi

    n_need=$((n_need+1))

    cd "$expdir" || continue

    payu sweep
    payu setup
    payu run -f -n "$nrun"

done

echo
echo "Summary:"
echo "${n_done} experiments already complete to output009 or beyond"
echo "${n_need} experiments submitted/restarted"
echo "${n_missing} experiment directories missing"
