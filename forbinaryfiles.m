path_binary = '<input_binary_files>';
pathout = '<output_binary_files>';

fileAll = fopen(strcat(pathout,'_all','.bin'),'a','native');
fileList = getAllFiles(path_binary);
cont = 0;
for i=1:length(fileList)
    disp(fileList(i));
    fileID = fopen(char(fileList(i)),'r');
    data = fread(fileID);
    cont= cont + length(data);
    fwrite(fileAll,data);
%     fprintf(fid,'%d',data);
    fclose(fileID);
end
fclose(fileAll);
disp(cont)