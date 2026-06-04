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

% ── Función 5 Convertir a matriz de 11200 columnas x n filas ──────────────────────
matriz_binaria = adaptar_tamano(secuencia_binaria, 11200);

% ── Limpiar variables innecesarias del workspace ──────────────────────
clearvars imagen filas columnas canales secuencia_pixeles imagen_indexada paleta secuencia_binaria;
