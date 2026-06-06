function secuencia_binaria_columna = deserializar_matriz(matriz_datos, tamano_bits)
    % DESERIALIZAR_MATRIZ Convierte la matriz de datos en un vector columna
    % y elimina los bits de relleno (ceros) usando el tamaño original de la imagen.
    %
    % Entradas:
    %   - matriz_datos: Matriz limpia sin cabeceras (debe tener dimensión 11190)
    %   - tamano_bits : Cantidad exacta de bits que pertenecen a la imagen original

    % Detectar orientación y estandarizar (filas = tramas, columnas = 11190)
    matriz_trabajo = matriz_datos';

    % Convertir la matriz en un único vector fila continuo.
    secuencia_fila = matriz_trabajo';
    secuencia_larga = secuencia_fila(:)';

    % Recortar exactamente hasta el tamaño original de la imagen
    if length(secuencia_larga) >= tamano_bits
        secuencia_recortada = secuencia_larga(1:tamano_bits);
    else
        % Si por pérdida de tramas el vector es más corto de lo esperado
        warning('La secuencia copiada es más corta que el tamaño de bits esperado debido a pérdidas.');
        secuencia_recortada = secuencia_larga; 
    end

    % Convertir el resultado en un vector columna
    secuencia_binaria_columna = secuencia_recortada(:);
end