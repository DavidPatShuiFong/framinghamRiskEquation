---
title: "framinghamRiskEquation"
author: "David Fong : vkelim at bigpond dot com"
date: "2019-09-20"
output:
  html_document:
    number_sections: yes
    theme: lumen
    toc: yes
    toc_depth: 3
    toc_float:
      collapsed: yes
      smooth_scroll: yes
  rmarkdown::html_vignette: NULL
vignette: >
  %\VignetteIndexEntry{Usage}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}

---






Github repository at https://github.com/DavidPatShuiFong/framinghamRiskEquation


```r
library(framinghamRiskEquation)
packageVersion("framinghamRiskEquation")
#> [1] '0.1.0'
```

# Documentation


```r
?framinghamRiskEquation::framingham_riskequation
#> Rendering development documentation for 'framingham_riskequation'
```

# Examples

## Example 1

This example comes from "Cardiovascular disease risk profiles" (Anderson 1991).

The worked answer in the paper is $0.22$.


```r
framingham_riskequation(data.frame(InternalID = 1, BP = "135/80", Sex = "Female",
                                   Age = 55, SmokingStatus = "Smoker",
                                   CholHDLRatio = 230/48, Diabetes = TRUE, LVH = FALSE,
                                   CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
                                   eGFRValue = NA, eGFRUnits = NA,
                                   UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
                                   FamilialHypercholesterolaemia = NA, Cholesterol = 5.96,
                                   Ethnicity = NA),
                        outcome = "CHD", years = 10)
#>   InternalID     frisk friskHI
#> 1          1 0.2189125    <NA>
```

The same risk-factors with outcome = "CVD" and years = 5.

The calculator on cvdcheck.org.au reports $18\%$.


```r
framingham_riskequation(data.frame(InternalID = 1, BP = "135/80", Sex = "Female",
                                   Age = 55, SmokingStatus = "Smoker",
                                   CholHDLRatio = 230/48, Diabetes = TRUE, LVH = FALSE,
                                   CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
                                   eGFRValue = NA, eGFRUnits = NA,
                                   UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
                                   FamilialHypercholesterolaemia = NA, Cholesterol = 5.96,
                                   Ethnicity = NA),
                        outcome = "CVD", years = 5)
#>   InternalID     frisk friskHI
#> 1          1 0.1803611    <NA>
```

The same risk-factors except Sex = "Male" with outcome = "CVD" and years = 5 returns $0.202$.

The online calculator on cvdcheck.org.au reports $20\%$.


```r
framingham_riskequation(data.frame(InternalID = 1, BP = "135/80", Sex = "Male",
                                   Age = 55, SmokingStatus = "Smoker",
                                   CholHDLRatio = 230/48, Diabetes = TRUE, LVH = FALSE,
                                   CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
                                   eGFRValue = NA, eGFRUnits = NA,
                                   UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
                                   FamilialHypercholesterolaemia = NA, Cholesterol = 5.96,
                                   Ethnicity = NA),
                        outcome = "CVD", years = 5)
#>   InternalID     frisk friskHI
#> 1          1 0.2016813    <NA>
```

## Example 2

This comes from "An Updated Coronary Risk Profile" (Anderson 1991)'.

The worked answer in the paper is $0.192$.


```r
framingham_riskequation(data.frame(InternalID = 2, BP = "130/80", Sex = "Male",
                                   Age = 55, SmokingStatus = "Smoker",
                                   CholHDLRatio = 240/45, Diabetes = FALSE, LVH = FALSE,
                                   CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
                                   eGFRValue = NA, eGFRUnits = NA,
                                   UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
                                   FamilialHypercholesterolaemia = NA, Cholesterol = 6.22,
                                   Ethnicity = NA),
                        outcome = "CHD", years = 10)
#>   InternalID     frisk friskHI
#> 1          2 0.1919419    <NA>
```


The same risk-factors with outcome = "CVD" and years = 5.

The online calculator at cvdcheck.org.au reports $13\%$.


```r
framingham_riskequation(data.frame(InternalID = 2, BP = "130/80", Sex = "Male",
                                   Age = 55, SmokingStatus = "Smoker",
                                   CholHDLRatio = 240/45, Diabetes = FALSE, LVH = FALSE,
                                   CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
                                   eGFRValue = NA, eGFRUnits = NA,
                                   UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
                                   FamilialHypercholesterolaemia = NA, Cholesterol = 6.22,
                                   Ethnicity = NA),
                        outcome = "CVD", years = 5)
#>   InternalID     frisk friskHI
#> 1          2 0.1332337    <NA>
```

The same risk-factors except LVH = TRUE (outcome = CVD, years = 5).

The online calculator at cvdcheck.org.au reports $21\%$.


