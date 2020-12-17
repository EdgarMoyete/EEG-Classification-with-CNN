% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 30/04/20-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% Filtro pasa banda de 8-30hz
% Se filtraran todas las señales con un solo comando
% Input Shape: (n ejemplos*1000)x3
% Output Shape: (n ejemplos*1000)x3
% canal C4 es el 19
% muestra 1 es derecha para el sujeto 1

clear
clc

% cargar datos, cambiar sujeto y sesion
load('MC_CAR_15_2.mat');
fs = 512; % frecuencia de muestreo

% filtro pasa banda de 8 a 30 Hz
signals_filtradas = bandpass(car, [8 30], fs);

% guardar senales filtradas, cambiar sujeto y sesion
save('Filtradas_car_15_2.mat','signals_filtradas');

% % Esto es para graficar la diferencia de la senal y sus espectros con FFT
% subplot(2,1,1);
% c4 = escalar(1:1344,19); %muestra 1=1:1344, 6=6721:8064
% plot(c4,'LineWidth',1);
% hold on
% muestra 1=1:1344, 6=6721:8064
% c4_filtradas = signals_filtradas(1:1344,19);
% plot(c4_filtradas,'LineWidth',1);
% grid;
% xlabel('Time');
% ylabel('Amplitude');
% legend('C4 Escalado','C4 Pasa Banda 8Hz-30Hz');
% hold off
% 
% % FFT
% [P1_1, f_1] = transformadaFourier(c4', fs);
% [P1_2, f_2] = transformadaFourier(c4_filtradas', fs);
% 
% subplot(2,1,2);
% plot(f_1, P1_1,'LineWidth',1);
% hold on
% plot(f_2, P1_2,'LineWidth',1);
% title('Fast Fourier Transform');
% xlabel('Frequency');
% ylabel('Power');
% legend('C4 Escalado','C4 Pasa Banda 8Hz-30Hz');
% axis([0 35 0 1.5]);
% grid;
% %--------------------------------------------------
% % Funciones
% %--------------------------------------------------
% function [P1, f] = transformadaFourier(senal, fs)
%     [f, tamanoSenal]=size(senal);
%     Y = fft(senal);
%     % Calcule el espectro bilateral P2. A continuación, calcule el
%     % espectro unilateral P1 basado en P2 y la longitud de la señal de
%     % valor uniforme L
%     P2 = abs(Y/tamanoSenal);
%     P1 = P2(1:floor(tamanoSenal/2+1));
%     P1(2:end-1) = 2*P1(2:end-1);
%     f = fs*(0:(tamanoSenal/2))/tamanoSenal;
% end