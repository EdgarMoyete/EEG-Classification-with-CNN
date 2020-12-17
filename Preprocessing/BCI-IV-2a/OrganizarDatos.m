% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 16/10/19-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% Acomodar los datos para que queden concatenados los canales
% Input shape 288000x22
% Output shape 288*22000
% las filas son el numero de ejemplos (288) y las columnas son los 4 seg a
% 250 Hz de los 22 canales concatenados (22000)

clear
clc

% cargar datos
% cambiar por el numero de sujeto y revisar si es T o E
load('FiltradasA09E.mat');

% matriz para guardar EEG con la nueva organizacion
nuevo = zeros(288,22000);

contador2 = 1;
for i=1:288 % n ejemplos
    contador1=1;
    for j=1:22 % n canales
        nuevo(i, contador1:contador1+999)...
            = signals_filtradas(contador2:contador2+999, j);
        % 1000 por que son 4 segundos a 250 Hz
        contador1 = contador1 + 1000;
    end
    % 1000 por que son 4 segundos a 250 Hz
    contador2 = contador2 + 1000;
end

% cambiar por el numero de sujeto y revisar si es T o E
csvwrite('MI-EEG-A09E.csv',nuevo); % guardar en .csv
save('MI-EEG-A09E.mat','nuevo'); % guardar en .mat