function results = read_results(filename)
    % Annahme: Die Datei results.out enthält den Fehler als einzelne Zahl
    fid = fopen(filename, 'r');
    if fid == -1
        error('Datei %s konnte nicht geöffnet werden.', filename);
    end

    % Fehlerwert auslesen
    results.error = fscanf(fid, '%f');
    fclose(fid);
end
