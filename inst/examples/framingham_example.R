framingham_riskequation(data.frame(
  InternalID = 1, BP = "135/80", Sex = "Female",
  Age = 55,
  SmokingStatus = "Smoker", CholHDLRatio = 230 / 48, Diabetes = TRUE, LVH = FALSE,
  CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
  eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
  FamilialHypercholesterolaemia = NA, Cholesterol = 5.96, Ethnicity = NA
),
outcome = "CHD", years = 10
)
# this comes from "Cardiovascular disease risk profiles" (Anderson 1991)
# the worked answer in the paper is 0.22. this function returns 0.2189125
# the same risk-factors with outcome = "CVD" and years = 5 returns 0.180
#  (cvdcheck.org.au reports 18%)
# the same risk-factors except Sex = "Male" with outcome = "CVD" and years = 5 returns 0.202
#  (cvdcheck.org.au reports 20%)

framingham_riskequation(data.frame(
  InternalID = 2, BP = "130/80", Sex = "Male",
  Age = 55,
  SmokingStatus = "Smoker", CholHDLRatio = 240 / 45, Diabetes = FALSE, LVH = FALSE,
  CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
  eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
  FamilialHypercholesterolaemia = NA, Cholesterol = 6.22, Ethnicity = NA
),
outcome = "CHD", years = 10
)
# this comes from "An Updated Coronary Risk Profile" (Anderson 1991)
# the worked answer in the paper is 0.192, this function returns 0.1919
# the same risk-factors with outcome = "CVD" and years = 5 returns 0.133
#  (cvdcheck.org.au reports 13%)
# the same risk-factors except LVH = TRUE (outcome = CVD, years = 5) returns 0.211
#  (cvdcheck.org.au reports 21%)

framingham_riskequation(data.frame(
  InternalID = 3, BP = "130/80", Sex = "Female",
  Age = 55,
  SmokingStatus = "Smoker", CholHDLRatio = 240 / 45, Diabetes = FALSE, LVH = FALSE,
  CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
  eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
  FamilialHypercholesterolaemia = NA, Cholesterol = 6.22, Ethnicity = NA
),
outcome = "CHD", years = 10
)
# this comes from "An Updated Coronary Risk Profile" (Anderson 1991)
# the worked answer in the paper is 0.135, this function returns 0.1349
# the same risk-factors with outcome = "CVD" and years = 5 returns 0.088
#  (cvdcheck.org.au reports 9%)
# the same risk-factors except LVH = TRUE (outcome = CVD, years = 5) returns 0.150
#  (cvdcheck.org.au reports 15%)
