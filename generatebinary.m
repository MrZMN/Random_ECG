function [nipis] = generatebinary(bbdd,name,file,i,pathout,frecuency)
     record2 = 'val(1,:)';
     
     fileaux = fopen(strcat(char(pathout),bbdd,'_aux_',name,'.bin'),'w');
     fileIDTxtAux = fopen(strcat(char(pathout),bbdd,'_aux_',name,'_binario.txt'),'w');
     fileIDTxt3Aux = fopen(strcat(char(pathout),bbdd,'_aux_',name,'_binario_1line.txt'),'w');
     fileIDTxt2Aux = fopen(strcat(char(pathout),bbdd,'_aux_',name,'.txt'),'w');
    try
     IPI = fileIPI4(char(file),record2,frecuency);
%     ad=uint8(bi2de(IPI));
     ad=uint8(bi2de(fliplr(IPI)));
     nipis = size(IPI,1)
       fwrite(fileaux,ad);
       fclose(fileaux);
       
     for ii = 1:size(IPI,1)
        fprintf(fileIDTxt2Aux,'%g',ad(ii,:));
        fprintf(fileIDTxt2Aux,'\n');
        
      
        fprintf(fileIDTxtAux,'%g',IPI(ii,:));
        fprintf(fileIDTxtAux,'\n');
 
        fprintf(fileIDTxt3Aux,'%g',IPI(ii,:));
     end
     fclose(fileIDTxtAux);
     fclose(fileIDTxt3Aux);
     fclose(fileIDTxt2Aux);
       
     disp(strcat('end ',name,'----------------------------------'));
%     fclose(fileID);
    catch
%         fclose(fileaux);
%         fclose(fileIDTxtAux);
%          fclose(fileIDTxt3Aux);
%          fclose(fileIDTxt2Aux);
%        fclose(fileID);
        nipis = 0;
        disp('ERROR');
        disp(file);
        disp(strcat(char(pathout),bbdd,'_aux_',name,'.bin'));
        disp('---------------------------------------------------------');
    end
end

