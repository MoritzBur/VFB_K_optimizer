function error = objective_function(params)
    % Parameter in params.in schreiben
    write_params(params, 'params.in');
    fprintf('Aktuelle Parameter: %s\n', mat2str(params)); % Neue Ausgabe

    % FEM-Dummy-Modell direkt in MATLAB ausführen
    fprintf('Starte FEM-Modell...\n');
    fem_model_dummy(); % Direktaufruf des Dummy-Modells

    % Ergebnisse lesen (Fehler in results.out)
    results = read_results('results.out');
    error = results.error;

    % Fehler anzeigen
    fprintf('Fehlerwert für aktuelle Parameter: %.6f\n', error); % Neue Ausgabe
end
