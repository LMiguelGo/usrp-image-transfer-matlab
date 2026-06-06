function comparar_imagenes(imagen_tx, imagen_rx)
    % COMPARAR_IMAGENES Muestra la imagen transmitida y la recibida 
    % una al lado de la otra para evaluar la calidad visual.
    %
    % Entradas: imagen_tx, imagen_rx -> Matrices MxNx3 de tipo uint8

    % Crear una nueva figura para la visualización
    figure('Name', 'Comparación de Imágenes: Transmitida vs Recibida', 'NumberTitle', 'off');

    % Subplot 1: Imagen Transmitida (Izquierda)
    subplot(1, 2, 1);
    imshow(imagen_tx);
    title('Imagen Transmitida (Tx)');

    % Subplot 2: Imagen Recibida (Rx)
    subplot(1, 2, 2);
    imshow(imagen_rx);
    title('Imagen Recibida (Rx)');
end