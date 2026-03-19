function [imagen_indexada, paleta] = comprimir_paleta(imagen)
% COMPRIMIR_PALETA Aplica compresión por paleta indexada de 256 colores
% Entrada:  imagen         -> imagen RGB uint8
% Salidas:  imagen_indexada -> imagen comprimida con índices
%           paleta          -> paleta de 256 colores [256x3]

    % Aplicar compresión por paleta
    [imagen_indexada, paleta] = rgb2ind(imagen, 256);

    % Guardar paleta para uso en receptor
    save('paleta_colores.mat', 'paleta');

end
