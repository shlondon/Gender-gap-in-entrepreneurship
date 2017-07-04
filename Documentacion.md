# Emprendimiento, Genero y GEM

Este aplicativo es construido para aquellas personas 
interesadas en analizar el emprendimiento desde un enfoque de genero.
Tambien va dirigido a ayudar a quienes tienen dificultad para crear graficos y 
estadistica inferencial debido a que no tienen el entrenamiento en
el manejo de software y bases de datos. Es un aplicativo sujeto a miriadas de mejoras, asi que puedes
proponer mejoras o nuevas ideas y enviarlas al correo: slondono@coruniamericana.edu.co

Tiene como objetivo crear graficos y estimar modelos de regresion logistica binomial multivariados
para analizar la brecha de genero en la actividad emprendedora 
detectada por el proyecto Global Entrepreneurship Monitor (GEM).

Cada una de las bases de datos mencionadas se pueden obtener en http://www.gemconsortium.org/data/sets

## Estructura del aplicativo

El aplicativo esta estructurado en cinco divisiones o pestanas (tags): *Grafica brecha de genero en la TEA*, *Grafica disparidad de genero en la TEA*, 
*Modelo de regresion logistica binomial multivariado*, *Graficos multivariados* y *Documentacion*. Por defecto, el aplicativo inicia en la pestana *Grafica brecha de 
genero en la TEA*. A continuacion se explicaran las posibilidades de interaccion que tiene el usuario en cada una de las divisiones del aplicativo:

### Grafica brecha de genero en la TEA

En esta parte del aplicativo el usuario se encuetra con dos paneles: uno al lado izquierdo, panel lateral, con los botones o controladores que
influiran sobre la grafica ubicada en el segundo panel, el panel principal.

Dicha grafica expresa la brecha de genero en la tasa de actividad emprendedora temprana (TEA), la cual refleja el porcentaje de personas entre las encuestadas
que son propietarias o hacen parte de un negocio, o que son autoempleados, en un periodo de tiempo menor a 36 meses. En el eje *y* es la TEA y el eje *x* es el tiempo.
La linea de color verdeazul representa la TEA del genero masculino y la linea de color rojo la del femenino. La grafica que se presenta por defecto
revela la superior tasa de actividad emprendora temprana de los hombres sobre las mujeres, expresando asi una brecha de genero en el emprendimiento.

La grafica no es inmutable, los cinco botones del panel lateral permiten alterarla de acuerdo a las necesidades del usuario. El boton **Elige un pais** permite
reproducir la situacion del emprendimiento con respecto al genero en cada uno de los paises, y observar su evolucion. Los botones restantes determinan
el aspecto del grafico, por ejemplo el boton **Elige el grosor de las lineas** configura el grueso del color de las lineas, y los botones **Elige la escala en el 
eje x** y **Elige la escala en el eje y** generan diferentes efectos sobre la forma de la brecha de genero. De esta manera, con dichos botones el 
usuario, puede construir un grafico listo para copiar y pegar en sus publicaciones, siempre y cuando cite el aplicativo ;)

La base de datos que se utiliza para crear el grafico se denomina 
**GEM 2001  2015 APS Global Key Indicators (Excel Format)**, alli se encuentra consolidado por genero, pais y periodo la TEA, 
El resto de variables sobre las cuales se podrian graficar con respecto al tiempo y el genero no estan consolidadas aun, seria 
muy interesante tener a disposicion de los usuarios cada una de esas posibilidades, sin embargo esa sera una de las principales 
mejoras a tener en cuenta.

### Grafica brecha disparidad de genero en la TEA

Se mantiene la estructura y el proposito de la division anterior: en cuanto a la estructura hay un panel lateral y otro principal, los botones
son los mismos y son ellos los que controlan la grafica del panel principal. La diferencia radica en que el grafico expresa
la disparidad de genero con respecto a la TEA. La disparidad se asume como la division de la TEA masculina entre la TEA femenina,
de esta manera si se obtien una disparidad de 1.89 significa que por cada mujer que reporta actividad emprendedora temprana, hay 1.89 hombres emprendiendo.

### Modelos de regresion logistica binomial multivariados

Del proyecto GEM se seleccionaron las bases de datos de la encuesta a la poblacion adulta (APs, Adult Population Survey)
correspondientes a los peridos 2010 2011 y 2011 2012. Ambas bases de datos se unieron y luego de limpiar
aquellas observaciones con valores perdidos produjo una muestra total de 172116 participantes, tener presente que la cantidad de participantes varia de acuerdo
a cada pais.

Siguiendo el objetivo de estudiar las causas de la brecha de genero en el emprendimiento identificada en la literatura (ver por ejemplo Santos, Roomi y Linan (2014),
Green, Han y Marlow (2013), Ventura Fernandez y Quero Gervilla (2013)) y 
teniendo en cuenta las variables medidas por el proyecto GEM coherentes con la teoria del comportamiento planeado (TPB, Theory of Planned Behavioral,
ver Ajzen (1991)), el usuario solo puede elegir como variable dependiente variables relacionadas a las fases de la actividad emprendedora, a saber:

