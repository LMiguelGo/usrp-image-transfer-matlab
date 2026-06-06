function secuencia_pixeles = convertir_decimal(secuencia_binaria)
    % CONVERTIR_DECIMAL Convierte la secuencia de bits de vuelta a píxeles indexados
    % Entrada:  secuencia_binaria -> vector 1D de bits (0s y 1s)
    %           filas, columnas   -> dimensiones originales de la imagen
    % Salida:   secuencia_pixeles -> vector 1D de índices uint8

    % Agrupar el vector en una matriz donde cada fila tiene 8 bits (1 byte)
    % Usamos 'reshape' para reconstruir la estructura de de2bi.
    % Como en el Tx se hizo binario_pixeles', aquí debemos agrupar de la misma forma.
    matriz_binaria = reshape(secuencia_binaria, 8, [])';

    % Convertir de binario a decimal
    % 'bi2de' con 'left-msb' realiza el proceso inverso exacto de 'de2bi'
    secuencia_pixeles_dec = bi2de(matriz_binaria, 'left-msb');

    % Asegurar el tipo de dato nativo para imágenes indexadas (uint8)
    secuencia_pixeles = uint8(secuencia_pixeles_dec);
end