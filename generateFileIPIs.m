function [] = generateFileIPIs( bbdd )
 dataTable = table();
 path_bbdd = strcat('<path_to_bbdd>');
 path_binary = strcat('<path_to_binary>');
 mkdir(path_binary);
 fileList = getAllFiles(path_bbdd);
%   fileID = fopen(strcat(path_binary,bbdd,'.bin'),'w');
%   fileIDTxt = fopen(strcat(path_binary,bbdd,'_binario.txt'),'w');
%   fileIDTxt3 = fopen(strcat(path_binary,bbdd,'_binario_1line.txt'),'w');
%   fileIDTxt2 = fopen(strcat(path_binary,bbdd,'.txt'),'w');
 nfile = 1;
 for i=1:length(fileList)
     mat = strfind(fileList(i),'.mat');
     isMat = any(vertcat(mat{:}));
     data = '';
     if(isMat)
         head = fileList(i-1);
         data = fileList(i);   
         disp(data);
         f = getfrecuency(head);
         headtxt = getHead(head)
         cells = strsplit(char(data),'/');
        [mcells,ncells] = size(cells)   
        last = cells(ncells);
        cellname = strsplit(char(last),'.mat');
        name = char(cellname(1));
         nipis = generatebinary(bbdd,name,data,i,path_binary,f);
         structPatients(nfile,1).bbdd = bbdd;
         structPatients(nfile,1).file = name;
         structPatients(nfile,1).frecuency = f;
         structPatients(nfile,1).IPIS = nipis;
         structPatients(nfile,1).head = '';
%           headtxt;
         nfile = nfile +1;
     end
   
 end
 dataTable = [dataTable;struct2table(structPatients)];
 filename = strcat(path_binary,'_',bbdd,'.csv');
 writetable(dataTable,filename)
%  fclose(fileID);
%   fclose(fileIDTxt);
%   fclose(fileIDTxt2);
%   fclose(fileIDTxt3);


end

