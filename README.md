# [Gender gap in entrepreneurship](https://sahlre.shinyapps.io/Gender-gap-in-entrepreneurship-master/)

In this repository is the web application **[Gender gap in emprendimineto](https://sahlre.shinyapps.io/Gender-gap-in-entrepreneurship-master/)**. For the author, this application required a great effort and has been elaborated for several months. Thanks to what has been learned in the specialization of Data Science offered by the JHU through COURSERA. This application is also presented as the proposal to PROJECT COURSE of the course Developing Data Products since several concepts taught in the course were useful to improve the application. If you want a simple explanation of how the application works read [little explanation](https://shlondon.github.io/Gender-gap-in-entrepreneurship/Repro-Pitch-Presentation.html#(1))

This application is built for those interested in analyzing the enterprise from a gender perspective. It is also aimed at helping those who have difficulty creating graphs and inferential statistics because they do not have training in software and database management. It is an application subject to myriad improvements, so you can propose improvements or new ideas and send them to the mail:
slondono@coruniamericana.edu.co. It aims to create graphs and estimate multivariate binomial logistic regression models to analyze the gender gap in entrepreneurial activity detected by the Global Entrepreneurship Monitor (GEM) project. Each of the databases mentioned below that support the application can be obtained at http://www.gemconsortium.org/data/sets. Specifically, the databases were used **GEM 2001 2015 APS Global Key Indicators** and  **the adult population survey (APs)** databases for the years 2010-2011 and 2011-2012 were selected. The last two APs databases were merged and, after cleaning up those observations with missing values, produced a Total sample of 172116 participants, keep in mind that the number of participants varies according to each country.

You can run the application in two ways:

1. In this web site: <https://sahlre.shinyapps.io/Gender-gap-in-entrepreneurship-master/>, you can enjoy it. However, there is a restriction of 25 hours of usage per month, then charged. This is because the application is using the shiny server, free version.
2. You can run the application locally on your own computer. Follow these steps:

	2.1. Download [software R](https://www.r-project.org/). Works for any operating system.

	2.2. Download [RStudio] (https://www.rstudio.com/). Integrated Development Enviroment (IDE) that facilitates the use of R.

	2.3. Download the 'shiny' package. You can do it, using Rstudio (you can also do it in R, but it is recommended to work directly on RStudio), using the following line of code 'install.package ("shiny")'. Then load the library with the code 'library (shiny)'.

	2.4. Run the web application on your computer. Do it with the following code: shiny :: runGitHub (repo = "Gender-gap-in-entrepreneurship", username = "shlondon")	

	2.5. Enjoy it   :D

