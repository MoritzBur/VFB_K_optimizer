function fem_model_dummy()
    fprintf('FEM-Dummy-Modell gestartet.\n');

    % Parameter aus params.in einlesen
    params = read_params('params.in');
    fprintf('Eingelesene Parameter: %s\n', mat2str(params)); % Neue Ausgabe

    % Beispiel-Fehlerberechnung (Dummy-Modell)
    true_params = 0.5 * ones(1, 10); % "Wahre" Parameter (zum Testen)
    error = sum((params - true_params).^2);

    % Fehler in results.out speichern
    save_results(error, 'results.out');
    fprintf('Berechneter Fehler: %.6f\n', error); % Neue Ausgabe
end

function params = read_params(filename)
    % Parameter aus Datei lesen
    fid = fopen(filename, 'r');
    if fid == -1
        error('Datei %s konnte nicht geöffnet werden.', filename);
    end

    % Datei parsen und Parameter speichern
    params = [];
    while ~feof(fid)
        line = fgetl(fid);
        value = sscanf(line, 'p%d = %f;');
        params(end+1) = value(2); %#ok<AGROW> % Zweiter Wert ist der Parameter
    end
    fclose(fid);
end

function save_results(error, filename)
    % Fehler in Datei speichern
    fid = fopen(filename, 'w');
    if fid == -1
        error('Datei %s konnte nicht geöffnet werden.', filename);
    end
    fprintf(fid, '%.6f\n', error);
    fclose(fid);
    fprintf('Ergebnisse in %s gespeichert.\n', filename); % Neue Ausgabe
end
