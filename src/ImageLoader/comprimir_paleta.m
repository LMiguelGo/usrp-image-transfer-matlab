function imagen_indexada = comprimir_paleta(imagen)
% COMPRIMIR_PALETA Aplica compresión por paleta indexada de 256 colores
% Entrada:  imagen         -> imagen RGB uint8
% Salidas:  imagen_indexada -> imagen comprimida con índices
%           paleta          -> paleta de 256 colores [256x3]

    % Aplicar compresión por paleta
    [imagen_indexada, paleta] = rgb2ind(imagen, 256);

    % Definir ruta: sube un nivel desde src/matlab y entra a src/utils
    ruta_utils = fullfile(fileparts(mfilename('fullpath')), '..', 'utils', 'paleta_colores.mat');

    % Guardar paleta en la ruta específica
    save(ruta_utils, 'paleta');
end
