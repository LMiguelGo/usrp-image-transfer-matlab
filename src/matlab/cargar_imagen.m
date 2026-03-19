function [imagen, filas, columnas, canales] = cargar_imagen(nombre_archivo)
% CARGAR_IMAGEN Carga una imagen y verifica/redimensiona al mínimo 740x492
% Entrada:  nombre_archivo -> nombre del archivo 
% Salidas:  imagen, filas, columnas, canales

    % 1. Cargar la imagen
    imagen = imread(nombre_archivo);

    % 2. Verificar y redimensionar si es necesario
    [filas, columnas, canales] = size(imagen);

    if columnas < 740 || filas < 492
        imagen = imresize(imagen, [492, 740]);
        [filas, columnas, canales] = size(imagen);
    end

end