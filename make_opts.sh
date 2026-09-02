#!/bin/bash -l

wrkdir="/g/data/p93/pjb581/experiments/"
cd $wrkdir

for nn in $(seq 3 1 2048); do
  wrkdir="/g/data/p93/pjb581/experiments/"
  cd $wrkdir
  cp -r om3_mom6_1D-SOTSfull_opt om3_mom6_1D-SOTSfull_opt${nn}/
done

for nn in $(seq 3 1 2048); do
  cd $wrkdir
  cd om3_mom6_1D-SOTSfull_opt${nn}/
  cp ../om3_mom6_1D-SOTSfull_opt/field_table ./

  nrow=$((nn+1))
  param_file="/g/data/vn19/pjb581/SOTS-Optimization/WOMBATfull/data/optimisation_sets_2048.txt"
  for i in $(seq 1 40); do
    col=$((i + 1))
    eval "p${i}=\$(awk -v row=\"\$nrow\" -v col=\"\$col\" 'NR == row {print \$col}' ${param_file})"
  done

  echo ${p1}, ${p40}

  p8a=$(bc -l <<< "scale=16; e(l(10)*$p8) / 86400")
  p11a=$(bc -l <<< "scale=16; e(l(10)*$p11) / 86400")
  p17a=$(bc -l <<< "scale=16; e(l(10)*$p17) / 86400")
  p21a=$(bc -l <<< "scale=16; e(l(10)*$p21) / 86400")
  p32a=$(bc -l <<< "scale=16; e(l(10)*$p32) / 86400")
  p33a=$(bc -l <<< "scale=16; e(l(10)*$p33) / 86400")
  p35a=$(bc -l <<< "scale=16; e(l(10)*$p35) / 86400")
  p39a=$(bc -l <<< "scale=16; e(l(10)*$p39) / 86400")

  sed -i "s/alphabio_phy = 3.50/alphabio_phy = ${p1}/" field_table
  sed -i "s/abioa_phy = 1.688E-05/abioa_phy = ${p2}/" field_table
  sed -i "s/bbioa_phy = 1.060/bbioa_phy = ${p3}/" field_table
  sed -i "s/abioa_dia = 1.157E-05/abioa_dia = ${p4}/" field_table
  sed -i "s/bbioh = 1.070/bbioh = ${p5}/" field_table
  sed -i "s/phykf = 0.70/phykf = ${p6}/" field_table
  sed -i "s/phymaxqc = 0.0125/phymaxqc = ${p7}/" field_table
  sed -i "s/phylmor = 2.00E-08/phylmor = ${p8a}/" field_table
  sed -i "s/diamaxqs = 0.60/diamaxqs = ${p9}/" field_table
  sed -i "s/diaVmaxs = 2.894E-06/diaVmaxs = ${p10}/" field_table
  sed -i "s/dialmor = 2.00E-08/dialmor = ${p11a}/" field_table
  sed -i "s/overflow = 0.50/overflow = ${p12}/" field_table
  sed -i "s/zooCingest = 0.725/zooCingest = ${p13}/" field_table
  sed -i "s/zooCassim = 0.45/zooCassim = ${p14}/" field_table
  sed -i "s/zooepslbac = 4.642E-06/zooepslbac = ${p15}/" field_table
  sed -i "s/zooepsobac = 4.642E-06/zooepsobac = ${p15}/" field_table
  sed -i "s/zooepssbac = 4.642E-06/zooepssbac = ${p15}/" field_table
  sed -i "s/zooepsaoa = 4.642E-06/zooepsaoa = ${p15}/" field_table
  sed -i "s/zooepsphy = 4.642E-06/zooepsphy = ${p15}/" field_table
  sed -i "s/zooepsdia = 4.642E-06/zooepsdia = ${p15}/" field_table
  sed -i "s/zooepssdet = 4.642E-06/zooepssdet = ${p15}/" field_table
  sed -i "s/zprefdia = 0.505/zprefdia = ${p16}/" field_table
  sed -i "s/zoolmor = 2.315E-08/zoolmor = ${p17a}/" field_table
  sed -i "s/mesCassim = 0.50/mesCassim = ${p18}/" field_table
  sed -i "s/mesepslbac = 1.215E-06/mesepslbac = ${p19}/" field_table
  sed -i "s/mesepsobac = 1.215E-06/mesepsobac = ${p19}/" field_table
  sed -i "s/mesepssbac = 1.215E-06/mesepssbac = ${p19}/" field_table
  sed -i "s/mesepsaoa = 1.215E-06/mesepsaoa = ${p19}/" field_table
  sed -i "s/mesepsphy = 1.215E-06/mesepsphy = ${p19}/" field_table
  sed -i "s/mesepsdia = 1.215E-06/mesepsdia = ${p19}/" field_table
  sed -i "s/mesepssdet = 1.215E-06/mesepssdet = ${p19}/" field_table
  sed -i "s/mesepsldet = 1.215E-06/mesepsldet = ${p19}/" field_table
  sed -i "s/mesepszoo = 1.215E-06/mesepszoo = ${p19}/" field_table
  sed -i "s/mprefphy = 0.5/mprefphy = ${p20}/" field_table
  sed -i "s/meslmor = 2.315E-08/meslmor = ${p21a}/" field_table
  sed -i "s/mesqmor = 5.787E-06/mesqmor = ${p22}/" field_table
  sed -i "s/mespreyswitch = 2.0/mespreyswitch = ${p23}/" field_table
  sed -i "s/detqrem = 8.102E-06/detqrem = ${p24}/" field_table
  sed -i "s/ldetphi = 0.87/ldetphi = ${p25}/" field_table
  sed -i "s/phyrad0 = 11.0/phyrad0 = ${p26}/" field_table
  sed -i "s/diarad0 = 100.0/diarad0 = ${p27}/" field_table
  sed -i "s/zoorad0 = 27.5/zoorad0 = ${p28}/" field_table
  sed -i "s/phybiot = 1.50/phybiot = ${p29}/" field_table
  sed -i "s/diabiot = 1.50/diabiot = ${p30}/" field_table
  sed -i "s/dfefloor = 0.025/dfefloor = ${p31}/" field_table
  sed -i "s/kscav_dfe = 1.157E-07/kscav_dfe = ${p32a}/" field_table
  sed -i "s/kcoag_dfe = 5.840E-10/kcoag_dfe = ${p33a}/" field_table
  sed -i "s/bsi_alpha = -10.0/bsi_alpha = ${p34}/" field_table
  sed -i "s/aoalmor = 2.00E-08/aoalmor = ${p35a}/" field_table
  sed -i "s/pbac_alpha = 1.00/pbac_alpha = ${p36}/" field_table
  sed -i "s/lbac_alpha = 0.80/lbac_alpha = ${p37}/" field_table
  sed -i "s/lbac_beta = 0.10/lbac_beta = ${p38}/" field_table
  sed -i "s/baclmor = 2.00E-08/baclmor = ${p39a}/" field_table
  sed -i "s/bacqmor = 1.157E-06/bacqmor = ${p40}/" field_table

done

wrkdir="/g/data/p93/pjb581/experiments/"
cd $wrkdir
for nn in $(seq 1 1 500); do
  cd $wrkdir
  cp om3_mom6_1D-SOTSfull_opt${nn}/field_table tmp_field_table/field_table_${nn}
done


wrkdir="/g/data/p93/pjb581/experiments/"
cd $wrkdir

# run the simulations
for nn in $(seq 1988 1 2048); do
  cd $wrkdir
  cd om3_mom6_1D-SOTSfull_opt${nn}
  sed -i "s/jobname: SOTSfull/jobname: SOTSfullopt${nn}/" config.yaml
  #sed -i "s/315.165e-06/395.30E-06/" data_table
  payu sweep; payu setup; payu run -f -n 10
done


