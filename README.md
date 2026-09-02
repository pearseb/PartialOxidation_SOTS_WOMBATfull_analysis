# Partial oxidation experiments with WOMBAT-full at SOTS

Analysis, parameter optimisation, and experiment-generation code for investigating the role of **partial oxidation of organic carbon by marine heterotrophic bacteria** in Southern Ocean carbon cycling using the process-rich **WOMBAT-full** marine biogeochemical model.

The experiments use a one-dimensional MOM6/WOMBAT-full configuration at the **Southern Ocean Time Series (SOTS)** site.

The main scientific objective is to examine how bacterial processing of particulate and dissolved organic carbon affects:

* dissolved organic carbon accumulation and composition;
* microbial community structure;
* nutrient and iron regeneration;
* biological carbon cycling; and
* seasonal air–sea CO2 exchange.

## Repository structure

```text
PartialOxidation_SOTS_WOMBATfull_analysis/
│
├── data/
│   ├── observations/
│   ├── output/
│   ├── apriori_parameter_ranges_SOTSexps.xlsx
│   ├── parameter_sets_2048.*
│   ├── parameter_norm_2048.*
│   ├── optimisation_sets_2048.*
│   └── optimisation_norm_2048.*
│
├── scripts/
│   ├── SOTS_analysis.ipynb
│   ├── SOTS_observations.ipynb
│   ├── generate_parameter_set.ipynb
│   ├── generate_parameter_set_optimisation.ipynb
│   ├── sensitivity_analysis.ipynb
│   ├── sensitivity_analysis_optimisation.ipynb
│   ├── optimisation_40parameters.ipynb
│   ├── assess_performance.ipynb
│   ├── assess_performance-optimisation.ipynb
│   └── assess_performance-optimal100.ipynb
│
├── make_exps.sh
├── check_exps.sh
├── clean_exps.sh
├── make_opts.sh
├── check_opts.sh
├── clean_opts.sh
├── make_opt100.sh
└── check_opt100.sh
```

## Analysis workflow

### 1. SOTS observations

```text
scripts/SOTS_observations.ipynb
```

Processes observational datasets used to evaluate the 1D SOTS configuration.

Observational data used by the analysis are stored under:

```text
data/observations/
```

These include physical and biogeochemical observations from the SOTS region, including hydrography, nutrients, chlorophyll, particulate organic carbon and dissolved iron.

### 2. Parameter sensitivity experiments

```text
scripts/generate_parameter_set.ipynb
scripts/sensitivity_analysis.ipynb
```

These notebooks generate and analyse the 2048 parameter set ensemble used to evaluate the sensitivity of WOMBAT-full at SOTS.

The resulting parameter sets are stored in:

```text
data/parameter_sets_2048.txt
data/parameter_sets_2048.xlsx
```

with corresponding normalised parameter values in:

```text
data/parameter_norm_2048.txt
data/parameter_norm_2048.xlsx
```

The shell script

```text
make_exps.sh
```

constructs the individual model experiments, modifies the WOMBAT `field_table` for each parameter set, and submits the simulations using [Payu](https://payu.readthedocs.io/).

### 3. Parameter optimisation

The reduced parameter set used for optimisation is generated and analysed using:

```text
scripts/generate_parameter_set_optimisation.ipynb
scripts/sensitivity_analysis_optimisation.ipynb
scripts/optimisation_40parameters.ipynb
```

The corresponding parameter ensembles are stored in:

```text
data/optimisation_sets_2048.*
data/optimisation_norm_2048.*
```

Model performance is assessed using:

```text
scripts/assess_performance.ipynb
scripts/assess_performance-optimisation.ipynb
scripts/assess_performance-optimal100.ipynb
```

The `make_*`, `check_*`, and `clean_*` shell scripts are used to create, run, check, restart, and clean the associated Payu experiment ensembles.

## Partial oxidation experiments

The final experiments explore two organic-carbon processing pathways.

### Particle-associated bacterial processing

The parameter `pbac_alpha` controls the fraction of particulate organic carbon processed by an implicit particle-associated bacterial pathway that is transferred to DOC rather than completely oxidised to CO2.

Experiment names represent this using:

```text
pa0p0
pa1p0
```

where:

* `pa0p0` — POC is remineralised directly to CO2;
* `pa1p0` — processed POC is transferred to DOC.

### Explicit sharing bacterial processing

The parameter `lbac_alpha` controls the fraction of organic carbon consumed by the explicit sharing bacterial community that undergoes partial rather than complete oxidation.

For example:

```text
la0p00 =  0% partial oxidation
la0p05 =  5% partial oxidation
la0p50 = 50% partial oxidation
la0p95 = 95% partial oxidation
```

Increasing `lbac_alpha` therefore progressively redirects carbon away from immediate CO2 production and towards a more oxidised DOC pool.

The final experiment ensemble consists of a `pa0p0` reference simulation and a `pa1p0` experiment series spanning `lbac_alpha = 0.00–0.95`.

## Main analysis

```text
scripts/SOTS_analysis.ipynb
```

contains the primary analysis of the WOMBAT-full SOTS simulations and the partial-oxidation experiment ensemble.

This includes comparison of the simulations with SOTS observations and analysis of changes in carbon cycling, microbial dynamics, nutrients, DOC pools and air–sea CO2 exchange.

## Model output

The complete WOMBAT-full model experiments and restart files are archived separately on Zenodo:

**Zenodo:** `https://doi.org/10.5281/zenodo.22242451`

The Zenodo archive contains the 21 final partial-oxidation experiments together with their model configuration, annual output and restart files, WOMBAT-full initial conditions, and model executable.

Each experiment contains ten model years:

```text
output000/
...
output009/

restart000/
...
restart009/
```

The archived `field_table` files record the WOMBAT parameterisation used in each experiment, while `config.yaml` records the Payu/model configuration.

## Running the ensemble scripts

The shell scripts in this repository were written for experiments run on the Australian NCI supercomputer and contain user- and project-specific filesystem paths such as `/g/data/...`.

They therefore document the workflow used for the experiments but are **not directly portable** to another system without modification of paths, experiment templates and Payu configuration.

For information on configuring and running model experiments with Payu, see:

https://payu.readthedocs.io/

## Associated model

These experiments use the process-rich **WOMBAT-full** marine biogeochemical model coupled to a one-dimensional MOM6 configuration representing the SOTS site.

The model configuration includes explicit representations of multiple phytoplankton, zooplankton and microbial functional groups, particulate and dissolved organic matter cycling, iron cycling, and air–sea carbon exchange.

## Citation

If using the analysis code or model output from this repository, please cite the associated publication and Zenodo dataset.

Publication:

```text
ADD PAPER CITATION
```

Dataset:

```text
https://doi.org/10.5281/zenodo.22242451
```

