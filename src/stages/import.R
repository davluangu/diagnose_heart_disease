import_dcm <- function(nsets = 5, path_to_train_data = 'train') {
  require(oro.dicom)
  function(env) {
    fullpath <- file.path(options('openproj.root')[[1]], path_to_train_data)
    fn   <- list.dirs(fullpath, recursive = TRUE, full.names = TRUE)
    keep <- vapply(fn
      , function(f) length(list.files(f, pattern = 'dcm')) > 0 
      , logical(1))
    fn <- fn[keep]
    if (isTRUE(nsets > 0)) fn <- sample(fn, nsets) 
    env$dcm_sets <- lapply(fn, readDICOM, verbose = TRUE)
  }
}

list(
  import_dcm = import_dcm
)
