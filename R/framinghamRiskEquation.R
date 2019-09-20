# (c) David Fong 2019

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

#' Framingham Risk Equation
#'
#' Calculate cardiovascular disease risk according to Framingham Risk Equation
#'
#' @details
#'
#' Equations and examples sourced from:
#'
#' \itemize{
#' \item {"Guidelines for the management of Absolute cardiovascular disease risk. 2012"}
#'   by the National Vascular Disease Prevention Alliance of Australia.
#'   http://www.cvdcheck.org.au/pdf/Absolute_CVD_Risk_Full_Guidelines.pdf
#' \item {"Cardiovascular Disease Risk Profiles"}
#'   by Keaven M. Anderson, Patricia M. Odell, Peter W.F. Wilson, William B. Kannel
#'   in American Heart Journal : 1991; 121:293-298
#' \item {"An Updated Coronary Risk Profile - A Statement for Health Professionals"}
#'   by Keaven M. Anderson, Peter W.F. Wilson, Patricia M. Odell, William B. Kannel
#'   in AHA (American Heart Association) Medical/Scientific Statement, sourced from http://ahajournals.org
#' }
#'
#' @param df a dataframe, which must include the following columns/fields:
#'
#' \itemize{
#' \item InternalID (numeric)
#' \item CardiovascularDisease (logical - TRUE or FALSE)
#' \item Diabetes (logical)
#' \item SmokingDate (date) - not actually used in this equation
#' \item SmokingStatus (character) - "Smoker" if a smoker. All other values ignored
#' \item UrineAlbuminDate (character), UrineAlbuminValue (double), UrineAlbuminUnit (character)
#' \item PersistentProteinuria (logical)
#' \item eGFRDate (date), eGFRValue (double), eGFRUnits (character)
#' \item FamilialHypercholesterolaemia (logical)
#' \item LVH (logical) = left ventricular hyp0ertrophy
#' \item CholesterolDate (date)
#' \item Cholesterol (double) in millimoles per litre (mmol/L or mM)
#' \item Triglycerides (double) in millimoles per litre (mmol/L or mM)
#' \item CholHDLRatio (double)
#' \item BPDate (date)
#' \item BP (character, two numbers separated by "/") in mmHg
#' \item Sex (character) "Female" or not
#' \item Ethnicity (character) "Aboriginal", "Torres Strait Islander", "Aboriginal/Torres Strait Islander" or not
#' \item Age (double)
#' }
#'
#' @param years number of years to predict (from 4 to 12). default is 5 years.
#' @param outcome (default is "CVD") "CHD" - coronary heart disease. includes myocardial
#'  infarction, death from coronary heart disease plus angina pectoris and
#'  coronary insufficiency.
#'
#'  "CVD" cardiovascular disease (the default) includes coronary heart disease,
#'  stroke (including transient ischaemia), congestive heart failure and
#'  peripheral vascular disease.
#'
#' @return a dataframe
#' \itemize{
#'  \item InternalID - the internalID of the person's row in the df (dataframe) parameter
#'  \item frisk - numeric (a number, or 'NA' if not enough information to computer),
#'  \item friskHI - either 'NA' or '>15\%'. >15\%' are groups considered equivalent risk to already having ischaemic heart disease.
#' }
#'
#' @examples
#'
#' framingham_riskequation(data.frame(InternalID = 1, BP = "135/80", Sex = "Female",
#'  Age = 55,
#'  SmokingStatus = "Smoker", CholHDLRatio = 230/48, Diabetes = TRUE, LVH = FALSE,
#'   CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
#'    eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
#'    FamilialHypercholesterolaemia = NA, Cholesterol = 5.96, Ethnicity = NA),
#'     outcome = "CHD", years = 10)
#'     # this comes from "Cardiovascular disease risk profiles" (Anderson 1991)
#'     # the worked answer in the paper is 0.22. this function returns 0.2189125
#'     # the same risk-factors with outcome = "CVD" and years = 5 returns 0.180
#'     #  (cvdcheck.org.au reports 18%)
#'     # the same risk-factors except Sex = "Male" with outcome = "CVD" and years = 5 returns 0.202
#'     #  (cvdcheck.org.au reports 20%)
#'
#' framingham_riskequation(data.frame(InternalID = 2, BP = "130/80", Sex = "Male",
#'  Age = 55,
#'  SmokingStatus = "Smoker", CholHDLRatio = 240/45, Diabetes = FALSE, LVH = FALSE,
#'   CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
#'    eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
#'    FamilialHypercholesterolaemia = NA, Cholesterol = 6.22, Ethnicity = NA),
#'     outcome = "CHD", years = 10)
#'     # this comes from "An Updated Coronary Risk Profile" (Anderson 1991)
#'     # the worked answer in the paper is 0.192, this function returns 0.1919
#'     # the same risk-factors with outcome = "CVD" and years = 5 returns 0.133
#'     #  (cvdcheck.org.au reports 13%)
#'     # the same risk-factors except LVH = TRUE (outcome = CVD, years = 5) returns 0.211
#'     #  (cvdcheck.org.au reports 21%)
#'
#' framingham_riskequation(data.frame(InternalID = 3, BP = "130/80", Sex = "Female",
#'  Age = 55,
#'  SmokingStatus = "Smoker", CholHDLRatio = 240/45, Diabetes = FALSE, LVH = FALSE,
#'   CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
#'    eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
#'    FamilialHypercholesterolaemia = NA, Cholesterol = 6.22, Ethnicity = NA),
#'     outcome = "CHD", years = 10)
#'     # this comes from "An Updated Coronary Risk Profile" (Anderson 1991)
#'     # the worked answer in the paper is 0.135, this function returns 0.1349
#'     # the same risk-factors with outcome = "CVD" and years = 5 returns 0.088
#'     #  (cvdcheck.org.au reports 9%)
#'     # the same risk-factors except LVH = TRUE (outcome = CVD, years = 5) returns 0.150
#'     #  (cvdcheck.org.au reports 15%)
#'
#' @export
framingham_riskequation <- function(df, years = 5, outcome= "CVD") {

  fre_coefficients <- data.frame(row.names = c("CHD", "CVD"),
                                 theta0 = c(0.9145, 0.6536),
                                 theta1 = c(-0.2784, -0.2402),
                                 beta0 = c(15.5305, 18.8144),
                                 female = c(28.4441, -1.2146),
                                 log_age = c(-1.4792, -1.8443),
                                 log_age2 = c(0, 0),
                                 log_age_female = c(-14.4588, 0.3668),
                                 log_age2_female = c(1.8515, 0),
                                 log_SBP = c(-0.9119, -1.4032),
                                 cigarettes = c(-0.2767, -0.3899),
                                 log_TCHDLratio = c(-0.7181, -0.5390),
                                 diabetes = c(-0.1759, -0.3036),
                                 diabetes_female = c(-0.1999, -0.1697),
                                 ECGLVH = c(-0.5865, -0.3362))

  fre_b <- fre_coefficients[outcome,]

  f <- df %>>%
    tidyr::separate(BP, into = c("Systolic", "Diastolic"), sep = "/", convert = TRUE) %>>%
    # creates new Systolic and Diastolic fields,
    # fills with NA if not available, and converts to numeric
    dplyr::mutate(mu = fre_b$beta0 +
                    fre_b$female * (Sex == "Female") +
                    fre_b$log_age * log(Age) +
                    fre_b$log_age_female * log(Age) * (Sex == "Female") +
                    fre_b$log_age2_female * log(Age)^2 * (Sex == "Female") +
                    fre_b$log_SBP * log(Systolic) +
                    fre_b$cigarettes * (SmokingStatus == "Smoker") +
                    fre_b$log_TCHDLratio * log(CholHDLRatio) +
                    fre_b$diabetes * Diabetes +
                    fre_b$diabetes_female * Diabetes * (Sex == "Female") +
                    fre_b$ECGLVH * LVH,
                  sigma = exp(fre_b$theta0 + fre_b$theta1 * mu),
                  u = (log(years) - mu)/sigma,
                  frisk = 1 - exp(-exp(u))) %>>%
    dplyr::mutate(friskHI = dplyr::case_when(
      CardiovascularDisease ~ ">15%",
      Diabetes & (Age > 60) ~ ">15%",
      Diabetes & UrineAlbuminValue > 20 & UrineAlbuminUnits == "mcg/min" ~ ">15%",
      Diabetes & Sex == "Male" &
        UrineAlbuminValue > 2.5 & UrineAlbuminUnits == "mg/mmol" ~ ">15%",
      Diabetes & Sex == "Female" &
        UrineAlbuminValue > 3.5 & UrineAlbuminUnits == "mg/mmol" ~ ">15%",
      PersistentProteinuria == TRUE ~ ">15%",
      eGFRValue < 45 & eGFRUnits == "mL/min" ~ ">15%",
      FamilialHypercholesterolaemia == TRUE ~ ">15%",
      Systolic >= 180 | Diastolic >= 110 ~ '>15%',
      Cholesterol > 7.5 ~ ">15%",
      Ethnicity %in% c("Aboriginal", "Torres Strait Islander",
                       "Aboriginal/Torres Strait Islander") &
        Age > 74 ~ ">15%",
      TRUE ~ as.character(NA))) %>>%
    dplyr::select(InternalID, frisk, friskHI)

  return(f)
}