```r
framingham_riskequation(data.frame(InternalID = 2, BP = "130/80", Sex = "Male",
                                   Age = 55, SmokingStatus = "Smoker",
                                   CholHDLRatio = 240/45, Diabetes = FALSE, LVH = TRUE,
                                   CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
                                   eGFRValue = NA, eGFRUnits = NA,
                                   UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
                                   FamilialHypercholesterolaemia = NA, Cholesterol = 6.22,
                                   Ethnicity = NA),
                        outcome = "CVD", years = 5)
#>   InternalID     frisk friskHI
#> 1          2 0.2113987    <NA>
```

## Example 3

This comes from "An Updated Coronary Risk Profile" (Anderson 1991)

The worked answer in the paper is $0.135$.


```r
framingham_riskequation(data.frame(InternalID = 3, BP = "130/80", Sex = "Female",
                                   Age = 55, SmokingStatus = "Smoker",
                                   CholHDLRatio = 240/45, Diabetes = FALSE, LVH = FALSE,
                                   CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
                                   eGFRValue = NA, eGFRUnits = NA,
                                   UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
                                   FamilialHypercholesterolaemia = NA, Cholesterol = 6.22,
                                   Ethnicity = NA),
                        outcome = "CHD", years = 10)
#>   InternalID     frisk friskHI
#> 1          3 0.1348653    <NA>
```

The same risk-factors with outcome = "CVD" and years = 5.

The online calculator cvdcheck.org.au reports $9\%$.


```r
framingham_riskequation(data.frame(InternalID = 3, BP = "130/80", Sex = "Female",
                                   Age = 55, SmokingStatus = "Smoker",
                                   CholHDLRatio = 240/45, Diabetes = FALSE, LVH = FALSE,
                                   CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
                                   eGFRValue = NA, eGFRUnits = NA,
                                   UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
                                   FamilialHypercholesterolaemia = NA, Cholesterol = 6.22,
                                   Ethnicity = NA),
                        outcome = "CVD", years = 5)
#>   InternalID      frisk friskHI
#> 1          3 0.08839313    <NA>
```

The same risk-factors except LVH = TRUE (outcome = CVD, years = 5).

The online calculator cvdcheck.org.au reports $15\%$.


```r
framingham_riskequation(data.frame(InternalID = 3, BP = "130/80", Sex = "Female",
                                   Age = 55, SmokingStatus = "Smoker",
                                   CholHDLRatio = 240/45, Diabetes = FALSE, LVH = TRUE,
                                   CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
                                   eGFRValue = NA, eGFRUnits = NA, 
                                   UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
                                   FamilialHypercholesterolaemia = NA, Cholesterol = 6.22,
                                   Ethnicity = NA),
                        outcome = "CVD", years = 5)
#>   InternalID     frisk friskHI
#> 1          3 0.1500842    <NA>
```

## Example 4

This comes from "Maximising the effectiveness and cost-effectiveness of cardiovascular disease prevention in the general population" by Andrew M Tonkin, Andrew N Boyden and Stephen Colagiuri in 'Medical Journal of Australia' (191:6) 21 September 2009.

Using the provided Australian cardiovascular risk charts, the estimated risk is $5-9\%$.

The online calculator cvdcheck.org.au (with total cholesterol = 7.2, HDL 1.0) reports $9\%$.


```r
framingham_riskequation(data.frame(InternalID = 4, BP = "140/80", Sex = "Female",
                                   Age = 46, SmokingStatus = "Smoker",
                                   CholHDLRatio = 7.2, Diabetes = FALSE, LVH = FALSE,
                                   CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
                                   eGFRValue = NA, eGFRUnits = NA, 
                                   UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
                                   FamilialHypercholesterolaemia = NA, Cholesterol = NA,
                                   Ethnicity = NA),
                        outcome = "CVD", years = 5)
#>   InternalID      frisk friskHI
#> 1          4 0.08865487    <NA>
```

This example also comes from "Maximising the effectiveness and cost-effectiveness of cardiovascular disease prevention in the general population" by Andrew M Tonkin, Andrew N Boyden and Stephen Colagiuri in 'Medical Journal of Australia' (191:6) 21 September 2009.

Using the provided Australian cardiovascular risk charts, the estimated risk is $20-24\%$.

The online calculator cvdcheck.org.au (with total cholesterol = 7.2, HDL 1.0) reports $20\%$. 


```r
framingham_riskequation(data.frame(InternalID = 4, BP = "140/80", Sex = "Female",
                                   Age = 66, SmokingStatus = "Smoker",
                                   CholHDLRatio = 7.2, Diabetes = FALSE, LVH = FALSE,
                                   CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
                                   eGFRValue = NA, eGFRUnits = NA, 
                                   UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
                                   FamilialHypercholesterolaemia = NA, Cholesterol = NA,
                                   Ethnicity = NA),
                        outcome = "CVD", years = 5)
#>   InternalID     frisk friskHI
#> 1          4 0.1968354    <NA>
```
