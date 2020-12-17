% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 20/07/20-24/11/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% Unir etiquetas
% train = 3 primeras sesiones
% test = 2 ultimas sesiones

clear
clc

% train
etiquetas_train = [];

load('B0901T.mat');
etiquetas_train = [etiquetas_train; classlabel - 1];
clear classlabel

load('B0902T.mat');
etiquetas_train = [etiquetas_train; classlabel - 1];
clear classlabel

load('B0903T.mat');
etiquetas_train = [etiquetas_train; classlabel - 1];
clear classlabel

% test
etiquetas_test = [];

load('B0904E.mat');
etiquetas_test = [etiquetas_test; classlabel - 1];
clear classlabel

load('B0905E.mat');
etiquetas_test = [etiquetas_test; classlabel - 1];
clear classlabel

csvwrite('etiquetas_train_9.csv', etiquetas_train);
csvwrite('etiquetas_test_9.csv', etiquetas_test);