% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 25/07/20-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% Acomodar los datos para que queden concatenados los canales
% Input Shape: (n_muestras*768)x3
% Output Shape: n_muestras*2304
% las filas son el numero de ejemplos y las columnas son los 6 seg a
% 128 Hz de los 3 canales concatenados (2304)

clear
clc

% cargar datos
load('Filtradas_test.mat');

n_muestras = length(signals_filtradas) / 768; % n ejemplos

% matriz para guardar EEG con la nueva organizacion
nuevo = zeros(n_muestras, 2304);

contador2 = 1;
for i=1:n_muestras % n ejemplos
    contador1 = 1;
    for j=1:3 % n canales
        nuevo(i, contador1:contador1+767)...
            = signals_filtradas(contador2:contador2+767, j);
        % 768 por que son 6 segundos a 128 Hz
        contador1 = contador1 + 768;
    end
    % 768 por que son 6 segundos a 128 Hz
    contador2 = contador2 + 768;
end

csvwrite('MIEEG_test.csv',nuevo); % guardar en .csv