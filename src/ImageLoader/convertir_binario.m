function secuencia_binaria = convertir_binario(secuencia_pixeles)
% CONVERTIR_BINARIO Convierte la secuencia de píxeles indexados a bits
% Entrada:  secuencia_pixeles -> vector 1D de índices uint8
%           filas, columnas   -> dimensiones de la imagen
% Salida:   secuencia_binaria -> vector 1D de bits (0s y 1s)

    % Convertir cada índice a 8 bits 
    binario_pixeles = de2bi(secuencia_pixeles, 8, 'left-msb');

    % Serializar la matriz binaria en un vector
    secuencia_binaria = binario_pixeles';
    secuencia_binaria = secuencia_binaria(:);
end
