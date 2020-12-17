% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 21/07/20-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% Acomodar los datos para que queden concatenados los canales
% Input Shape: (n_muestras*1000)x3
% Output Shape: n_muestras*3000
% las filas son el numero de ejemplos y las columnas son los 4 seg a
% 250 Hz de los 3 canales concatenados (3000)

clear
clc

% cargar datos
% cambiar por el numero de sujeto y revisar si es T o E
load('FiltradasB9E.mat');

n_muestras = length(signals_filtradas) / 1000; % n ejemplos

% matriz para guardar EEG con la nueva organizacion
nuevo = zeros(n_muestras, 3000);

contador2 = 1;
for i=1:n_muestras % n ejemplos
    contador1 = 1;
    for j=1:3 % n canales
        nuevo(i, contador1:contador1+999)...
            = signals_filtradas(contador2:contador2+999, j);
        % 1000 por que son 4 segundos a 250 Hz
        contador1 = contador1 + 1000;
    end
    % 1000 por que son 4 segundos a 250 Hz
    contador2 = contador2 + 1000;
end

% cambiar por el numero de sujeto y revisar si es T o E
csvwrite('MI-EEG-B9E.csv',nuevo); % guardar en .csv
save('MI-EEG-B1T.mat','nuevo'); % guardar en .mat