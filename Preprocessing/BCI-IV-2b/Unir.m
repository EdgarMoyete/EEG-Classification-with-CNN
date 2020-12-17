% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 20/07/20-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% Unir subconjuntos

clear
clc

train = [];
test = [];

load('MI901T.mat')
train = [train; signals];
clear signals

load('MI902T.mat')
train = [train; signals];
clear signals

load('MI903T.mat')
train = [train; signals];
clear signals

load('MI904E.mat')
test = [test; signals];
clear signals

load('MI905E.mat')
test = [test; signals];
clear signals

save('MI_train_9.mat','train');
save('MI_test_9.mat','test');