%generated: 20.10.2022
%autor:     Martin Löser
%m-version: R2021a

function FHWS_BACKUP_MLX(name)
    %generating a readable backup of the main.mlx file!
    %ml_file = matlab.desktop.editor.getActive;
    ml_file = matlab.desktop.editor.findOpenDocument(name);
    ml_content = ml_file.Text;
    ml_export = fopen("Matlab_files\fhws_backup_main.m","w");
    fprintf(ml_export,'%s',ml_content);
    fclose(ml_export);
end