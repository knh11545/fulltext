context("ft_extract")

test_that("ft_extract returns...", {
  skip_on_cran()
  
  path <- system.file("examples", "example1.pdf", package = "fulltext")
  
  res_default <- ft_extract(path)
  res_xpdf <- ft_extract(path, "xpdf")
  res_gs <- ft_extract(path, "gs")
  
  # correct classes
  expect_is(res_default, "xpdf_char")
  expect_is(res_xpdf, "xpdf_char")
  expect_is(res_gs, "gs_char")
  
  expect_equal(res_default, res_xpdf)
  
  expect_is(res_default$meta, "list")
  expect_is(res_default$data, "character")
  
  expect_is(res_gs$meta, "list")
  expect_is(res_gs$data, "character")
})

test_that("ft_extract fails well", {
  skip_on_cran()
  
  # bad path given
  expect_error(ft_extract(5), "invalid 'file' argument")
  expect_error(ft_extract('adfafsdf'), "File does not exist")
})