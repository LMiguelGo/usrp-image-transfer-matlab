function [datos_tx, StopTime] = crearTimeseries(secuencia_binaria)
    % crearTimeseries - Convierte una secuencia binaria en un objeto timeseries
    % listo para usar en Simulink.
    %
    % Sintaxis:
    %   [datos_tx, StopTime] = crearTimeseries(secuencia_binaria)
    %
    % Entradas:
    %   secuencia_binaria - Vector de datos binarios (fila o columna)
    %
    % Salidas:
    %   datos_tx - Objeto timeseries de MATLAB
    %   StopTime - Tiempo final de la señal (para usar en Simulink)

    Ts = 1e-6;  % Tiempo de muestreo fijo
    t = (0:length(secuencia_binaria)-1)' * Ts;  % Vector de tiempo
    datos_tx = timeseries(secuencia_binaria(:), t);  % Crear timeseries

    StopTime = t(end);  % Tiempo final, listo para Simulink
end