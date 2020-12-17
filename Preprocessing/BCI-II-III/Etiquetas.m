% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrof�sica �ptica y Electr�nica (INAOE)
% 24/07/20-02/12/20
% Tesis: Clasificaci�n de se�ales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% Etiquetas

clear
clc

load('dataset_BCIcomp1.mat');
etiquetas_train = y_train - 1;

load('labels_data_set_iii.mat');
etiquetas_test = y_test - 1;

csvwrite('etiquetas_train.csv', etiquetas_train);
csvwrite('etiquetas_test.csv', etiquetas_test);