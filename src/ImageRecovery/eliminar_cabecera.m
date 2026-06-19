function matriz_datos = eliminar_cabecera(matriz_con_cabecera)
    % ELIMINAR_CABECERA Elimina los 10 bits de encabezado de cada trama
    % y devuelve la matriz original con 11190 columnas de datos.
    %
    % Entrada: matriz_con_cabecera (Matriz que incluye los 10 bits de cabecera)
    
    % Trabajar con la transpuesta
    matriz_trabajo = matriz_con_cabecera';

    % Recortar las primeras 10 columnas (cabeceras) 
    % Tomamos desde la columna 11 hasta la 11200.
    matriz_datos_ordenada = matriz_trabajo(:, 11:11200);

    % Devolver la matriz en la misma orientación original
    matriz_datos = matriz_datos_ordenada';
    
end