homogeneousFont
===============

A function which returns a UIFont to fit the width and height of some specific area (UILabel, UIView, etc.).

In this case it is made to receive an array of texts so that someone can generate dynamically the texts using the same size and font based on the larger text.

===============
Esta es una primera aproximación para una función que me permita determinar programáticamente el tamaño de la letra de controles UILabel de acuerdo a un ancho predeterminado o más bien, a un rectángulo predeterminado.

La idea es tener una lista de textos que se cargan de algún origen cualquiera de datos dinámicamente y que posteriormente se colocarán en controles UIView (en mi caso particular) cuya dimensión también es generada en forma dinámica.

Empezamos con un tamaño mínimo de fuente muy grande (minSizeOfFont) y un tamaño de letra (tempSize) cualquiera, para este caso le ponemos 12.

Posteriormente recorremos el arreglo que contiene los textos y usamos sizeWithAttributes para obtener el tamaño del rectángulo que contiene cada texto y se compara con el tamaño del rectángulo que se pasó como parámetro a la función.

Obtenemos una proporción entre ambos anchos y la aplicamos al tamaño de letra temporal (tempSize).

Luego obtenemos el tamaño mínimo de la fuente (minSizeOfFont) mismo que va a ser usado para armar el UIFont que se va a retornar.

Y por último revisamos la altura del rectángulo contenedor del texto y solamente si la altura requerida es mayor que la proporcionada a la función aplicamos una nueva proporción para reducir una vez más el tamaño de la fuente (minSizeOfFont). 

