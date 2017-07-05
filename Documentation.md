# Gender gap in entrepreneurship

This application is built for those interested in analyzing the enterprise from a gender perspective. It is also aimed at helping those who have difficulty creating graphs and inferential statistics because they do not have training in software and database management. It is an application subject to myriad improvements, so you can propose improvements or new ideas and send them to the mail:
slondono@coruniamericana.edu.co. It aims to create graphs and estimate multivariate binomial logistic regression models to analyze the gender gap in entrepreneurial activity detected by the Global Entrepreneurship Monitor (GEM) project. Each of the databases mentioned below that support the application can be obtained at http://www.gemconsortium.org/data/sets.

## Structure of the application

The application is structured in five divisions or tags:*Graphical gender gap in TEA*, *Graphical gender disparity in TEA*, *Multivariate binomial logistic regression model*, *Multivariate graphs* and *Documentation*. By default, the application starts at the tab *Graphic gender gap in the TEA*. The following will explain the possibilities of interaction that the user has in each one of the divisions of the application:

### Graphical gender gap in TEA

In this part of the application the user will find two panels: one to the left side, side panel, with the buttons or controllers that will influence the graphic located in the second panel, the main panel.

This graph expresses the gender gap in the rate of early entrepreneurial activity (TEA), which reflects the percentage of people among the respondents who own or are part of a business, or who are self-employed, in a period of time less than 36 months. On the *y* axis is the TEA and the axis *x* is the time. The blue-green line represents the TEA of the male gender and the red line of the female. The graph presented by default reveals the higher rate of early entrepreneurship of men on women, thus expressing a gender gap in entrepreneurship.

The graphic is not immutable, the five buttons on the side panel allow you to alter it according to the needs of the user. The button **Choose a country** allows to reproduce the situation of the enterprise with respect to the gender in each of the countries, and observe its evolution. The remaining buttons determine the appearance of the graphic, for example the button **Choose the thickness of the lines** configure the thickness of the color of the lines, and the buttons **Choose the scale on the x axis** y **Choose The scale on the y-axis** generate different effects on the shape of the gender gap. In this way, with these buttons the user can build a graph ready to copy and paste in their publications, as long as you quote the application ;)

The database used to create the chart is called **GEM 2001 2015 APS Global Key Indicators**, where it is consolidated by gender, country and TEA period. The remaining variables that could be plotted with respect to time and gender are not yet consolidated, it would be very interesting to have at the disposal of users each of these possibilities, however that will be one of the main improvements to take into account.

### Graphical gender disparity gap in TEA

It maintains the structure and purpose of the previous division: as for the structure there is a side panel and a main panel, the buttons are the same and they are the ones that control the graphic of the main panel. The difference is that the graph expresses the gender disparity with respect to the TEA. The disparity is assumed to be the division of the male TEA into the female TEA, so if a disparity of 1.89 is obtained it means that for every woman reporting early entrepreneurial activity, there are 1.89 men undertaking.

### Multivariate binomial logistic regression models

From the GEM project, the adult population survey (APs) databases for the years 2010-2011 and 2011 were selected. Both databases were merged and, after cleaning up those observations with missing values, produced a Total sample of 172116 participants, keep in mind that the number of participants varies according to each country.

Following the objective of studying the causes of the gender gap in entrepreneurship identified in the literature (see for example Santos, Roomi and Linan (2014), Green, Han and Marlow (2013), Ventura Fernandez and Quero Gervilla (2013)) , And taking into account the variables measured by the GEM project consistent with the theory of planned behavior (TPB, Theory of Planned Behavioral, see Ajzen (1991)), the user can only choose as dependent variable variables related to the phases of the activity Entrepreneur, namely:

#### Dependent Variables

* Futsupno: business intentions people waiting to start a new business in the next 36 months. This variable assumes two categories, "Yes" and "No", the last one is the reference category.
* SUBOANW: born entrepreneurs. This variable assumes two categories, "Yes" and "No", the last one is the reference category.
* BABYBUSM: owner of a new company. This variable assumes two categories, "Yes" and "No", the last one is the reference category.
* ESTBBUSM: owner of an established company. This variable assumes two categories, "Yes" and "No", the last one is the reference category.
* TEAyy: person who is involved in early entrepreneurship. This variable assumes two categories, "Yes" and "No", the last one is the reference category.

TPB has been frequently applied in entrepreneurship studies, especially to model the entrepreneurial intention; Considers that there are three perceptions that directly influence the individual intention to venture into the creation of a new business, namely: first, the individual attitude towards entrepreneurship (PA, Personal Attitude) is the degree of attractiveness of becoming an entrepreneur; Second, the Perceived Behavioral Control (PBC), refers to the individual ability to develop entrepreneurial behavior; And third, perceived subjective norms (SN), is the approval (or not) of the individual decision to create a business by people in their environment or environment, and captures the influence of society around the individual.

Interpreting the variables measured by the GEM project in the light of the TPB, the following independent variables that may impact the entrepreneurial behavior are chosen:

#### Socioeconomic variables

* Age: the age of the people at the time of responding to the survey. It is a continuous variable.
* Age9c: is the variable age transformed into a categorical variable. This variable assumes the following categories: 0 to 17, 18 to 24, 25 to 34, 35 to 44, 45 to 54, 55 to 64 and 65 to 120. The first category, 0 to 17 is the reference category.
* Gender: is the gender variable. This variable assumes the following categories: Female and Male. Famale is the reference category.
* GEMEDUC: is the educational level of the participants. This variable assumes the following categories: NONE, SOME SECONDARY, SECONDARY DEGREE, POST SECONDARY, GRAD EXP. The first category, NONE, is the reference category.
* GEMWORK3: is the work status of the participants. This variable assumes the following categories: Not working, Retired students, Work: F T. The first category, Not working, is the reference category.
* GEMHHINC: is household income. This variable assumes the following categories: Lowest 33% tile, Middle 33% tile, Upper 33% tile. The first category, Lowesst 33% tile, is the reference category.

