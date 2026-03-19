function secuencia_binaria = convertir_binario(secuencia_pixeles, filas, columnas)
% CONVERTIR_BINARIO Convierte la secuencia de píxeles indexados a bits
% Entrada:  secuencia_pixeles -> vector 1D de índices uint8
%           filas, columnas   -> dimensiones de la imagen
% Salida:   secuencia_binaria -> vector 1D de bits (0s y 1s)

    % Convertir cada índice a 8 bits 
    binario_pixeles = de2bi(secuencia_pixeles, 8, 'left-msb');

    % Serializar la matriz binaria en un vector
    secuencia_binaria = binario_pixeles';
    secuencia_binaria = secuencia_binaria(:);

    % Verificar tamaño
    num_bits = length(secuencia_binaria);
    if num_bits ~= (filas * columnas * 8)
        longitud_real = filas * columnas * 8;
        secuencia_binaria = secuencia_binaria(0:longitud_real);
    end

end
