function matriz_salida = adaptar_tamano(vector_bits, columnas)
    % INPUTS:
    %   vector_bits : Vector columna original (N x 1)
    %   columnas    : Número de columnas deseadas (en tu caso, 11200)
    %
    % OUTPUT:
    %   matriz_salida : Matriz final ordenada por filas con el relleno de ceros
    
    % 1. Asegurar que la entrada sea un vector columna estricto
    vector_bits = vector_bits(:);
    
    % 2. Calcular cuántos bits faltan para completar la última fila
    num_bits = length(vector_bits);
    residuo = mod(num_bits, columnas);
    
    if residuo ~= 0
        bits_faltantes = columnas - residuo;
        % Rellenamos con ceros al final del vector
        vector_bits = [vector_bits; zeros(bits_faltantes, 1)];
    end
    
    % 3. Calcular el número total de filas que tendrá la matriz final
    num_filas = length(vector_bits) / columnas;
    
    % 4. Reorganizar los bits
    % Explicación del truco: reshape en MATLAB llena por columnas.
    % Al decirle que cree una matriz de (columnas x filas), llenará cada columna 
    % con los primeros 11200 bits. Luego, al transponer (') esa matriz,
    % esas columnas se convierten en las filas que tú necesitas.
    matriz_salida_temp = reshape(vector_bits, columnas, num_filas)';
    
    % Adaptar a tipo double para procesamiento en simulink
    matriz_salida = double(matriz_salida_temp);
    
end