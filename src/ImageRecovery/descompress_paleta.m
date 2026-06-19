function imagen_rgb = descompress_paleta(imagen_indexada)
% DESCOMPRESS_PALETA Reconstruye la imagen RGB a partir de la indexada y la paleta
% Entrada:  imagen_indexada -> matriz de la imagen con índices (reconstruida)
% Salida:   imagen_rgb      -> imagen original recuperada en formato RGB uint8

    % Definir la ruta del archivo de la paleta (misma lógica de carpetas del Tx)
    ruta_utils = fullfile(fileparts(mfilename('fullpath')), '..', 'utils', 'paleta_colores.mat');
    
    % Verificar si el archivo existe antes de cargarlo
    if exist(ruta_utils, 'file')
        data = load(ruta_utils, 'paleta');
        paleta = data.paleta;
    else
        error('No se encontró el archivo paleta_colores.mat en la ruta: %s', ruta_utils);
    end

    % Convertir la imagen indexada a RGB usando la paleta
    % ind2rgb devuelve por defecto una matriz de tipo 'double' (valores entre 0 y 1)
    imagen_double = ind2rgb(imagen_indexada, paleta);

    % Convertir de vuelta a uint8 (valores de 0 a 255) para que sea una imagen estándar
    imagen_rgb = im2uint8(imagen_double);
    
    fprintf('Imagen RGB reconstruida\n\n');
end