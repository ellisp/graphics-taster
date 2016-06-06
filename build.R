library(knitr)
library(rmarkdown)
library(shinyapps)

# Note.  The data in /data/ is all created in the separate Graphics Fundamentals
# repository and has just been copied in.

deployApp(paste0(projdir, "/shiny1"), appName = "DensityDemo", account = "ellisp")

setwd(paste0(projdir, "/Session1"))
render("session1.Rmd")
setwd(paste0(projdir, "/Session2"))
render("session2.Rmd")

setwd(paste0(projdir, "/Session5"))
render("session5.Rmd")

