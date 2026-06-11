% Archivo main para recuperar la imagen a partir de los bits recibidos
% IMPORTANTE: Es necesario ejecutar primero el archivo main.m de ImageLoader
clc
disp(['Running main code - Image Recovery', newline])

% Se espera que la variable "dout" se cargue en el workspace después de
% finalizar la transmisión
datos = squeeze(dout.Data);

% ── Función 1 Extraer las tramas que componen la imagen ──────────────────
tramas_recuperadas = extraer_tramas(datos, tamano_imagen);

% ── Función 2 Cálculo de la BER ──────────────────
ber = calcular_ber(tramas_recuperadas, matriz_binaria);

% ── Función 3 Eliminar las cabeceras de 10 bits ──────────────────────────────
matriz_imagen = eliminar_cabecera(tramas_recuperadas);

% ── Función 4 Deserializar la matriz de bits recibidos ──────────────────────────────
secuencia_binaria = deserializar_matriz(matriz_imagen, tamano_imagen);

% ── Función 5 Convertir a decimal los bits recibidos ──────────────────────────────
valores_decimales = convertir_decimal(secuencia_binaria);

% ── Función 6 Crear la matriz imagen indexada ──────────────────────────────
imagen_indexada = deserializar_pixeles(valores_decimales, filas, columnas);

% ── Función 7 Crear la imagen recibida a partir de la paleta ──────────────────────────────
imagen_rx = descompress_paleta(imagen_indexada);

% ── Función 8 Mostrar imágenes para comparar ──────────────────────────────
comparar_imagenes(imagen_tx, imagen_rx)

% ── Limpiar variables innecesarias del workspace ──────────────────────
clearvars tramas_recuperadas matriz_imagen secuencia_binaria valores_decimales imagen_indexada;