rx = double(reshape(out.simout, [], 1));
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

