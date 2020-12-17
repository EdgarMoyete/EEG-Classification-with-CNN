% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 05/11/19-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% Reemplazar NaN por los valores obtenidos con el filtro mediana
% Input Shape: 288000x22
% Output Shape: 288000x22

clear
clc

% cargar datos
% cambiar el 01 por el numero de sujeto y revisar si es T o E
load('MotorImageryA09E.mat');

% matriz para guardar las senales sin NaN
signals_limpias = zeros(size(signals));

contador = 1;
n_muestras_nan = 0; % contar el numero de ejemplos NaN
for i=1:288 % 288 es n ejemplos
    % leer todos los canales de cada ejemplo
    muestra = signals(contador:contador+999,:);
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
        signals_limpias(contador:contador+999, :) = ...
            signals(contador:contador+999, :);
    end
    contador = contador + 1000; % 1000 por que son 4 segundos a 250 Hz
end
disp('Numero de muestras NaN');
disp(n_muestras_nan);
%cambiar el 01 por el numero de sujeto y revisar si es T o E
save('LimpiosA09E.mat','signals_limpias');