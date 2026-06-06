function matriz_filtrada = extraer_tramas(matriz_recibida, tamano_bits)
    % EXTRAER_TRAMAS Reensambla las tramas de la imagen usando el
    % tamaño esperado en bits, buscando tramas faltantes en toda la captura.
    %
    % Entradas:
    %   - matriz_recibida: Datos del receptor (con dimensión de 11200 bits)
    %   - tamano_bits    : Tamaño total de la imagen en bits (antes de adaptar)

    % Calcular la cantidad exacta de tramas esperadas (Entero superior)
    tramas_esperadas = ceil(tamano_bits / 11190);

    % Detectar orientación de la matriz y estandarizar (filas = tramas)
    [dim_a, ~] = size(matriz_recibida);
    if dim_a == 11200
        matriz_trabajo = matriz_recibida';
    else
        matriz_trabajo = matriz_recibida;
    end
    
    num_total_tramas = size(matriz_trabajo, 1);
    
    % Inicializar la matriz de salida
    % Se llena temporalmente con ceros. Conserva el ancho de 11200.
    matriz_ordenada = zeros(tramas_esperadas, 11200);
    tramas_encontradas = false(tramas_esperadas, 1); % Vector de control (booleano)

    % Escanear la matriz recibida
    for i = 1:num_total_tramas
        % Extraer cabecera de 10 bits y convertir a decimal
        cabecera_binaria = matriz_trabajo(i, 1:10);
        num_trama = bi2de(cabecera_binaria, 'left-msb');
        
        % Validar que la trama esté dentro del rango de la imagen (1 a N)
        if num_trama >= 1 && num_trama <= tramas_esperadas
            % Si aún no hemos guardado esta trama, la guardamos
            if ~tramas_encontradas(num_trama)
                matriz_ordenada(num_trama, :) = matriz_trabajo(i, :);
                tramas_encontradas(num_trama) = true;
            end
        end
        
        % Optimización: Si se encontraron todas las tramas, se puede salir
        if all(tramas_encontradas)
            fprintf('Se encontraron todas las %d tramas consecutivas\n\n', tramas_esperadas);
            break;
        end
    end

    % Reportar si hubo pérdidas insalvables en la captura
    if ~all(tramas_encontradas)
        tramas_faltantes = find(~tramas_encontradas);
        warning('No se pudieron recuperar todas las tramas en esta captura.');
        fprintf('Faltaron %d tramas. Índices faltantes: %s\n', ...
            length(tramas_faltantes), num2str(tramas_faltantes'));
        fprintf('Nota: Esas filas quedaron llenas de ceros en la matriz de salida.\n');
    end

    % Devolver la matriz en la misma orientación que entró
    if dim_a == 11200
        matriz_filtrada = matriz_ordenada';
    else
        matriz_filtrada = matriz_ordenada;
    end
end