#### Variables dependientes

* futsupno: intenciones empresariales  personas esperando a iniciar un nuevo negocio en los proximos 36 meses. Esta variable asume dos categorias, "Yes" y "No", la ultima es la categoria referencia
* SUBOANW: emprendedores nascientes. Esta variable asume dos categorias, "Yes" y "No", la ultima es la categoria referencia.
* BABYBUSM: propietario de una empresa nueva. Esta variable asume dos categorias, "Yes" y "No", la ultima es la categoria referencia.
* ESTBBUSM: propietario de una empresa establecida. Esta variable asume dos categorias, "Yes" y "No", la ultima es la categoria referencia.
* TEAyy: persona que esta involucrada en la actividad emprendedora temprana. Esta variable asume dos categorias, "Yes" y "No", la ultima es la categoria referencia.


La TPB ha sido aplicada frecuentemente en los estudios sobre emprendimiento, especialmente para modelar la intencion emprendedora; 
considera que existen tres percepciones que influyen directamente sobre la intencion individual de aventurarse en la creacion de un nuevo negocio, a saber: 
primera, la actitud individual hacia el emprendimiento (PA, Personal Attitude), es el grado de atraccion de convertirse en emprendedor; 
segunda, el control del comportamiento hacia el emprendimiento (PBC, Perceived Behavioral Control), se refiere a la habilidad individual de desarrollar el comportamiento emprendedor; 
y tercera, normas subjetivas percibidas (SN), es la aprobacion  (o no)  
de la decision individual de crear un negocio por parte de las personas en su ambiente o entorno, y captura la influencia de la sociedad alrededor del individuo.

Interpretando las variables que mide el proyecto GEM a la luz de la TPB se eligen las siguientes variables independiente que pueden impactar
la conducta emprendedora:

#### Variables socioeconomicas 
* age: edad de las personas en el momento de responder la encuesta. Es una variable continua.
* age9c: es la variable age transformada a variable categorica. Esta variable asume las siguientes categorias: 0 a 17, 18 a 24, 25 a 34, 35 a 44, 45 a 54, 55 a 64 y 65 a 120. La primera categoria, 0 a 17 es la categoria referencia.
* gender: es la variable genero. Esta variable asume las siguientes categorias: Female y Male. Famale es la categoria referencia.
* GEMEDUC: es el nivel educativo de los participantes. Esta variable asume las siguientes categorias: NONE, SOME SECONDARY, SECONDARY DEGREE, POST SECONDARY, GRAD EXP. La primera categoria, NONE, es la categoria referencia.
* GEMWORK3: es el estado laboral de los participantes. Esta variable asume las siguientes categorias: Not working, Retired students, Work:F T. La primera categoria, Not working, es la categoria referencia.
* GEMHHINC: es el ingreso del hogar. Esta variable asume las siguientes categorias: Lowest 33%tile, Middle 33%tile, Upper  33%tile. La primera categoria, Lowesst 33%tile, es la categoria referencia.

#### Variables perceptuales
* opport: percepcion de buenas oportunidades para iniciar un negocio en el area donde vive. Esta variable asume dos categorias, "Yes" y "No", la ultima es la categoria referencia.
* suskill: percepcion de tener el conocimiento y las habilidades necesarias para iniciar un negocio. Esta variable asume dos categorias, "Yes" y "No", la ultima es la categoria referencia.
* fearfail: el miedo al fracaso le impediria iniciar un negocio. Esta variable asume dos categorias, "Yes" y "No", la ultima es la categoria referencia.

#### Variables de entorno o ambiente
* nbgoodc: las personas consideran que iniciar un negocio es una eleccion de carreara deseable. Esta variable asume dos categorias, "Yes" y "No", la ultima es la categoria referencia.
* nbstatus: aquellas personas exitosas en la creacion de empresas tienen un nivel alto de status y respeto. Esta variable asume dos categorias, "Yes" y "No", la ultima es la categoria referencia.
* knowent: personalmente conoce a alguien que inicio un negocio en los ultimos 24 meses. Esta variable asume dos categorias, "Yes" y "No", la ultima es la categoria referencia.
* nbmedia: usted con frecuencia observa en los medios de comunicacion publicos historias sobre el exito de nuevos negocios. Esta variable asume dos categorias, "Yes" y "No", la ultima es la categoria referencia.

En esta division, en el panel lateral, el usuario puede elegir un pais, una variable dependiente y multiples variables independientes. De manera automatica
se estimara un modelo de regresion logistica binomial; el panel principal reflejara para cada variable independiente, los coeficientes 
estimados (Estimate), el error estandar (Std. Error), el valor z (z value) y el valor p (Pr(>|z|)). Por defecto, estan seleccionadas las variables
*futsup* y *gender*, y en el panel principal se observa que el coeficiente estimado para la variable genero es positivo (0.293131) y con valor p menor a 0.05,
entonces se puede afirmar que a nivel mundial los hombres son mas propensos a la intencion emprendedora que la mujer. Notese que en el modelo estimado 
el nombre correspondiente a la variable genero es **genderMale**, eso significa que la categoria referencia es **Female**, esto es importante
porque en el momento de interpretar los coeficientes de variables cualitativas se debe tener en cuenta que las diferentes 
categorias que asume dicha variable se comparan con la categoria referencia.

