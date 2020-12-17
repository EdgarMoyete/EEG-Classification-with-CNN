% Edgar Moises Hernandez-Gonzalez
% Asesores: Pilar Gomez-Gil, Erik Bojorges-Valdez
% Instituto Nacional de Astrofísica Óptica y Electrónica (INAOE)
% 29/04/20-02/12/20
% Tesis: Clasificación de señales EEG basada en representaciones
% bidimensionales y redes neuronales convolucionales
% Solo usar los de mano izquierda y derecha para clasificacion binaria
% Input shape 288*22000
% Output shape 144*22000
% las filas son el numero de ejemplos (144) y las columnas son los 4 seg a
% 250 Hz de los 22 canales concatenados (22000)

clear
clc

% cargar datos
% cambiar por el numero de sujeto y revisar si es T o E
load('MI-EEG-A09E.mat')
load('Datos\Labels\A09E.mat')

% matriz para guardar EEG con la nueva organizacion
binarios = zeros(144,22000);

% vector para las etiquetas 
%etiquetas = zeros(144,1);

contador = 1;

% 288 para buscar en todas las clases
% en total son 4 clases con 72 ejemplos cada una
for i=1:288 % n ejemplos
    % clases: 1 (izquierda) y 2 (derecha)
    if classlabel(i) == 1 || classlabel(i) == 2
        % si es clase 1 o 2 guardar en la matriz binarios los EEG
        binarios(contador,:) = nuevo(i,:);
        
        % si es clase 1 o 2 guardar la etiqueta
        % -1 para que las etiquetas empiecen en 0
        %etiquetas(contador) = classlabel(i) - 1;
        
        % contar los ejemplos que sean igual a clase 1 o 2
        contador = contador + 1;
    end
end
% cambiar por el numero de sujeto y revisar si es T o E
csvwrite('MI-EEG-ID-A09E.csv', binarios); % guardar .csv
%csvwrite('Etiquetas-ID-A09E.csv', etiquetas); % guardar etiquetas en .csv
%save('MI-EEG-ID-A01E.mat','binarios'); % guardar .mat