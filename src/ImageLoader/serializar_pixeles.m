function secuencia_pixeles = serializar_pixeles(imagen_indexada, filas, columnas)
% SERIALIZAR_PIXELES Convierte la matriz indexada en secuencia unidimensional
% Entrada:  imagen_indexada  -> matriz 2D de índices de píxeles
%           filas, columnas  -> dimensiones esperadas
% Salida:   secuencia_pixeles -> vector 1D de índices

    % Serializar la matriz en un vector
    secuencia_pixeles = imagen_indexada(:);

    % Verificar longitud esperada
    if length(secuencia_pixeles) ~= (filas * columnas)
        longitud_real = filas * columnas;
        secuencia_pixeles = secuencia_pixeles(0:longitud_real);
    end

end
