# EEG Classification with CNN
Código de la tesis “Clasificación de señales EEG basada en representaciones bidimensionales y redes neuronales convolucionales” desde el preprocesamiento hasta la clasificación de nuevos ejemplos de electroencefalograma (EEG) de imaginación motora o calculo mental. El flujo de trabajo de nuestra propuesta consiste en un preprocesamiento, una nueva representación de EEG y clasificación usando CNNs. El preprocesamiento consistió en aplicar la referencia CAR y un filtro pasa banda de 8-30Hz. Se propusieron dos representaciones que son espectrogramas con la transformada de Fourier de tiempo corto (STFT) y escalogramas con la transformada continua Wavelet (CWT). Para la clasificación se utilizaron dos clasificadores que son una red neuronal convolucional en dos dimensiones (CNN-2D) y la combinación de una CNN-2D con una red neuronal de memoria a corto y largo plazo (LSTM).
En este trabajo se utilizó el mismo pre-procesamiento, el mismo número de canales y la misma arquitectura de red para todos los sujetos de cada conjunto de datos. Los resultados de accuracy fueron 71.34% para BCI IV-2a (cuatro clases), 80.71% para BCI IV-2a (dos clases), 73.82% para BCI IV-2b, 83.57% para BCI II-III y 82.10% para cálculo mental.

English:
Thesis code "EEG signal classification based on bi-dimensional representations and Convolutional Neural Networks" from pre-processing to the classification of new examples of electroencephalogram (EEG) of motor imagery or mental calculation. The workflow of our proposal consists of a preprocessing, a new EEG representation and classification using CNNs. The preprocessing consisted of applying the CAR reference and an 8-30Hz band pass filter. Two representations were proposed which are spectrograms with the short time Fourier transform (STFT) and scalograms with the continuous wavelet transform (CWT). For the classification, two classifiers were used: a convolutional neural network in two dimensions (CNN-2D) and the combination of a CNN-2D with a neural network of short and long-term memory (LSTM).
In this work the same pre-processing, the same number of channels and the same network architecture were used for all the subjects of each data set. The accuracy results were 71.34% for BCI IV-2a (four classes), 80.71% for BCI IV-2a (two classes), 73.82% for BCI IV-2b, 83.57% for BCI II-III and 82.10% for mental calculation.


### Preprocessing
* `Subconjuntos.m`: Obtener el segmento de EEG de interés ya sea de imaginación motora o calculo mental
* `Unir.m`: Unir los segmentos de EEG o subconjuntos dado que vienen en partes
* `FiltroMediana.m`: Reemplazar los valores NaN por los valores obtenidos con el filtro mediana de orden 255
* `Car.m`: Referencia promedio común consiste en calcular el promedio de la señal en todos los electrodos de EEG y restarlo de la señal EEG de cada electrodo para cada punto de tiempo
* `FiltroLaplaciano.m`: Referenciado similar a CAR pero solo se utilizan los vecinos de los canales a utilizar, para BCI IV-2a se utilizo un filtro laplaciano con los canales C3 y C4
* `FiltroPasaBanda.m`: Filtro pasa banda de 8-30 Hz, en estas frecuencias es donde se encuentran las ondas cerebrales µ (8-13 Hz) y β (13-30 Hz)
* `OrganizarDatos.m`: Las señales quedaran con la siguiente estructura [n muestras, n canales], las filas son el número de ejemplos y las columnas son los m canales concatenados, dentro de cada celda se encuentran n puntos donde n es el tiempo por la frecuencia de muestreo
* `OrganizarDatosBinaria.m`: Organizar el EEG de los ejemplos con etiquetas mano izquierda y mano derecha en BCI IV-2a
* `OrganizarDatosLaplace.m`: Organizar el EEG cuando se utiliza filtro laplaciano en lugar de CAR en BCI IV-2a
* `Etiquetas.m`: Las etiquetas deben comenzar en 0, por ejemplo para un problema de 4 clases las etiquetas van del 0 al 3 y para un problema binario las etiquetas serian 0 y 1

### Representations
* `STFT_Img_iv_2a.ipynb`: Espectrograma con STFT de BCI IV-2a
* `STFT_Img_iv_2b.ipynb`: Espectrograma con STFT de BCI IV-2b
* `STFT_Img_ii_iii.ipynb`: Espectrograma con STFT de BCI II-III
* `STFT_Img_mc.ipynb`: Espectrograma con STFT de mental calculation
* `CWT_Img_iv_2a.ipynb`: Escalograma con CWT de BCI IV-2a
* `CWT_Img_iv_2b.ipynb`: Escalograma con CWT de BCI IV-2b
* `CWT_Img_ii_iii.ipynb`: Escalograma con CWT de BCI II-III
* `CWT_Img_mc.ipynb`: Escalograma con CWT de mental calculation

### Classification
* `EEGClassification.ipynb`: Entrenamiento y evaluacion de CNN-2D o CNN-2D + LSTM con STFT o CWT, 5 ejecuciones independientes
* `EEGClassification_CrossValidation.ipynb`: Entrenamiento y evaluacion de CNN-2D o CNN-2D + LSTM con STFT o CWT, Validacion cruzada
* `GridSearch.ipynb`: Búsqueda de cuadricula
* `Explorar.ipynb`: Visualización de espectrogramas con STFT, escalogramas con CWT y de la predicción de las redes neuronales (CNN-2D o CNN-2D + LSTM)
* `Predecir.ipynb`: Predecir la etiqueta de nuevos ejemplos de EEG

### EjemploEEG
Se encuentran 4 archivos para poder ejecutar un ejemplo:

* x_train: `MI-EEG-B9T.csv`

* x_test: `MI-EEG-B9E.csv`

* y_train: `etiquetas_train_9.csv`

* y_test: `etiquetas_test_9.csv`

### Data sets
* BCI Competition IV dataset 2a y BCI Competition IV dataset 2b

http://www.bbci.de/competition/iv/

http://www.bbci.de/competition/iv/desc_2a.pdf

http://www.bbci.de/competition/iv/desc_2b.pdf

http://bbci.de/competition/iv/results/

* BCI Competition II dataset III

http://www.bbci.de/competition/ii/

http://www.bbci.de/competition/ii/results/index.html

#### Mas información
* Tesis: link pendiente

* Articulo: link pendiente

* Explicación del código: link pendiente