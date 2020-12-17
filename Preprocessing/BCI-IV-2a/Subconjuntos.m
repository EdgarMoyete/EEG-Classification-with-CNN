% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 16/10/19-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% Subconjuntos de datos para BCI-IV-2a
% Obtenemos los 4seg de imaginacion motora del segundo 2 al 6
% Fs=250Hz, por lo tanto en 4seg son 1000 datos
% Input Shape: todox25
% Output Shape: 288000x22 (288x4x250)x22 [(n ejemplos x seg x fs) x
% n canales]
% se necesita ejecutar biosig_installer.m

clear
clc

% cargar los datos
% cambiar el 01 por el numero de sujeto y revisar si es T o E
[s, h] = sload('A01T.gdf');

% matriz para guardar los segmentos de imaginacion motora
signals = zeros(288000, 22);

for columna=1:22 %22 canales
	contador = 1;
    for i=1:288 %288 muestras
        % s(2seg : 6seg, num canal)
        % senal de cada canal del segundo 2 al 6
        signals(contador:contador+999, columna) = ...
            s(h.TRIG(i)+500 : h.TRIG(i)+1499, columna);
        contador = contador + 1000; % 1000 por que son 4 segundos a 250 Hz
    end
end
% guardar los segmentos de imaginacion motora
% cambiar el 01 por el numero de sujeto y revisar si es T o E
save('MotorImageryA01T.mat','signals');