Ademas de estimar y especificar un modelo de regresion logistica a la luz de la TPB, el usuario tiene la posibilidad de evaluar dicha teoria con respecto al genero,
y, de esa manera, analizar estadisticamente la brecha. Esto es posible solo con seleccionar la casilla "Interaccion con la variable genero", de forma automatica
se adiciona al modelo que se desea especificar un termino de interaccion con la variable genero por cada variable independiente seleccionada. Ejemplo, si el usuario
selecciona como variable dependiente la intencion emprendedora (futsup), como variable independiente la edad (age) y selecciona la casilla "Interaccion con la variable
genero" se estima un modelo con los siguientes coeficientes: el asociado a la edad (-0.03 con valor p inferior a 0.05), el asociado a el genero (0.24 con valor p
inferior a 0.05) y el asociado al termino interaccion entre la edad y el genero (0.001 con valor p superior a 0.05). Tales resultados expresan que la edad y
el genero tienen estan relacionados con la intencion emprendedora, concretamente los hombres tiene mayor intencion emprendedora que las mujeres (evidencia de la
brecha) y a medida que aumenta la edad la edad las intenciones emprendedoras van disminuyendo resultado coherente con los hallazgos empiricos; el termino
interaccion indica si existe alguna diferencia entre hombres y mujeres con respecto a la relacion entre la edad y la intencion de emprender, es decir
proporciona evidencia que explique la brecha de genero, la no significancia estadistica de dicha interaccion significa la asociacion negativa entre
la edad y la intencion emprendedora no difiere entre hombres y mujeres, es decir para ambos generos las personas mayores tiene menor probabilidad de crear
un negocio.

### Graficos multivariados

Es una division distinta a la demas pues no se estructura en paneles. En una sola area de trabajo se adiciona el grafico, y debajo se encuentran los
botones que lo controlan, esto con el proposito aprovechar mejor el area de graficacion de modo que las graficas mas complejas
tengan un mejor aspecto. En esta pestana se proporciona al usuario la posibilidad de usar uno de los mas poderosos sistemas de graficacion en el mundo del 
software estadistico: el paquete o libreria "ggplot2" de Wickham (2009) quien implemento en el software R la gramatica de graficas (Grammar of Graphics) propuesta
por Wilkinson (2005) cuando solo era estudiante universitario.
 
Los datos que se grafican en esta pestana son los utilizados en la pestana *Modelos de regresion logistica binomial multivariados*. Debido a la naturaleza
de los mismos pues la mayoria son datos categoricos, excepto la variable edad (age), se utilizan solo graficos de barras. La libertad del usuario se
restringe ya que solo podra graficar la relacion de multiples variables independientes con las variables que representan las fases del emprendimiento, es decir
no se puede realizar graficos para investigar la asociacion entre los ingresos y el nivel educativo de los participantes. A pesar de esa restriccion las posibilidades
son abundantes para estudiar la brecha de genero con respecto al emprendimiento.

Por defecto la grafica que se muestra corresponde a la frecuencia absoluta de la intencion emprendedora (futsup) con respecto a la variable genero (gender) a nivel
mundial. Se observan dos cuadriculas o columnas con la grafica descrita previamente: en la primera columna esta la frecuencia absoluta de hombres y mujeres
que no manifestaron intencion emprendedora, 59906 hombres y 63261 mujers, de todos los participantes, no tienen la intecion de emprender. En la segunda columna
representa a aquellos que manifestaron la intencion de crear un negocio, es evidente que a nivel mundial son mas los hombres con esta intencion en comparacion
con las mujeres, de esta manera, en dicha cuadricula se pinta la brecha de genero para los datos recolectado en los periodos 2011 y 2012. Es evidente que el boton
*Elige el numero de columnas para tu grafico* influye sobre el numero de columnas o cuadriculas, sera muy util cuando el usuario se atreva a elegir dos o mas
variables independientes.

### Documentacion

Esta pestana tiene el proposito de explicar al usuario la estructura del aplicativo. Alli se realiza la misma descripcion realizada en este documento.

## Referencias

- Ajzen, I. (1991). "The Theory of Planned Behavior". *Organizational Behavior and Human Decision Processes*. 50(2), 179 211.
- Green, F. J., Han, L., y Marlow, S. (2013). Like Mother, Like Daughter? Analyzing Maternal Influences Upon Women s Entrepreneurial Propensity. *Entrepreneurship Theory and Practice*, 687 711.
- Santos, F., Roomi, M., y Linan, F. (2014). About Gender Differences and the Social Environment. *Journal of Small Business Management*.
- Ventura Fernandez, R., y Quero Gervilla, M. (2013). Factores explicativos de la intencion de emprender en la mujer. Aspectos diferenciales en la poblacion universitaria segun la variable genero. Cuadernos de Gestion, 13(1), 127 149. doi:10.5295 cdg.100271rv

