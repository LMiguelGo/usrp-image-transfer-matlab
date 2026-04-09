rx = double(reshape(out.simout1.Data, [], 1));
tx = double(secuencia_binaria(1:6763104));

rango = 1600:2500;
ber_rango = zeros(length(rango), 1);
for i = 1:length(rango)
    d = int32(rango(i));
    ber_rango(i) = sum(rx(d+1:d+6763104) ~= tx) / 6763104;
end

[ber_min, idx] = min(ber_rango);
delay_optimo   = rango(idx);
fprintf('Delay óptimo: %d bits — BER: %.8f\n', delay_optimo, ber_min);

% Reconstruir

delay = delay_optimo;  % bits de delay detectados
rx_corregido = out.simout1.Data(delay+1 : delay+6763104);

raw = rx_corregido;
bits_mat     = reshape(raw, 8, [])';
secuencia_rx = uint8(bi2de(bits_mat, 'left-msb'));

img_idx = reshape(secuencia_rx, 1021, 828);   % column-major
indices = double(img_idx) + 1;
img_rgb = reshape(paleta(indices(:),:), 1021, 828, 3);

figure,
subplot(1,2,1), imshow(imagen),  title('Original')
subplot(1,2,2), imshow(img_rgb), title('Reconstruida')