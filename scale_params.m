function [scaled_params, normed_params] = scale_params(normed_params, lower_bound, upper_bound)
    % Skaliert normierte Parameter [0, 1] in physikalische Werte
    % und gibt beide zurück (normierte und skalierte)
    % normed_params: Parameter im Bereich [0, 1]
    % lower_bound: Untere Grenze der physikalischen Werte
    % upper_bound: Obere Grenze der physikalischen Werte
    
    % Skalierungslogik
    scaled_params = lower_bound + normed_params .* (upper_bound - lower_bound);
end
