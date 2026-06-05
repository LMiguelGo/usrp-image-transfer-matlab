function matriz_binaria = anadir_cabecera(matriz_img)
    % ANADIR_CABECERA Agrega un encabezado de 10 bits con el número de trama
    % a cada fila de la matriz de la imagen.
    
    % 1. Obtener el número de filas (tramas) actuales
    [num_filas, ~] = size(matriz_img);
    
    % 2. Crear un vector con los índices de las filas (de 0 a num_filas - 1)
    % Nota: Se resta 1 para que la primera trama sea la trama 0. 
    % Si prefieres que empiece en 1, usa: indices = (1:num_filas)';
    indices = (1:num_filas)';
    
    % 3. Convertir los índices a su representación binaria de 10 bits
    % 'de2bi' convierte decimal a binario. 'left-msb' asegura que el bit más 
    % significativo quede a la izquierda.
    cabeceras = de2bi(indices, 10, 'left-msb');
    
    % 4. Concatenar las cabeceras (10 bits) con la matriz original (11190 bits)
    matriz_binaria = [cabeceras, matriz_img];
end