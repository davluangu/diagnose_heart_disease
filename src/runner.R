library(magrittr)
library(Ramd)
library(stagerunner)

options(openproj.root = '~/opendev/diagnose_heart_disease')
setwd(options('openproj.root')[[1]])

en <- new.env()
sr <- stagerunner$new(en, list())
Ramd::define('stages/import', function(import_s) {
  sr$append(stagerunner$new(en, list(
    'import dicom files' = import_s[[1]](0, 'train')
  )))
})

sr$run(verbose = TRUE)
