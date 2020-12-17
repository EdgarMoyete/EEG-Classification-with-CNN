% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 20/07/20-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% CAR (common average reference)
% Input Shape: (n_muestra*1000)x3
% Output Shape: (n_muestra*1000)x3
% canal C4 es el 3
% muestra 2 es derecha para el sujeto 1

clear
clc

% cargar datos, cambiar por el numero de sujeto y revisar si es T o E
load('Limpios_test_9.mat');

% promedio de todos los canales en cada instante de tiempo
% (promedio de cada punto), 2 para el promedio de cada fila
promedio = mean(signals_limpias,2);
car = signals_limpias - promedio; % restar promedio a las senales
% cambiar sujeto
save('CarB09E.mat','car');

% % Esto es para graficar la diferencia de la senal al aplicar CAR
% c4 = signals_limpias(1000:2000,3);
% plot(c4,'LineWidth',1);
% hold on
% c4_car = car(1000:2000,3);
% plot(c4_car,'LineWidth',1);
% grid;
% xlabel('Time');
% ylabel('Amplitude');
% legend('C4','C4 CAR');
% hold off