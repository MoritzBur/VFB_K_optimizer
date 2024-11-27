function p_norm = normalize_params(p_real, p_min, p_max)
    % Normalisiert die Parameter in den Bereich [0, 1]
    % p_real: Reale Parameterwerte
    % p_min: Minimalwerte des Wertebereichs
    % p_max: Maximalwerte des Wertebereichs
    % p_norm: Normalisierte Parameterwerte im Bereich [0, 1]
    p_norm = (p_real - p_min) ./ (p_max - p_min);
end

function p_real = denormalize_params(p_norm, p_min, p_max)
    % Denormalisiert die Parameter aus dem Bereich [0, 1] in den tatsächlichen Wertebereich
    % p_norm: Normalisierte Parameterwerte im Bereich [0, 1]
    % p_min: Minimalwerte des Wertebereichs
    % p_max: Maximalwerte des Wertebereichs
    % p_real: Denormalisierte Parameterwerte im tatsächlichen Wertebereich
    p_real = p_norm .* (p_max - p_min) + p_min;
end
