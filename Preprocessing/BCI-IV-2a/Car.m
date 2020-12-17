% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 28/06/20-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% CAR (common average reference)
% Input shape: 288000x22
% Output shape: 288000x22
% canal C4 es el 12
% muestra 3 es derecha para el sujeto 1

clear
clc

% cargar datos, cambiar por el numero de sujeto y revisar si es T o E
load('LimpiosA09E.mat')

% promedio de todos los canales en cada instante de tiempo
% (promedio de cada punto), 2 para el promedio de cada fila
promedio = mean(signals_limpias,2);
car = signals_limpias - promedio; % restar promedio a las senales
% cambiar sujeto
save('CarA09E.mat','car');

% % Esto es para graficar la diferencia de la senal al aplicar CAR
% c4 = signals_limpias(2000:3000,12);
% plot(c4,'LineWidth',1);
% hold on
% c4_car = car(2000:3000,12);
% plot(c4_car,'LineWidth',1);
% grid;
% xlabel('Time');
% ylabel('Amplitude');
% legend('C4','C4 CAR');
% hold off