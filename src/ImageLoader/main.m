% MAIN - Archivo principal del transmisor
clc
disp(['Running main code', newline])

% ── Función 1 Cargar imagen ──────────────────────────────
[imagen, filas, columnas, canales] = cargar_imagen('italy.jpg');

% ── Función 2 Compresión por paleta ─────────────────────
[imagen_indexada, paleta] = comprimir_paleta(imagen);

% ── Función 3 Serialización de píxeles ──────────────────
secuencia_pixeles = serializar_pixeles(imagen_indexada, filas, columnas);

% ── Función 4 Conversión a binario ──────────────────────
secuencia_binaria = convertir_binario(secuencia_pixeles, filas, columnas);

% ── Función 5 Convertir a matriz de 11190 columnas x n filas ──────────────────────
matriz_img = adaptar_tamano(secuencia_binaria, 11190);

% ── Función 6 Agregar encabezados con el número de la fila ──────────────────────
matriz_binaria = anadir_cabecera(matriz_img);

% ── Limpiar variables innecesarias del workspace ──────────────────────
clearvars imagen filas columnas canales secuencia_pixeles imagen_indexada paleta secuencia_binaria matriz_img;
