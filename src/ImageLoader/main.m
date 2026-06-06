% MAIN - Archivo principal para cargar imagen y convertirla a bits
clc
disp(['Running main code - Image Loader', newline])

% ── Función 1 Cargar imagen ──────────────────────────────
[imagen_tx, filas, columnas] = cargar_imagen('italy.jpg');

% ── Función 2 Compresión por paleta ─────────────────────
imagen_indexada = comprimir_paleta(imagen_tx);

% ── Función 3 Serialización de píxeles ──────────────────
secuencia_pixeles = serializar_pixeles(imagen_indexada);

% ── Función 4 Conversión a binario ──────────────────────
secuencia_binaria = convertir_binario(secuencia_pixeles);
tamano_imagen = length(secuencia_binaria);

% ── Función 5 Convertir a matriz de 11190 columnas x n filas ──────────────────────
matriz_img = adaptar_tamano(secuencia_binaria, 11190);

% ── Función 6 Agregar encabezados con el número de la fila ──────────────────────
matriz_binaria = anadir_cabecera(matriz_img);

% ── Limpiar variables innecesarias del workspace ──────────────────────
clearvars canales secuencia_binaria matriz_img imagen_indexada secuencia_pixeles;
