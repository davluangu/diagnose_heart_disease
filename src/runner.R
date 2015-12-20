require(magrittr)
require(Ramd)
require(stagerunner)

options(proj.root = '~/odev/diagnose_heart_disease')
setwd(options('proj.root')[[1]])

# params for import
NFOLDERS <- 5

en <- new.env()
sr <- stagerunner$new(en, list())
Ramd::define('stages/import', function(import_s) {
  sr$append(stagerunner$new(en, list(
    'import dicom files' = import_s[[1]](NFOLDERS, 'data/train')
  )))
})

sr$run(verbose = TRUE)

## here's how to explore the loaded data:
# en$dcm_sets %>% length # number of folders loaded
# en$dcm_sets[[1]]$img %>% length # number of images in the first folder
# en$dcm_sets[[1]]$img[[1]] %>% dim # image resolution of first image in the first folder

## image resolution of all images in the first folder
# image_dims <- lapply(en$dcm_sets[[1]]$img, dim) %>% do.call(rbind, .)
# rownames(image_dims) <- NULL
# image_dims
