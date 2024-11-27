function optimize()
    % Startwerte für die 10 Parameter
    x0 = rand(1, 10);  % Zufällige Startwerte (zwischen 0 und 1)
    fprintf('Startwerte der Parameter: %s\n', mat2str(x0));

    % Optimierung mit Nelder-Mead
    [x_opt, fval] = fminsearch(@objective_function, x0);

    % Ergebnisse ausgeben
    fprintf('Optimierung abgeschlossen.\n');
    fprintf('Optimierte Parameter: %s\n', mat2str(x_opt));
    fprintf('Minimaler Fehler: %.6f\n', fval);
end