#### Perceptual Variables

* Opport: perception of good opportunities to start a business in the area where you live. This variable assumes two categories, "Yes" and "No", the last one is the reference category.
* Suskill: perception of having the knowledge and skills necessary to start a business. This variable assumes two categories, "Yes" and "No", the last one is the reference category.
* Fearfail: fear of failure would prevent you from starting a business. This variable assumes two categories, "Yes" and "No", the last one is the reference category.

#### Environment variables

* Nbgoodc: People consider starting a business is a desirable career choice. This variable assumes two categories, "Yes" and "No", the last one is the reference category.
* Nbstatus: Those successful people in the creation of companies have a high level of status and respect. This variable assumes two categories, "Yes" and "No", the last one is the reference category.
* Knowent: personally knows someone who started a business in the last 24 months. This variable assumes two categories, "Yes" and "No", the last one is the reference category.
* Nbmedia: You often observe in the public media stories about the success of new businesses. This variable assumes two categories, "Yes" and "No", the last one is the reference category.

In this division, in the lateral panel, the user can choose a country, a dependent variable and multiple independent variables. A binomial logistic regression model was automatically estimated; The main panel will reflect for each independent variable the estimated coefficients (Estimate), the standard error (Std. Error), the value z (z value) and the value p (Pr (> | z |)). By default, the variables *futsup* and *gender* are selected, and in the main panel it is observed that the estimated coefficient for the variable genus is positive (0.293131) and with p value less than 0.05, then it can be stated that at level Men are more prone to entrepreneurial intent than women. Note that in the estimated model the name corresponding to the gender variable is **genderMale**, that means that the reference category is **Female**, this is important because at the time of interpreting the coefficients of qualitative variables must be taken Taking into account that the different categories assumed by that variable are compared with the reference category.

In addition to estimating and specifying a logistic regression model in the light of the TPB, the user has the possibility to evaluate this theory with respect to the gender, and in that way, to analyze statistically the gap. This is possible only by selecting the "Interaction with the gender variable" box, it is automatically added to the model that you want to specify an interaction term with the variable gender for each independent variable selected. Example, if the user selects the futsup as the dependent variable, as age-independent variable and selects the "Interaction with the gender variable", a model with the following coefficients is estimated: age associated ( -0.03 with a p-value of less than 0.05), associated with gender (0.24 with p-value less than 0.05) and that associated with the term interaction between age and gender (0.001 with p-value greater than 0.05). These results express that the age and gender are related to the entrepreneurial intention, specifically the men have a greater entrepreneurial intention than the women (evidence of the gap) and as age increases the age the entrepreneurial intentions are diminishing result coherent with the Empirical findings; The term interaction indicates whether there is any difference between men and women regarding the relationship between age and the intention to undertake, ie provides evidence to explain the gender gap, the statistical significance of such interaction means the negative association between Age and the entrepreneurial intention does not differ between men and women, that is to say for both genres the older people are less likely to create a business.

### Multivariate Graphs

It is a division different from the others because it is not structured in panels. In a single work area is added the graph, and below are the buttons that control it, this with the purpose to take better advantage of the area of graphing so that the more complex graphics have a better appearance. In this tab the user is offered the possibility of using one of the most powerful graphing systems in the world of statistical software: the package or library "ggplot2" by Wickham (2009) who implemented in software R grammar of graphs (Grammar Of Graphics) proposed by Wilkinson (2005) when only university student.

The data that are plotted in this tab are those used in the tab *Multivariate binomial logistic regression models*. Due to the nature of the same as the majority are categorical data, except for the variable age, only bar charts are used. The freedom of the user is restricted because it can only graph the relationship of multiple independent variables with the variables that represent the phases of the enterprise, ie no graph can be made to investigate the association between income and the educational level of the participants. In spite of this restriction the possibilities are abundant to study the gender gap with respect to the emprendimiento.

By default the graph shown corresponds to the absolute frequency of the futsup intentions with respect to the variable gender (gender) worldwide. There are two grids or columns with the graph previously described: in the first column is the absolute frequency of men and women who did not show an entrepreneurial intention, 59,906 men and 63,261 women, of all the participants, do not have the intention to undertake. In the second column represents those who expressed the intention to create a business, it is evident that at the global level, men are more with this intention in comparison with women, in this way, the grid is painted the gender gap for Data collected in 2011 and 2012. It is clear that the button *Choose the number of columns for your graph* influences the number of columns or squares, it will be very useful when the user dares to choose two or more independent variables.

### Documentation

This tab has the purpose of explaining to the user the structure of the application. There is the same description made in this document.

## References

- Ajzen, I. (1991). "The Theory of Planned Behavior". *Organizational Behavior and Human Decision Processes*. 50(2), 179 211.
- Green, F. J., Han, L., y Marlow, S. (2013). Like Mother, Like Daughter? Analyzing Maternal Influences Upon Women s Entrepreneurial Propensity. *Entrepreneurship Theory and Practice*, 687 711.
- Santos, F., Roomi, M., y Linan, F. (2014). About Gender Differences and the Social Environment. *Journal of Small Business Management*.
- Ventura Fernandez, R., y Quero Gervilla, M. (2013). Factores explicativos de la intencion de emprender en la mujer. Aspectos diferenciales en la poblacion universitaria segun la variable genero. Cuadernos de Gestion, 13(1), 127 149. doi:10.5295 cdg.100271rv








