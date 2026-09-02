#!/bin/bash -l

wrkdir="/g/data/p93/pjb581/experiments/"
cd $wrkdir

for nn in $(seq 3 1 2048); do
  wrkdir="/g/data/p93/pjb581/experiments/"
  cd $wrkdir
  cp -r om3_mom6_1D-SOTSfull_exp om3_mom6_1D-SOTSfull${nn}/
done

for nn in $(seq 3 1 2048); do
  cd $wrkdir
  cd om3_mom6_1D-SOTSfull${nn}/

  nrow=$((nn+1))
  param_file="/g/data/vn19/pjb581/SOTS-Optimization/WOMBATfull/data/parameter_sets_2048.txt"
  for i in $(seq 1 87); do
    col=$((i + 1))
    eval "p${i}=\$(awk -v row=\"\$nrow\" -v col=\"\$col\" 'NR == row {print \$col}' ${param_file})"
  done

  echo ${p1}, ${p87}

  p12a=$(bc -l <<< "scale=16; e(l(10)*$p12) / 86400")
  p20a=$(bc -l <<< "scale=16; e(l(10)*$p20) / 86400")
  p35a=$(bc -l <<< "scale=16; e(l(10)*$p35) / 86400")
  p52a=$(bc -l <<< "scale=16; e(l(10)*$p52) / 86400")
  p72a=$(bc -l <<< "scale=16; e(l(10)*$p72) / 86400")
  p73a=$(bc -l <<< "scale=16; e(l(10)*$p73) / 86400")
  p78a=$(bc -l <<< "scale=16; e(l(10)*$p78) / 86400")
  p86a=$(bc -l <<< "scale=16; e(l(10)*$p86) / 86400")

  sed -i "s/alphabio_phy = 3.50/alphabio_phy = ${p1}/" field_table
  sed -i "s/abioa_phy = 1.688E-05/abioa_phy = ${p2}/" field_table
  sed -i "s/bbioa_phy = 1.060/bbioa_phy = ${p3}/" field_table
  sed -i "s/alphabio_dia = 2.5/alphabio_dia = ${p4}/" field_table
  sed -i "s/alphabio_tri = 1.125/alphabio_tri = ${p5}/" field_table
  sed -i "s/abioa_dia = 1.000E-05/abioa_dia = ${p6}/" field_table
  sed -i "s/bbioa_dia = 1.065/bbioa_dia = ${p7}/" field_table
  sed -i "s/bbioh = 1.070/bbioh = ${p8}/" field_table
  sed -i "s/phykn = 1.00/phykn = ${p9}/" field_table
  sed -i "s/phykf = 0.70/phykf = ${p10}/" field_table
  sed -i "s/phymaxqc = 0.0125/phymaxqc = ${p11}/" field_table
  sed -i "s/phylmor = 2.00E-08/phylmor = ${p12a}/" field_table
  sed -i "s/diakn = 2.0/diakn = ${p13}/" field_table
  sed -i "s/diakf = 2.0/diakf = ${p14}/" field_table
  sed -i "s/diaks = 5.0/diaks = ${p15}/" field_table
  sed -i "s/diamaxqc = 0.05/diamaxqc = ${p16}/" field_table
  sed -i "s/diamaxqf = 7.0E-05/diamaxqf = ${p17}/" field_table
  sed -i "s/diamaxqs = 0.65/diamaxqs = ${p18}/" field_table
  sed -i "s/diaVmaxs = 2.894E-06/diaVmaxs = ${p19}/" field_table
  sed -i "s/dialmor = 2.00E-08/dialmor = ${p20a}/" field_table
  sed -i "s/overflow = 0.50/overflow = ${p21}/" field_table
  sed -i "s/zooCingest = 0.725/zooCingest = ${p22}/" field_table
  sed -i "s/zooCassim = 0.45/zooCassim = ${p23}/" field_table
  sed -i "s/zooFeingest = 0.275/zooFeingest = ${p24}/" field_table
  sed -i "s/zooFeassim = 0.725/zooFeassim = ${p25}/" field_table
  sed -i "s/zooexcrdom = 0.40/zooexcrdom = ${p26}/" field_table
  sed -i "s/zoogmax = 4.051E-05/zoogmax = ${p27}/" field_table
  sed -i "s/zooepslbac = 4.642E-06/zooepslbac = ${p28}/" field_table
  sed -i "s/zooepsobac = 4.642E-06/zooepsobac = ${p28}/" field_table
  sed -i "s/zooepssbac = 4.642E-06/zooepssbac = ${p28}/" field_table
  sed -i "s/zooepsaoa = 4.642E-06/zooepsaoa = ${p28}/" field_table
  sed -i "s/zooepsphy = 4.642E-06/zooepsphy = ${p28}/" field_table
  sed -i "s/zooepsdia = 4.642E-06/zooepsdia = ${p28}/" field_table
  sed -i "s/zooepssdet = 4.642E-06/zooepssdet = ${p28}/" field_table
  sed -i "s/zpreflbac = 0.75/zpreflbac = ${p29}/" field_table
  sed -i "s/zprefobac = 0.75/zprefobac = ${p30}/" field_table
  sed -i "s/zprefsbac = 0.75/zprefsbac = ${p31}/" field_table
  sed -i "s/zprefaoa = 1.0/zprefaoa = ${p32}/" field_table
  sed -i "s/zprefdia = 0.505/zprefdia = ${p33}/" field_table
  sed -i "s/zprefsdet = 0.75/zprefsdet = ${p34}/" field_table
  sed -i "s/zoolmor = 2.315E-08/zoolmor = ${p35a}/" field_table
  sed -i "s/mesCingest = 0.725/mesCingest = ${p36}/" field_table
  sed -i "s/mesCassim = 0.50/mesCassim = ${p37}/" field_table
  sed -i "s/mesFeingest = 0.275/mesFeingest = ${p38}/" field_table
  sed -i "s/mesFeassim = 0.725/mesFeassim = ${p39}/" field_table
  sed -i "s/mesexcrdom = 0.40/mesexcrdom = ${p40}/" field_table
  sed -i "s/mesgmax = 1.215E-05/mesgmax = ${p41}/" field_table
  sed -i "s/mesepslbac = 1.215E-06/mesepslbac = ${p42}/" field_table
  sed -i "s/mesepsobac = 1.215E-06/mesepsobac = ${p42}/" field_table
  sed -i "s/mesepssbac = 1.215E-06/mesepssbac = ${p42}/" field_table
  sed -i "s/mesepsaoa = 1.215E-06/mesepsaoa = ${p42}/" field_table
  sed -i "s/mesepsphy = 1.215E-06/mesepsphy = ${p42}/" field_table
  sed -i "s/mesepsdia = 1.215E-06/mesepsdia = ${p42}/" field_table
  sed -i "s/mesepssdet = 1.215E-06/mesepssdet = ${p42}/" field_table
  sed -i "s/mesepsldet = 1.215E-06/mesepsldet = ${p42}/" field_table
  sed -i "s/mesepszoo = 1.215E-06/mesepszoo = ${p42}/" field_table
  sed -i "s/mpreflbac = 0.0/mpreflbac = ${p43}/" field_table
  sed -i "s/mprefobac = 0.0/mprefobac = ${p44}/" field_table
  sed -i "s/mprefsbac = 0.0/mprefsbac = ${p45}/" field_table
  sed -i "s/mprefaoa = 0.0/mprefaoa = ${p46}/" field_table
  sed -i "s/mprefphy = 0.5/mprefphy = ${p47}/" field_table
  sed -i "s/mprefdia = 0.75/mprefdia = ${p48}/" field_table
  sed -i "s/mprefsdet = 1.75/mprefsdet = ${p49}/" field_table
  sed -i "s/mprefldet = 1.75/mprefldet = ${p50}/" field_table
  sed -i "s/mprefzoo = 1.75/mprefzoo = ${p51}/" field_table
  sed -i "s/meslmor = 2.315E-08/meslmor = ${p52a}/" field_table
  sed -i "s/mesqmor = 5.787E-06/mesqmor = ${p53}/" field_table
  sed -i "s/zoopreyswitch = 2.0/zoopreyswitch = ${p54}/" field_table
  sed -i "s/mespreyswitch = 2.0/mespreyswitch = ${p55}/" field_table
  sed -i "s/detqrem = 8.102E-06/detqrem = ${p56}/" field_table
  sed -i "s/sdetphi = 0.25/sdetphi = ${p57}/" field_table
  sed -i "s/ldetphi = 0.87/ldetphi = ${p58}/" field_table
  sed -i "s/phyrad0 = 11.0/phyrad0 = ${p59}/" field_table
  sed -i "s/diarad0 = 100.0/diarad0 = ${p60}/" field_table
  sed -i "s/zoorad0 = 27.5/zoorad0 = ${p61}/" field_table
  sed -i "s/mesrad0 = 625.0/mesrad0 = ${p62}/" field_table
  sed -i "s/detrho = 1275.0/detrho = ${p63}/" field_table
  sed -i "s/phybiot = 1.50/phybiot = ${p64}/" field_table
  sed -i "s/diabiot = 1.50/diabiot = ${p65}/" field_table
  sed -i "s/disscal = 1.157E-06/disscal = ${p66}/" field_table
  sed -i "s/dissara = 1.157E-06/dissara = ${p67}/" field_table
  sed -i "s/dissdet = 0.255/dissdet = ${p68}/" field_table
  sed -i "s/ligW = 1.75/ligW = ${p69}/" field_table
  sed -i "s/ligS = 1.00/ligS = ${p70}/" field_table
  sed -i "s/dfefloor = 0.025/dfefloor = ${p71}/" field_table
  sed -i "s/kscav_dfe = 1.157E-07/kscav_dfe = ${p72a}/" field_table
  sed -i "s/kcoag_dfe = 5.840E-10/kcoag_dfe = ${p73a}/" field_table
  sed -i "s/wsafe = 5.845E-05/wsafe = ${p74}/" field_table
  sed -i "s/wlafe = 5.845E-04/wlafe = ${p75}/" field_table
  sed -i "s/bsi_alpha = -10.0/bsi_alpha = ${p76}/" field_table
  sed -i "s/bsi_kbac = 0.25/bsi_kbac = ${p77}/" field_table
  sed -i "s/aoalmor = 2.00E-08/aoalmor = ${p78a}/" field_table
  sed -i "s/pbac_alpha = 1.00/pbac_alpha = ${p79}/" field_table
  sed -i "s/lbac_kdoc = 100.0/lbac_kdoc = ${p80}/" field_table
  sed -i "s/lbac_alpha = 0.80/lbac_alpha = ${p81}/" field_table
  sed -i "s/lbac_beta = 0.10/lbac_beta = ${p82}/" field_table
  sed -i "s/obac_kdoc = 200.0/obac_kdoc = ${p83}/" field_table
  sed -i "s/obac_fele = 0.05/obac_fele = ${p84}/" field_table
  sed -i "s/sbac_kdoc = 10.0/sbac_kdoc = ${p85}/" field_table
  sed -i "s/baclmor = 2.00E-08/baclmor = ${p86a}/" field_table
  sed -i "s/bacqmor = 1.157E-06/bacqmor = ${p87}/" field_table

done

wrkdir="/g/data/p93/pjb581/experiments/"
cd $wrkdir
for nn in $(seq 1 1 2048); do
  cd $wrkdir
  cp om3_mom6_1D-SOTSfull${nn}/field_table tmp_field_table/field_table_${nn}
done


wrkdir="/g/data/p93/pjb581/experiments/"
cd $wrkdir

# run the simulations
for nn in $(seq 1601 1 1720); do
  cd $wrkdir
  cd om3_mom6_1D-SOTSfull${nn}
  sed -i "s/jobname: SOTSfull/jobname: SOTSfull${nn}/" config.yaml
  #sed -i "s/315.165e-06/395.30E-06/" data_table
  payu sweep; payu setup; payu run -f -n 10
done


