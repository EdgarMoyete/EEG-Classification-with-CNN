% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 09/07/20-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% Filtro Laplaciano para usar solo dos canales (C3 y C4)
% Input shape: 288000x22
% Output shape: 288000x2
% canal C3 = 8
% canal C4 = 12
% muestra 3 es derecha para el sujeto 1

clear
clc

% cargar datos, cambiar por el numero de sujeto y revisar si es T o E
load('LimpiosA09E.mat');

% obtener senales EEG de los vecinos de los canales C3 y C4
c3_vecinos = [signals_limpias(:, 2) signals_limpias(:, 7) ...
    signals_limpias(:, 9) signals_limpias(:, 14)];
c4_vecinos = [signals_limpias(:, 6) signals_limpias(:, 11) ...
    signals_limpias(:, 13) signals_limpias(:, 18)];

% restar el promedio de los canales vecinos a C3 en cada instante de tiempo
c3_laplace = signals_limpias(:, 8) - mean(c3_vecinos, 2);

% restar el promedio de los canales vecinos a C4 en cada instante de tiempo
c4_laplace = signals_limpias(:, 12) - mean(c4_vecinos, 2);

% concatenar los canales C3 y C4 con filtro laplaciano en una matriz
laplace_c3_c4 = [c3_laplace c4_laplace];

%cambiar por el numero de sujeto y revisar si es T o E
%save('LaplaceA09E.mat','laplace_c3_c4');

% % Esto es para graficar la diferencia de la senal
% c4 = signals_limpias(2000:3000,12);
% plot(c4,'LineWidth',1);
% hold on
% c4_nuevo = c4_laplace(2000:3000);
% plot(c4_nuevo,'LineWidth',1);
% grid;
% xlabel('Time');
% ylabel('Amplitude');
% legend('C4','C4 Filter Laplacian');
% hold off