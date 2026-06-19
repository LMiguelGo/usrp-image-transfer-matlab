function ber = calcular_ber(matriz_recibida, matriz_original)
    % CALCULAR_BER Compara dos matrices binarias bit a bit.
    % Impone la impresión de estadísticas y retorna la BER en escala 0 a 1.

    % Asegurar que ambas matrices estén en formato de vector columna para comparar
    bits_recibidos = matriz_recibida(:);
    bits_originales = matriz_original(:);
    
    % Contar la cantidad de bits errados usando una operación XOR
    bits_errados = sum(bits_recibidos ~= bits_originales);
    total_bits = length(bits_originales);
    
    % Calcular el porcentaje y la BER
    ber = bits_errados / total_bits;
    
    % Imprimir resultados en consola
    fprintf('─── Estadísticas de Error de Bit (BER) ───\n');
    fprintf('Total de bits evaluados: %d\n', total_bits);
    fprintf('Cantidad de bits errados: %d\n', bits_errados);
    fprintf('BER:        %.6f\n\n', ber);
end