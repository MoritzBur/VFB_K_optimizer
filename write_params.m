function write_params(params, filename)
    fid = fopen(filename, 'w');
    for i = 1:length(params)
        fprintf(fid, 'p%d = %.6f;\n', i, params(i));
    end
    fclose(fid);
end
