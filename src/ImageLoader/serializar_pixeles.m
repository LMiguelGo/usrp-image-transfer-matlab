function secuencia_pixeles = serializar_pixeles(imagen_indexada)
% SERIALIZAR_PIXELES Convierte la matriz indexada en secuencia unidimensional
% Entrada:  imagen_indexada  -> matriz 2D de índices de píxeles
%           filas, columnas  -> dimensiones esperadas
% Salida:   secuencia_pixeles -> vector 1D de índices

    % Serializar la matriz en un vector
    secuencia_pixeles = imagen_indexada(:);
end
