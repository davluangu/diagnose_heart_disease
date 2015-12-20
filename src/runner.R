require(magrittr)
require(Ramd)
require(stagerunner)

options(proj.root = '~/odev/diagnose_heart_disease')
setwd(options('proj.root')[[1]])

en <- new.env()
sr <- stagerunner$new(en, list())
Ramd::define('stages/import', function(import_s) {
  sr$append(stagerunner$new(en, list(
    'import dicom files' = import_s[[1]](0, 'train')
  )))
})

sr$run(verbose = TRUE)
