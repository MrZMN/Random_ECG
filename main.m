% bbdds = ['aami-ec13';'cdb';'drivedb';'mghdb';'ptbdb';'slpdb';'szdb';'afpdb';'cebsdb';'edb';'mitdb';'qtdb';'stdb';'twadb';'apnea-ecg';'cudb';'iafdb';'nstdb';'shareedb';'svdb';'vfdb'];
%  path_bbdd = '<path_to_bbdd>';
%  path_binary = '<path_to_binary>';
%  bbdd = 'ptbdb';
%  fileList = getAllFiles(path_bbdd);
%  fileID = fopen(strcat(path_binary,bbdd,'.bin'),'w');
%  fileIDTxt = fopen(strcat(path_binary,bbdd,'_binario.txt'),'w');
%  fileIDTxt3 = fopen(strcat(path_binary,bbdd,'_binario_1line.txt'),'w');
%  fileIDTxt2 = fopen(strcat(path_binary,bbdd,'.txt'),'w');
%  for i=1:length(fileList)
%      mat = strfind(fileList(i),'.mat');
%      isMat = any(vertcat(mat{:}));
%      data = '';
%      if(isMat)
%          head = fileList(i-1);
%          data = fileList(i);   
%          disp(data);
%          f = getfrecuency(head);
%          generatebinary(fileID,fileIDTxt,fileIDTxt2,fileIDTxt3,bbdd,data,i,path_binary,f);
%      end
%    
%  end
%  fclose(fileID);
%  fclose(fileIDTxt);
%  fclose(fileIDTxt2);
%  fclose(fileIDTxt3);


all = {'mitdb','mghdb','ptbdb','cebsdb','aami-ec13','apnea-ecg','cdb','cudb','edb','iafdb','nstdb','qtdb','shareedb','slpdb','stdb','svdb','szdb','twadb','vfdb'}
for i={'mghdb'};
    generateFileIPIs(char(i));
end
% 
