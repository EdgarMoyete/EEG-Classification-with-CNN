% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 24/07/20-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% Subconjuntos de BCI-II-III
% Obtenemos los 6 seg de imaginacion motora del segundo 3 al 9
% Fs=128Hz, por lo tanto en 6 seg son 768 datos
% Input Shape: 1152x3x140 = (9x128)x3x140
% [(seg x fs) x n canales x n muestras]
% Output Shape: 107520 x 3 = (140x6x128)x3
% [(n muestras x seg x fs) x n canales]
% n muestras = 140
% seg = 6
% fs = 128
% n canales = 3

clear
clc

load('dataset_BCIcomp1.mat'); % cargar los datos
forma = size(x_train);
n_muestras = forma(3); % n ejemplos
% matriz para guardar los segmentos de imaginacion motora
signals = zeros(n_muestras*6*128, 3);
contador = 1;
for i=1:n_muestras
    %s(3seg : 9seg, n canal)
    % senal de todos los canales del segundo 3 al 9
    signals(contador:contador+767, 1:3) = x_test(385:1152,:,i);
	contador = contador + 768; % 768 por que son 6 segundos a 128 Hz
end
% guardar los segmentos de imaginacion motora
save('MI_test.mat','signals');