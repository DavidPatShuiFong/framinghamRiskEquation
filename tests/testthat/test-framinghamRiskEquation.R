context("test-framinghamRiskEquation")

test_that("Anderson1991 test 1", {
  expect_equal(
    framingham_riskequation(data.frame(
      InternalID = 1, BP = "135/80", Sex = "Female",
      Age = 55,
      SmokingStatus = "Smoker", CholHDLRatio = 230 / 48, Diabetes = TRUE, LVH = FALSE,
      CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
      eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
      FamilialHypercholesterolaemia = NA, Cholesterol = 5.96, Ethnicity = NA
    ), outcome = "CHD", years = 10)$frisk,
    0.22,
    tolerance = 0.005
  )
})

test_that("Anderson1991 test 1 - cvdcheck variant 1", {
  expect_equal(
    framingham_riskequation(data.frame(
      InternalID = 1, BP = "135/80", Sex = "Female",
      Age = 55,
      SmokingStatus = "Smoker", CholHDLRatio = 230 / 48, Diabetes = TRUE, LVH = FALSE,
      CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
      eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
      FamilialHypercholesterolaemia = NA, Cholesterol = 5.96, Ethnicity = NA
    ), outcome = "CVD", years = 5)$frisk,
    0.18,
    tolerance = 0.005
  )
})

test_that("Anderson1991 test 1 - cvd check variant 2", {
  expect_equal(
    framingham_riskequation(data.frame(
      InternalID = 1, BP = "135/80", Sex = "Male",
      Age = 55,
      SmokingStatus = "Smoker", CholHDLRatio = 230 / 48, Diabetes = TRUE, LVH = FALSE,
      CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
      eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
      FamilialHypercholesterolaemia = NA, Cholesterol = 5.96, Ethnicity = NA
    ), outcome = "CVD", years = 5)$frisk,
    0.20,
    tolerance = 0.005
  )
})

test_that("Anderson1991 test 2", {
  expect_equal(
    framingham_riskequation(data.frame(
      InternalID = 2, BP = "130/80", Sex = "Male",
      Age = 55,
      SmokingStatus = "Smoker", CholHDLRatio = 240 / 45, Diabetes = FALSE, LVH = FALSE,
      CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
      eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
      FamilialHypercholesterolaemia = NA, Cholesterol = 6.22, Ethnicity = NA
    ), outcome = "CHD", years = 10)$frisk,
    0.192,
    tolerance = 0.005
  )
})

test_that("Anderson1991 test 2 - cvdcheck variant 1", {
  expect_equal(
    framingham_riskequation(data.frame(
      InternalID = 2, BP = "130/80", Sex = "Male",
      Age = 55,
      SmokingStatus = "Smoker", CholHDLRatio = 240 / 45, Diabetes = FALSE, LVH = FALSE,
      CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
      eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
      FamilialHypercholesterolaemia = NA, Cholesterol = 6.22, Ethnicity = NA
    ), outcome = "CVD", years = 5)$frisk,
    0.13,
    tolerance = 0.005
  )
})

test_that("Anderson1991 test 2 - cvdcheck variant 2", {
  expect_equal(
    framingham_riskequation(data.frame(
      InternalID = 2, BP = "130/80", Sex = "Male",
      Age = 55,
      SmokingStatus = "Smoker", CholHDLRatio = 240 / 45, Diabetes = FALSE, LVH = TRUE,
      CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
      eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
      FamilialHypercholesterolaemia = NA, Cholesterol = 6.22, Ethnicity = NA
    ), outcome = "CVD", years = 5)$frisk,
    0.21,
    tolerance = 0.005
  )
})

test_that("Anderson1991 test 3", {
  expect_equal(
    framingham_riskequation(data.frame(
      InternalID = 3, BP = "130/80", Sex = "Female",
      Age = 55,
      SmokingStatus = "Smoker", CholHDLRatio = 240 / 45, Diabetes = FALSE, LVH = FALSE,
      CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
      eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
      FamilialHypercholesterolaemia = NA, Cholesterol = 6.22, Ethnicity = NA
    ), outcome = "CHD", years = 10)$frisk,
    0.135,
    tolerance = 0.005
    )
})


test_that("Anderson1991 test 3 - cvdcheck variant 1", {
  expect_equal(
    framingham_riskequation(data.frame(
      InternalID = 3, BP = "130/80", Sex = "Female",
      Age = 55,
      SmokingStatus = "Smoker", CholHDLRatio = 240 / 45, Diabetes = FALSE, LVH = FALSE,
      CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
      eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
      FamilialHypercholesterolaemia = NA, Cholesterol = 6.22, Ethnicity = NA
    ), outcome = "CVD", years = 5)$frisk,
    0.09,
    tolerance = 0.005
  )
})

test_that("Anderson1991 test 3 - cvdcheck variant 2", {
  expect_equal(
    framingham_riskequation(data.frame(
      InternalID = 3, BP = "130/80", Sex = "Female",
      Age = 55,
      SmokingStatus = "Smoker", CholHDLRatio = 240 / 45, Diabetes = FALSE, LVH = TRUE,
      CardiovascularDisease = FALSE, PersistentProteinuria = FALSE, eGFRValue = NA,
      eGFRUnits = NA, UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
      FamilialHypercholesterolaemia = NA, Cholesterol = 6.22, Ethnicity = NA
    ), outcome = "CVD", years = 5)$frisk,
    0.15,
    tolerance = 0.005
  )
})

test_that("Tonkin 2009 - test 1", {
  expect_equal(
    framingham_riskequation(data.frame(
      InternalID = 4, BP = "140/80", Sex = "Female",
      Age = 46, SmokingStatus = "Smoker",
      CholHDLRatio = 7.2, Diabetes = FALSE, LVH = FALSE,
      CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
      eGFRValue = NA, eGFRUnits = NA,
      UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
      FamilialHypercholesterolaemia = NA, Cholesterol = 7.2,
      Ethnicity = NA
    ), outcome = "CVD", years = 5)$frisk,
    0.09,
    tolerance = 0.005
  )
})


test_that("Tonkin 2009 - test 2", {
  expect_equal(
    framingham_riskequation(data.frame(
      InternalID = 4, BP = "140/80", Sex = "Female",
      Age = 66, SmokingStatus = "Smoker",
      CholHDLRatio = 7.2, Diabetes = FALSE, LVH = FALSE,
      CardiovascularDisease = FALSE, PersistentProteinuria = FALSE,
      eGFRValue = NA, eGFRUnits = NA,
      UrineAlbuminValue = NA, UrineAlbuminUnits = NA,
      FamilialHypercholesterolaemia = NA, Cholesterol = 7.2,
      Ethnicity = NA
    ), outcome = "CVD", years = 5)$frisk,
    0.20,
    tolerance = 0.005
  )
})
