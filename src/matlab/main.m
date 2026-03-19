% MAIN - Archivo principal del transmisor

% ── Función 1 Cargar imagen ──────────────────────────────
[imagen, filas, columnas, canales] = cargar_imagen('italy.jpg');

% ── Función 2 Compresión por paleta ─────────────────────
[imagen_indexada, paleta] = comprimir_paleta(imagen);

% ── Función 3 Serialización de píxeles ──────────────────
secuencia_pixeles = serializar_pixeles(imagen_indexada, filas, columnas);

% ── Función 4 Conversión a binario ──────────────────────
secuencia_binaria = convertir_binario(secuencia_pixeles, filas, columnas);

% ── Función 5 Creación timeseries ──────────────────────
[datos_tx, t] = crearTimeseries(secuencia_binaria);