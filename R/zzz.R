.onAttach <- function(libname = find.package("hagis"), pkgname = "hagis") {
  options(hagis_connection = stdin())
}
