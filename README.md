[![Build Status](https://travis-ci.org/DavidPatShuiFong/framinghamRiskEquation.svg?branch=develop)](https://travis-ci.org/DavidPatShuiFong/framinghamRiskEquation)

[![Codecov test coverage](https://codecov.io/gh/DavidPatShuiFong/framinghamRiskEquation/branch/master/graph/badge.svg)](https://codecov.io/gh/DavidPatShuiFong/framinghamRiskEquation?branch=master)

Github repository at
<a href="https://github.com/DavidPatShuiFong/framinghamRiskEquation" class="uri">https://github.com/DavidPatShuiFong/framinghamRiskEquation</a>

``` r
library(framinghamRiskEquation)
packageVersion("framinghamRiskEquation")
#> [1] '0.1.0'
```

Documentation
=============

``` r
?framinghamRiskEquation::framingham_riskequation
#> Framingham Risk Equation
#> 
#> Description:
#> 
#>      Calculate cardiovascular disease risk according to Framingham Risk
#>      Equation
#> 
#> Usage:
#> 
#>      framingham_riskequation(df, years = 5, outcome = "CVD")
#>      
#> Arguments:
#> 
#>       df: a dataframe, which must include the following columns/fields:
#> 
#>             • InternalID (numeric) case identifier
#> 
#>             • CardiovascularDisease (logical - TRUE or FALSE)
#> 
#>             • Diabetes (logical)
#> 
#>             • SmokingStatus (character) - "Smoker" if a smoker. All
#>               other values ignored
#> 
#>             • UrineAlbuminDate (character), UrineAlbuminValue (double),
#>               UrineAlbuminUnit (character)
#> 
#>             • PersistentProteinuria (logical)
#> 
#>             • eGFRDate (date), eGFRValue (double), eGFRUnits
#>               (character)
#> 
#>             • FamilialHypercholesterolaemia (logical)
#> 
#>             • LVH (logical) = left ventricular hyp0ertrophy
#> 
#>             • Cholesterol (double) in millimoles per litre (mmol/L or
#>               mM)
#> 
#>             • Triglycerides (double) in millimoles per litre (mmol/L or
#>               mM)
#> 
#>             • CholHDLRatio (double)
#> 
#>             • BP (character, two numbers separated by "/") in mmHg
#> 
#>             • Sex (character) "Female" or not
#> 
#>             • Ethnicity (character) "Aboriginal", "Torres Strait
#>               Islander", "Aboriginal/Torres Strait Islander" or not
#> 
#>             • Age (double)
#> 
#>    years: number of years to predict (from 4 to 12). default is 5
#>           years.
#> 
#>  outcome: (default is "CVD")
#> 
#>           "CHD" - coronary heart disease. includes myocardial
#>           infarction, death from coronary heart disease plus angina
#>           pectoris and coronary insufficiency.
#> 
#>           "CVD" cardiovascular disease (the default) includes coronary
#>           heart disease, stroke (including transient ischaemia),
#>           congestive heart failure and peripheral vascular disease.
#> 
#> Details:
#> 
#>      Equations and examples sourced from:
#> 
#>         • "Guidelines for the management of Absolute cardiovascular
#>           disease risk. 2012" by the National Vascular Disease
#>           Prevention Alliance of Australia.
#>           http://www.cvdcheck.org.au/pdf/Absolute_CVD_Risk_Full_Guidelines.pdf
#> 
#>         • "Cardiovascular Disease Risk Profiles" by Keaven M. Anderson,
#>           Patricia M. Odell, Peter W.F. Wilson, William B. Kannel in
#>           'American Heart Journal' 1991; 121:293-298
#> 
#>         • "An Updated Coronary Risk Profile - A Statement for Health
#>           Professionals" by Keaven M. Anderson, Peter W.F. Wilson,
#>           Patricia M. Odell, William B. Kannel in AHA (American Heart
#>           Association) Medical/Scientific Statement, sourced from
#>           http://ahajournals.org
#> 
#> Value:
#> 
#>      a dataframe
#> 
#>         • InternalID - the internalID of the person's row in the df
#>           (dataframe) parameter
#> 
#>         • frisk - numeric (a number, or 'NA' if not enough information
#>           to computer),
#> 
#>         • friskHI - either 'NA' or '>15%'. >15%' are groups considered
#>           equivalent risk to already having ischaemic heart disease.
#> 
#> Examples:
#> 
#>      framingham_riskequation(data.frame(
#>        InternalID = 1, BP = "135/80", Sex = "Female",
#>        Age = 55,
#>        SmokingStatus = "Smoker", CholHDLRatio = 230 / 48, Diabetes = TRUE, LVH = FALSE,
#>        CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
#>        eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
#>        FamilialHypercholesterolaemia = NA, Cholesterol = 5.96, Ethnicity = NA
#>      ),
#>      outcome = "CHD", years = 10
#>      )
#>      # this comes from "Cardiovascular disease risk profiles" (Anderson 1991)
#>      # the worked answer in the paper is 0.22. this function returns 0.2189125
#>      # the same risk-factors with outcome = "CVD" and years = 5 returns 0.180
#>      #  (cvdcheck.org.au reports 18%)
#>      # the same risk-factors except Sex = "Male" with outcome = "CVD" and years = 5 returns 0.202
#>      #  (cvdcheck.org.au reports 20%)
#>      
#>      framingham_riskequation(data.frame(
#>        InternalID = 2, BP = "130/80", Sex = "Male",
#>        Age = 55,
#>        SmokingStatus = "Smoker", CholHDLRatio = 240 / 45, Diabetes = FALSE, LVH = FALSE,
#>        CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
#>        eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
#>        FamilialHypercholesterolaemia = NA, Cholesterol = 6.22, Ethnicity = NA
#>      ),
#>      outcome = "CHD", years = 10
#>      )
#>      # this comes from "An Updated Coronary Risk Profile" (Anderson 1991)
#>      # the worked answer in the paper is 0.192, this function returns 0.1919
#>      # the same risk-factors with outcome = "CVD" and years = 5 returns 0.133
#>      #  (cvdcheck.org.au reports 13%)
#>      # the same risk-factors except LVH = TRUE (outcome = CVD, years = 5) returns 0.211
#>      #  (cvdcheck.org.au reports 21%)
#>      
#>      framingham_riskequation(data.frame(
#>        InternalID = 3, BP = "130/80", Sex = "Female",
#>        Age = 55,
#>        SmokingStatus = "Smoker", CholHDLRatio = 240 / 45, Diabetes = FALSE, LVH = FALSE,
#>        CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
#>        eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
#>        FamilialHypercholesterolaemia = NA, Cholesterol = 6.22, Ethnicity = NA
#>      ),
#>      outcome = "CHD", years = 10
#>      )
#>      # this comes from "An Updated Coronary Risk Profile" (Anderson 1991)
#>      # the worked answer in the paper is 0.135, this function returns 0.1349
#>      # the same risk-factors with outcome = "CVD" and years = 5 returns 0.088
#>      #  (cvdcheck.org.au reports 9%)
#>      # the same risk-factors except LVH = TRUE (outcome = CVD, years = 5) returns 0.150
#>      #  (cvdcheck.org.au reports 15%)
```

Examples
========

Example 1
---------

This example comes from “Cardiovascular disease risk profiles” (Anderson
1991).

The worked answer in the paper is 0.22.

``` r
framingham_riskequation(
  data.frame(InternalID = 1, BP = "135/80", Sex = "Female",
             Age = 55, SmokingStatus = "Smoker",
             CholHDLRatio = 230/48, Diabetes = TRUE, LVH = FALSE,
             CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
             eGFRValue = NA, eGFRUnits = NA,
             UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
             FamilialHypercholesterolaemia = NA, Cholesterol = 5.96,
             Ethnicity = NA),
  outcome = "CHD", years = 10
)
```

|  InternalID|      frisk| friskHI |
|-----------:|----------:|:--------|
|           1|  0.2189125| NA      |

The same risk-factors with outcome = “CVD” and years = 5.

The calculator on cvdcheck.org.au reports 18%.

``` r
framingham_riskequation(
  data.frame(InternalID = 1, BP = "135/80", Sex = "Female",
             Age = 55, SmokingStatus = "Smoker",
             CholHDLRatio = 230/48, Diabetes = TRUE, LVH = FALSE,
             CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
             eGFRValue = NA, eGFRUnits = NA,
             UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
             FamilialHypercholesterolaemia = NA, Cholesterol = 5.96,
             Ethnicity = NA),
  outcome = "CVD", years = 5
)
```

|  InternalID|      frisk| friskHI |
|-----------:|----------:|:--------|
|           1|  0.1803611| NA      |

The same risk-factors except Sex = “Male” with outcome = “CVD” and years
= 5.

The online calculator on cvdcheck.org.au reports 20%.

``` r
framingham_riskequation(
  data.frame(InternalID = 1, BP = "135/80", Sex = "Male",
             Age = 55, SmokingStatus = "Smoker",
             CholHDLRatio = 230/48, Diabetes = TRUE, LVH = FALSE,
             CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
             eGFRValue = NA, eGFRUnits = NA,
             UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
             FamilialHypercholesterolaemia = NA, Cholesterol = 5.96,
             Ethnicity = NA),
  outcome = "CVD", years = 5
)
```

|  InternalID|      frisk| friskHI |
|-----------:|----------:|:--------|
|           1|  0.2016813| NA      |

Example 2
---------

This comes from “An Updated Coronary Risk Profile” (Anderson 1991).

The worked answer in the paper is 0.192.

``` r
framingham_riskequation(
  data.frame(InternalID = 2, BP = "130/80", Sex = "Male",
             Age = 55, SmokingStatus = "Smoker",
             CholHDLRatio = 240/45, Diabetes = FALSE, LVH = FALSE,
             CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
             eGFRValue = NA, eGFRUnits = NA,
             UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
             FamilialHypercholesterolaemia = NA, Cholesterol = 6.22,
             Ethnicity = NA),
  outcome = "CHD", years = 10
)
```

|  InternalID|      frisk| friskHI |
|-----------:|----------:|:--------|
|           2|  0.1919419| NA      |

The same risk-factors with outcome = “CVD” and years = 5.

The online calculator at cvdcheck.org.au reports 13%.

``` r
framingham_riskequation(
  data.frame(InternalID = 2, BP = "130/80", Sex = "Male",
             Age = 55, SmokingStatus = "Smoker",
             CholHDLRatio = 240/45, Diabetes = FALSE, LVH = FALSE,
             CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
             eGFRValue = NA, eGFRUnits = NA,
             UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
             FamilialHypercholesterolaemia = NA, Cholesterol = 6.22,
             Ethnicity = NA),
  outcome = "CVD", years = 5
)
```

|  InternalID|      frisk| friskHI |
|-----------:|----------:|:--------|
|           2|  0.1332337| NA      |

The same risk-factors except LVH = TRUE (outcome = CVD, years = 5).

The online calculator at cvdcheck.org.au reports 21%.

``` r
framingham_riskequation(
  data.frame(InternalID = 2, BP = "130/80", Sex = "Male",
             Age = 55, SmokingStatus = "Smoker",
             CholHDLRatio = 240/45, Diabetes = FALSE, LVH = TRUE,
             CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
             eGFRValue = NA, eGFRUnits = NA,
             UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
             FamilialHypercholesterolaemia = NA, Cholesterol = 6.22,
             Ethnicity = NA),
  outcome = "CVD", years = 5
)
```

|  InternalID|      frisk| friskHI |
|-----------:|----------:|:--------|
|           2|  0.2113987| NA      |

Example 3
---------

This comes from “An Updated Coronary Risk Profile” (Anderson 1991)

The worked answer in the paper is 0.135.

``` r
framingham_riskequation(
  data.frame(InternalID = 3, BP = "130/80", Sex = "Female",
             Age = 55, SmokingStatus = "Smoker",
             CholHDLRatio = 240/45, Diabetes = FALSE, LVH = FALSE,
             CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
             eGFRValue = NA, eGFRUnits = NA,
             UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
             FamilialHypercholesterolaemia = NA, Cholesterol = 6.22,
             Ethnicity = NA),
  outcome = "CHD", years = 10
)
```

|  InternalID|      frisk| friskHI |
|-----------:|----------:|:--------|
|           3|  0.1348653| NA      |

The same risk-factors with outcome = “CVD” and years = 5.

The online calculator cvdcheck.org.au reports 9%.

``` r
framingham_riskequation(
  data.frame(InternalID = 3, BP = "130/80", Sex = "Female",
             Age = 55, SmokingStatus = "Smoker",
             CholHDLRatio = 240/45, Diabetes = FALSE, LVH = FALSE,
             CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
             eGFRValue = NA, eGFRUnits = NA,
             UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
             FamilialHypercholesterolaemia = NA, Cholesterol = 6.22,
             Ethnicity = NA),
  outcome = "CVD", years = 5
)
```

|  InternalID|      frisk| friskHI |
|-----------:|----------:|:--------|
|           3|  0.0883931| NA      |

The same risk-factors except LVH = TRUE (outcome = CVD, years = 5).

The online calculator cvdcheck.org.au reports 15%.

``` r
framingham_riskequation(
  data.frame(InternalID = 3, BP = "130/80", Sex = "Female",
             Age = 55, SmokingStatus = "Smoker",
             CholHDLRatio = 240/45, Diabetes = FALSE, LVH = TRUE,
             CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
             eGFRValue = NA, eGFRUnits = NA, 
             UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
             FamilialHypercholesterolaemia = NA, Cholesterol = 6.22,
             Ethnicity = NA),
  outcome = "CVD", years = 5
)
```

|  InternalID|      frisk| friskHI |
|-----------:|----------:|:--------|
|           3|  0.1500842| NA      |

Example 4
---------

This comes from “Maximising the effectiveness and cost-effectiveness of
cardiovascular disease prevention in the general population” by Andrew M
Tonkin, Andrew N Boyden and Stephen Colagiuri in ‘Medical Journal of
Australia’ (191:6) 21 September 2009.

Using the provided Australian cardiovascular risk charts, the estimated
risk is 5 − 9%.

The online calculator cvdcheck.org.au (with total cholesterol = 7.2, HDL
1.0) reports 9%.

``` r
framingham_riskequation(
  data.frame(InternalID = 4, BP = "140/80", Sex = "Female",
             Age = 46, SmokingStatus = "Smoker",
             CholHDLRatio = 7.2, Diabetes = FALSE, LVH = FALSE,
             CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
             eGFRValue = NA, eGFRUnits = NA, 
             UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
             FamilialHypercholesterolaemia = NA, Cholesterol = 7.2,
             Ethnicity = NA),
  outcome = "CVD", years = 5
)
```

|  InternalID|      frisk| friskHI |
|-----------:|----------:|:--------|
|           4|  0.0886549| NA      |

This example also comes from “Maximising the effectiveness and
cost-effectiveness of cardiovascular disease prevention in the general
population”.

Using the provided Australian cardiovascular risk charts, the estimated
risk is 20 − 24%.

The online calculator cvdcheck.org.au (with total cholesterol = 7.2, HDL
1.0) reports 20%.

``` r
framingham_riskequation(
  data.frame(InternalID = 4, BP = "140/80", Sex = "Female",
             Age = 66, SmokingStatus = "Smoker",
             CholHDLRatio = 7.2, Diabetes = FALSE, LVH = FALSE,
             CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
             eGFRValue = NA, eGFRUnits = NA, 
             UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
             FamilialHypercholesterolaemia = NA, Cholesterol = 7.2,
             Ethnicity = NA),
  outcome = "CVD", years = 5
)
```

|  InternalID|      frisk| friskHI |
|-----------:|----------:|:--------|
|           4|  0.1968354| NA      |
