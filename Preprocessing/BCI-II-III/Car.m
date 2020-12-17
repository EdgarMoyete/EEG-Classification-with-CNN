% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 24/07/20-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% CAR (common average reference)
% Input Shape: (n_muestra*768)x3
% Output Shape: (n_muestra*768)x3
% canal C4 es el 3
% muestra 2 es derecha para train

clear
clc

% cargar datos
load('MI_test.mat');

% promedio de todos los canales en cada instante de tiempo
% (promedio de cada punto), 2 para el promedio de cada fila
promedio = mean(signals, 2);
car = signals - promedio; % restar promedio a las senales
% cambiar sujeto
save('Car_test.mat','car');

% % Esto es para graficar la diferencia de la senal al aplicar CAR
% c4 = signals(769:1536,3);
% plot(c4,'LineWidth',1);
% hold on
% c4_car = car(769:1536,3);
% plot(c4_car,'LineWidth',1);
% grid;
% xlabel('Time');
% ylabel('Amplitude');
% legend('C4','C4 CAR');
% hold off