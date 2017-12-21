bbdd = 'cebsdb1';
fileID = fopen(strcat(bbdd,'.bin'),'w');
frecuency = 5000;
for i=1:1
   file = strcat('m0',int2str(i),'m.mat');
    if(i<10)
        file = strcat('m00',int2str(i),'m.mat');
    end
%    record1 = sprintf('eg%d(:,2)',i);
   record2 = 'val(1,:)';
   fileaux = fopen(strcat(bbdd,'_aux_',int2str(i),'.bin'),'w');
   IPI = fileIPI4(file,record2,frecuency);
   ad=uint8(bi2de(IPI));
   fwrite(fileaux,ad);
   fclose(fileaux);
   fwrite(fileID,ad);
   disp(strcat('end ',int2str(i),'----------------------------------'));
end
fclose(fileID);