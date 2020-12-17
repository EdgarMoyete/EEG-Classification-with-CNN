% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 20/07/20-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% Reemplazar NaN por los valores obtenidos con el filtro mediana
% Input Shape: (n_muestra*1000)x3
% Output Shape: (n_muestra*1000)x3

clear
clc

% cargar datos, cambiar el numero por el numero del sujeto
load('MI_test_9.mat');
% matriz para guardar las senales sin NaN
signals_limpias = zeros(size(test));

contador = 1;
n_muestras_nan = 0; % contar el numero de ejemplos NaN
n_muestras = length(test)/1000;
for i=1:n_muestras % n ejemplos
    % leer todos los canales de cada ejemplo
    muestra = test(contador:contador+999,:);
    % si hay un NaN
    if sum(sum(isnan(muestra))) > 0
        % filtro mediana de orden 255
        y = medfilt1(muestra,255,'omitnan');
%         figure;
%         plot(muestra);
%         grid;
        % reemplazar NaN por los valores del filtro mediana en cada ejemplo
        muestra(isnan(muestra)) = y(isnan(muestra));
%         figure;
%         plot(muestra);
%         grid;
        % guardar la muestra sin NaN
        signals_limpias(contador:contador+999, :) = muestra;
        n_muestras_nan = n_muestras_nan + 1;
        disp('Muestra numero');
        disp(i);
    else % si no hay NaN, copiar los valores sin reemplazar nada
        signals_limpias(contador:contador+999, :) =...
            test(contador:contador+999, :);
    end
    contador = contador + 1000; % 1000 por que son 4 segundos a 250 Hz
end
disp('Numero de muestras NaN');
disp(n_muestras_nan);
%cambiar el numero por el numero del sujeto
save('Limpios_test_9.mat','signals_limpias');