% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 30/04/20-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones 
% bidimensionales y redes neuronales convolucionales
% Unir subconjuntos para que quede uno por sesion

clear
clc

union = [];
etiquetas = [];

load('Sub03ATH-03-1.mat')
union=[union; signals];
clear signals
load('Sub03ATH-03-2.mat')
union=[union; signals];
clear signals
% load('Sub03ATH-02-3.mat')
% union=[union; signals];
% clear signals

load('EtiMC03ATH-03-1.mat')
etiquetas=[etiquetas; labels];
clear labels
load('EtiMC03ATH-03-2.mat')
etiquetas=[etiquetas; labels];
clear labels
% load('EtiMC03ATH-02-3.mat')
% etiquetas=[etiquetas; labels];
% clear labels

%cambiar sujeto y sesion
save('MC03ATH-03.mat','union');
csvwrite('EtiquetasMeCa03ATH-03.csv',etiquetas);