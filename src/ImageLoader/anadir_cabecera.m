function matriz_binaria = anadir_cabecera(matriz_img)
    % ANADIR_CABECERA Agrega un encabezado de 10 bits con el número de trama
    % a cada fila de la matriz de la imagen.
    
    % Obtener el número de filas (tramas) actuales
    [~, num_columnas] = size(matriz_img);
    
    % Crear un vector con los índices de las filas (de 1 a num_filas)
    indices = (1:num_columnas)';
    
    % Convertir los índices a su representación binaria de 10 bits
    % 'de2bi' convierte decimal a binario. 'left-msb' asegura que el bit más 
    % significativo quede a la izquierda.
    cabeceras = de2bi(indices, 10, 'left-msb')';
    size(cabeceras)
    
    % Concatenar las cabeceras (10 bits) con la matriz original (11190 bits)
    matriz_binaria = [cabeceras; matriz_img];
end