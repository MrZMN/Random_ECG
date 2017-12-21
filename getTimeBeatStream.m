all = {'mitdb','mghdb','ptbdb','cebsdb','aami-ec13','apnea-ecg','cdb','cudb','edb','iafdb','nstdb','qtdb','shareedb','slpdb','stdb','svdb','szdb','twadb','vfdb'}
dataTable = table();
nfile = 0;
for i=all;
    path_bbdd = strcat('<path_to_bbdd>');
    path_binary = strcat('<path_to_binary>');
    path_upload = strcat('<path_to_upload>');
    mkdir(path_upload);
    fileList = getAllFiles(path_bbdd);
     for j=1:length(fileList);
         mat = strfind(fileList(j),'.mat');
         isMat = any(vertcat(mat{:}));
         data = '';
         if(isMat)
             nfile=nfile+1;
             head = fileList(j-1);
             data = fileList(j);   
            f = getfrecuency(head);
            secuence = getsecuence(head);
            segundos = (1/f)*secuence;
              headtxt = getHead(head)
              cells = strsplit(char(data),'/');
             [mcells,ncells] = size(cells)   
             last = cells(ncells);
             cellname = strsplit(char(last),'.mat');
             name = char(cellname(1));
%               structPatients(nfile,1).bbdd = char(i);
%               structPatients(nfile,1).file = name;
%               structPatients(nfile,1).frecuency = f;
%               structPatients(nfile,1).secuence = secuence;
%               structPatients(nfile,1).segundos = segundos;


              namefile =strcat(char(path_binary),i,'_aux_',name,'_binario_1line.txt');
              fileIDTxt3Aux = fopen(char(namefile));
              A = fscanf(fileIDTxt3Aux,'%s');
              fclose(fileIDTxt3Aux);
              
              namefile2 =strcat(char(path_binary),i,'_aux_',name,'.bin');
              
              copyfile(char(namefile),char(path_upload));
              copyfile(char(namefile2),char(path_upload));
              
              namefile =strcat(char(path_upload),i,'_aux_',name,'_binario_1line.txt');
              namefile2 =strcat(char(path_upload),i,'_aux_',name,'.bin');
              destinofile1 =strcat(char(path_upload),i,'_',name,'.txt');
              destinofile2 =strcat(char(path_upload),i,'_',name,'.bin');
              movefile(char(namefile),char(destinofile1));
              movefile(char(namefile2),char(destinofile2));
              
              headfile =strcat(char(path_upload),i,'_',name,'.hea');
              filehead = fopen(char(headfile),'w');
              fprintf(filehead,'%s %s \n','bbdd:',char(i));
              fprintf(filehead,'%s %s \n','file:',name);
              fprintf(filehead,'%s %d \n','secuence:',secuence);
              fprintf(filehead,'%s %d \n','frencuency:',f);
              fprintf(filehead,'%s %d \n','beatstream:',length(A));
              fclose(filehead);
              
%               structPatients(nfile,1).beatstream = length(A);
         end
     end  
end
% dataTable = [dataTable;struct2table(structPatients)];
% writetable(dataTable,'bitstram.csv')