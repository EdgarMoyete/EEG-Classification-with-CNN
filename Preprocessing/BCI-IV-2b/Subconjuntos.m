% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 20/07/20-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% Subconjuntos de datos para BCI-IV-2b
% Obtenemos los 4seg de imaginacion motora del segundo 3 al 7
% Fs=250Hz, por lo tanto en 4seg son 1000 datos
% Input Shape: todox6
% Output Shape: (n ejemplos*1000)x3 (n ejemplosx4x250)x3
% [(n ejemplos x seg x fs) x n canales]
% se necesita ejecutar biosig_installer.m

clear
clc

% cambiar los cuatro numeros despues de B por el numero de sujeto
% y revisar si es T o E
[s, h] = sload('B0905E.gdf'); % cargar los datos
n_muestras = length(h.TRIG); % calcular n de ejemplos

% matriz para guardar los segmentos de imaginacion motora
signals = zeros(n_muestras*1000, 3);
contador = 1;
for i=1:n_muestras %n muestras
    % s(3seg : 7seg, n canal)
    % senal de todos los canales del segundo 3 al 7
	signals(contador:contador+999, 1:3) = ...
        s(h.TRIG(i)+751 : h.TRIG(i)+1750, 1:3);
	contador = contador + 1000; % 1000 por que son 4 segundos a 250 Hz
end
% guardar los segmentos de imaginacion motora
% cambiar los cuatro numeros despues de B por el numero de sujeto
% y revisar si es T o E
save('MI905E.mat','signals');