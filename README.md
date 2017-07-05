# Gender gap in entrepreneurship

In this repository is the web application **Gender gap in emprendimineto**.

This application is built for those interested in analyzing the enterprise from a gender perspective. It is also aimed at helping those who have difficulty creating graphs and inferential statistics because they do not have training in software and database management. It is an application subject to myriad improvements, so you can propose improvements or new ideas and send them to the mail:
slondono@coruniamericana.edu.co. It aims to create graphs and estimate multivariate binomial logistic regression models to analyze the gender gap in entrepreneurial activity detected by the Global Entrepreneurship Monitor (GEM) project. Each of the databases mentioned below that support the application can be obtained at http://www.gemconsortium.org/data/sets. Specifically, the databases were used **GEM 2001 2015 APS Global Key Indicators** and  **the adult population survey (APs)** databases for the years 2010-2011 and 2011-2012 were selected. The last two APs databases were merged and, after cleaning up those observations with missing values, produced a Total sample of 172116 participants, keep in mind that the number of participants varies according to each country.

You can run the application in two ways:

1. In this web site: https://sahlre.shinyapps.io/Gender-gap-in-entrepreneurship-master/, you can enjoy it. However, there is a restriction of 25 hours of usage per month, then charged. This is because the application is using the shiny server, free version.
2. Usted puede correr la aplication localmente en su propia computadora. Siga los siguientes pasos:

	2.1. Descargar el software R. Funciona para cualquier sistema operativo.
	2.2. Descargar Rstudio. IDE que facilita el uso de R.
	2.3. Descargar la libraria 'shiny'. Usted lo puede hacer, utilizando Rstudio (también puede hacerlo en R, pero se recomienda trabajar utilizando Rstudio), mediante la siguiente linea de código 'install.package("shiny")'. Luego cargar la librería con el código 'library(shiny)'.
	2.4. Ejecutar el aplicativo web en su computador. Hagalo mediante el siguiente código 'shiny::runGitHub(repo = "Gender-gap-in-entrepreneurship", username = "shlondon")'
	2.5. Disfruta :D

