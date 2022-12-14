Blog_post <- function(db){

Template <- '---
title: "{{title}}"
author: "[{{author}}]({{url}})"
date: {{date}}
categories: [{{categories}}]
draft: {{false}}
room: "{{room}}"
time: {{time}}
url: {{url}}
---

# Résumé

{{description}}

# Biographie

{{biographie}}'

  for(i in 1:nrow(db)){
    data <- db[i,]
    print(data$date)
    dirname <- paste0("./presentations/",data$date)
    #if(!dir.exists(dirname)){
    #dir.create(dirname)
    #}
    writeLines(
      whisker::whisker.render(Template, data),
    paste0("./presentations/",data$date,".qmd")  
    #paste0("./presentations/",
    #       data$date,
    #       "/index.qmd")
    )
  }
}

db <- read.csv(file = "seminaires-2022-23.csv")
Blog_post(db)
