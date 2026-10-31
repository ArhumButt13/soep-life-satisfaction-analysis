# Determinants of Life Satisfaction — SOEP Panel Data

Course project in **R** exploring how blood donation, health, citizenship and employment status relate to self-reported life satisfaction in Germany, using the **German Socio-Economic Panel (SOEP)**, 1984–2021.

## Research question
Do people who donate blood report higher life satisfaction? How do health, citizenship and employment relate to life satisfaction?

## Data
| Variable | SOEP code | Description |
|---|---|---|
| Life satisfaction | `plh0182` | Current life satisfaction, 0–10 |
| Blood donation | `plh0131_v1` | Donated blood |
| German citizenship | `plj0014_v3` | German citizen |
| Citizenship | `plj0014_v2` | Country of citizenship |
| Employment status | `plb0037_h` | Permanent vs. temporary contract |
| Self-rated health | `ple0008` | 1 = very good … 5 = bad |

> **Data not included.** SOEP data is licensed by DIW Berlin and cannot be shared publicly. Access can be requested at [diw.de/soep](https://www.diw.de/soep).

## Methods
- Data preparation with `dplyr` (variable selection, renaming)
- Exploratory analysis and visualisation with `ggplot2`
- Correlation analysis
- Multiple linear regression (OLS)

## Main results (original analysis)
- The OLS model explains little of the variation in life satisfaction (R² ≈ 0.02).
- The blood donation coefficient is very small (0.006), although statistically significant.
- Self-rated health shows the strongest association with life satisfaction.

## Limitations & next steps
This was a learning project, and a review identified several improvements:
- **SOEP missing codes:** negative values (−1 to −8) should be recoded to `NA` before analysis.
- **Categorical variables:** blood donation, citizenship and employment should be modelled as factors, not as numeric variables.
- **Panel structure:** repeated observations per person call for clustered standard errors or fixed-effects models, for example with `fixest`.
- **Interpretation:** results are associations, not causal effects.

## Repository structure
```
├── happiness_analysis.R   # analysis script
└── README.md
```

## Tools
R · RStudio · tidyverse (dplyr, ggplot2) · haven

## Author
Muhammad Arhum Butt — MSc IBA, Data Science & Decision Systems, Europa-Universität Viadrina
