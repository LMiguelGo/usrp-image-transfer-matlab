function imagen_indexada = deserializar_pixeles(secuencia_pixeles, filas, columnas)
% DESERIALIZAR_PIXELES Convierte el vector 1D de vuelta a la matriz 2D
% Entradas: secuencia_pixeles -> vector 1D de índices
%           filas, columnas   -> dimensiones originales de la imagen
% Salida:   imagen_indexada   -> matriz 2D de la imagen

    % Reconstruir la matriz 2D (lee el vector columna por columna)
    imagen_indexada = reshape(secuencia_pixeles, filas, columnas);
end