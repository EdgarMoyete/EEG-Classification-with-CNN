% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 25/02/20-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% Subconjuntos de datos para Mental_Calculation (senales y etiquetas)
% Se obtienen para cada archivo de cada una de las tres sesiones de cada
% sujeto
% Fs=512Hz, por lo tanto en 2.625seg son 1344 datos
% Unas muestras miden 1408 y otras 1344 por lo tanto todas se recortaran a
% 1344, asi que a las de 1408 se le recortaran 32 puntos al inicio y al
% final de la senal
% Input: ejecutar ejemplo_de_carga.m (este archivo pertenece al autor del
% conjunto de datos mental calculation)
% Output: Subaabbbb-c-d.mat, EtiMCaabbbb-c-d.mat
% aa = numero sujeto, bbbb = nombre del sujeto, c = sesion,
% d = n archivo de cada sesion
% Input shape: signal registrada
% Output shape: (n_muestrasx1344)x32

clc

% vector para guardar las etiquetas
labels=[];
% 140 muestras, es lo maximo que tiene cada archivo de cada sesion
for i=1:140
    % 0 = descanso y 1 = calculo
	if etiqueta(i,3) == 0 || etiqueta(i,3) == 1 % 3 por la tercer columna
        labels = [labels etiqueta(i,3)];
    end
end
labels = labels'; % guardar en forma de columna

n = length(labels)*1344;
% matriz para guardar los segmentos de calculo mental
signals = zeros(n, 32);
for canal=1:32 % 32 canales
	contador = 1;
    % cuenta = 0; % cuenta las muestras con etiqueta 0 o 1
    for i=1:140 %140 muestras
        % 3 es la tercer columna
        if etiqueta(i,3) == 0 || etiqueta(i,3) == 1
            % con estas dos lineas me di cuenta del tamaño de cada muestra
            % x = signal(ind(i) : ind(i+1)-1, canal);
            x = signal(ind(i) : ind(i)+1343, canal);
            % disp(size(x));
            % disp(etiqueta(i,3)); % imprimir etiqueta
            % cuenta = cuenta + 1;
            [f, c] = size(x);
            if f == 1408
                % signals(contador:contador+1343, canal) =
                % signal(ind(i)+32 : ind(i+1)-1-32, canal);
                signals(contador:contador+1343, canal) = ...
                    signal(ind(i)+32 : ind(i)+1343, canal);
            else
                % signals(contador:contador+1343, canal) =
                % signal(ind(i) : ind(i+1)-1, canal);
                signals(contador:contador+1343, canal) = ...
                    signal(ind(i) : ind(i)+1343, canal);
            end
            % 1344 por que son 2.625 segundos a 512 Hz
            contador = contador + 1344;
        end
    end
    % disp(cuenta);
end

% cambiar sujeto, cambiar el num de sesion y el num de archivo
save('Sub15RMFH-03-3.mat','signals');
save('EtiMC15RMFH-03-3.mat','labels');