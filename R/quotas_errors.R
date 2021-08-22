is_default_project <- function(){
    getOption("googleAuthR.client_id") %in% c("289759286325-da3fr5kq4nl4nkhmhs2uft776kdsggbo.apps.googleusercontent.com",
                                              "289759286325-42j8nmkeq5n9v9eb1kiuj2i97v9oea1f.apps.googleusercontent.com",
                                              "201908948134-rm1ij8ursrfcbkv9koc0aqver84b04r7.apps.googleusercontent.com",
                                              "201908948134-cjjs89cffh3k429vi7943ftpk3jg36ed.apps.googleusercontent.com")
}

default_project_message <- function(){
  getOption("googleAuthR.client_id") %in% c("289759286325-da3fr5kq4nl4nkhmhs2uft776kdsggbo.apps.googleusercontent.com",
                                              "289759286325-42j8nmkeq5n9v9eb1kiuj2i97v9oea1f.apps.googleusercontent.com",
                                              "201908948134-rm1ij8ursrfcbkv9koc0aqver84b04r7.apps.googleusercontent.com",
                                              "201908948134-cjjs89cffh3k429vi7943ftpk3jg36ed.apps.googleusercontent.com")
  

}

# custom error messages for googleAnalyticsR
# otherwise googleAuthR handles them
custom_error <- function(err){
  if(grepl("insufficient tokens for quota",err$message)){
    default_project_message()
    stop("The Google Project ", getOption("googleAuthR.client_id") ," has run out of quota (typically 50,000 API calls per day)", call. = FALSE)
  } else {
    stop(err$message, call. = FALSE)
  }
}
