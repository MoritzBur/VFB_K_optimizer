function optimize()
    % ------------------------------
    % Konfigurationsbereich
    % ------------------------------
    
    % 1. Optimierungsalgorithmus auswählen
    % Wähle 'nelder-mead', 'finite-difference', 'particle-swarm', oder 'differential-evolution'
     algorithm = 'finite-difference';
    % algorithm = 'nelder-mead';
    
    % 2. Konvergenzkriterien einstellen
    % Wähle 'grob', 'mittel', oder 'fein'
    precision = 'mittel';

    % ------------------------------
    % Parameter definieren
    % ------------------------------
    
    % Startwerte für die 10 Parameter
    % x0 = rand(1, 10);  % Zufällige Startwerte zwischen 0 und 1
    
    % Startwerte für EI
    x0 = [0.2, 0.2, 0.2, 0.2, 0.6, 0.2, 0.2, 0.2, 0.2, 0.2,];

    % Startwerte für GI_t
    % x0 = [0.2, 0.2, 0.2, 0.2, 0.6, 0.2, 0.2, 0.2, 0.2, 0.2,];

    % Konvergenzkriterien setzen
    options = optimset(); % Standardoptionen initialisieren
    switch precision
        case 'grob'
            options.TolFun = 1e-2; % Toleranz für Zielfunktion
            options.TolX = 1e-2;   % Toleranz für Parameter
            maxIter = 50;          % Maximale Iterationen
        case 'mittel'
            options.TolFun = 1e-4;
            options.TolX = 1e-4;
            maxIter = 200;
        case 'fein'
            options.TolFun = 1e-6;
            options.TolX = 1e-6;
            maxIter = 500;
        otherwise
            error('Unbekannte Präzisionsstufe: %s', precision);
    end
    options.MaxIter = maxIter;

    % ------------------------------
    % Optimierungsalgorithmus auswählen
    % ------------------------------
    fprintf('Starte Optimierung mit Algorithmus: %s\n', algorithm);
    fprintf('Präzisionsstufe: %s\n', precision);
    
    switch algorithm
        case 'nelder-mead'
            % Nelder-Mead-Algorithmus
            [x_opt, fval] = fminsearch(@objective_function, x0, options);
            
        case 'finite-difference'
            % Gradient-basierter Optimierungsalgorithmus (fminunc mit finite Differenzen)
            if exist('fminunc', 'file') ~= 2
                error('fminunc benötigt die Optimization Toolbox.');
            end
            options = optimoptions('fminunc', ...
                'Algorithm', 'quasi-newton', ... % Standardverfahren
                'FiniteDifferenceType', 'central', ... % Zentrale Differenzen (genauer)
                'MaxIterations', maxIter, ...
                'OptimalityTolerance', options.TolFun, ...
                'StepTolerance', options.TolX);
            [x_opt, fval] = fminunc(@objective_function, x0, options);
            
        case 'particle-swarm'
            % Particle Swarm Optimization (PSO)
            if exist('particleswarm', 'file') ~= 2
                error('PSO benötigt die Global Optimization Toolbox.');
            end
            lb = zeros(1, 10); % Untergrenzen
            ub = ones(1, 10);  % Obergrenzen
            [x_opt, fval] = particleswarm(@objective_function, 10, lb, ub, options);
            
        case 'differential-evolution'
            % Differential Evolution (DE)
            if exist('ga', 'file') ~= 2
                error('Differential Evolution benötigt die Global Optimization Toolbox.');
            end
            lb = zeros(1, 10); % Untergrenzen
            ub = ones(1, 10);  % Obergrenzen
            [x_opt, fval] = ga(@objective_function, 10, [], [], [], [], lb, ub, [], options);
            
        otherwise
            error('Unbekannter Algorithmus: %s', algorithm);
    end

    % ------------------------------
    % Ergebnisse anzeigen
    % ------------------------------
    fprintf('Optimierung abgeschlossen.\n');
    fprintf('Optimierte Parameter: %s\n', mat2str(x_opt));
    fprintf('Minimaler Fehler: %.6f\n', fval);
end
