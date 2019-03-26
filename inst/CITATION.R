year <- sub("-.*", "", meta$Date)
note <- sprintf("R package version %s", meta$Version)

bibentry(bibtype = "Manual",
         title = "{hagis}: Tools for Analysis of Phytophthora Pathotype Complexities, Distributions and Diversity",
         author = c(person("Austin", "McCoy"),
                    person("Zachary", "Noel"),
                    person("Adam H.", "Sparks"),
                    person("Martin", "Chilvers")),
         year = year,
         note = note,
         url = "https://openplantpathology.github.io/hagis/")

textVersion =
  paste0("Austin McCoy, Zachary Noel, Adam H. Sparks, and Martin Chilvers (",
         year,
         "). hagis: Tools for Analysis of Phytophthora Pathotype Complexities,
         Distributions and Diversity",
         note, ".")
