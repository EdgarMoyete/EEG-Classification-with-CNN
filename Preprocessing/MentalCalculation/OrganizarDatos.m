% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 30/04/20-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% Acomodar los datos para que queden concatenados los canales
% Input shape: (1344*n_muestras) x n_canales = (1344*n_muestras) x 32
% Output shape: n_muestras x (1344*32=43008) = n_muestras x 43008
% las filas son el numero de ejemplos y las columnas son los 2.625 seg a
% 512 Hz de los 32 canales concatenados (43008)

clear
clc

% cargar datos, cambiar sujeto y sesion
load('Filtradas_car_15_2.mat');

n_muestras = length(signals_filtradas) / 1344; % n ejemplos

% matriz para guardar EEG con la nueva organizacion
nuevo = zeros(n_muestras, 43008);

contador2 = 1;
for i=1:n_muestras % n ejemplos
    contador1=1;
    for j=1:32 % n canales
        nuevo(i, contador1:contador1+1343)...
            = signals_filtradas(contador2:contador2+1343, j);
        % 1344 por que son 2.625 segundos a 512 Hz
        contador1 = contador1 + 1344;
    end
    % 1344 por que son 2.625 segundos a 512 Hz
    contador2 = contador2 + 1344;
end

%cambiar sujeto y sesion
csvwrite('MeCa_car_15_2.csv',nuevo); % guardar en .csv
save('MeCa_car_15_2.mat','nuevo'); % guardar en .mat