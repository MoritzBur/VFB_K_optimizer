function error = objective_function(normed_params)
    % Physikalische Grenzen definieren (Für Numerik des
    % Optimierungsalgorithmus; Auf grob erwarteten Wertebereich stellen)
    lower_bound = 1e11;
    upper_bound = 1e13;

    % Physikalische Grenzen für Test der Numerik
    % lower_bound = 0;
    % upper_bound = 1;


    % Normierte Parameter in physikalische Werte skalieren
    [scaled_params, ~] = scale_params(normed_params, lower_bound, upper_bound);

    % Physikalische Parameter in params.in schreiben
    write_params(scaled_params, 'params.in');
    fprintf('Normierte Parameter: %s\n', mat2str(normed_params));
    fprintf('Skalierte Parameter: %s\n', mat2str(scaled_params));

    % FEM-Modell ausführen
    fprintf('Starte FEM-Modell...\n');
    fem_model_dummy(); % Dummy-Modell aufrufen; Bitte ersetzen durch den echten Code, 
                       %  der params.in einlesen kann und results.out so
                       %  wie im Beispiel ausgibt

    % Ergebnisse lesen (Fehler in results.out)
    results = read_results('results.out');
    error = results.error;

    % Fehler anzeigen
    fprintf('Fehlerwert für aktuelle Parameter: %.6f\n', error);
end
