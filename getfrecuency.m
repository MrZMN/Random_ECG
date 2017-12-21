function [f]=getfrecuency(file)
  f=0;
  fid = fopen(char(file));
  tline = fgets(fid);
  i=0;
  while ischar(tline)
       if (i == 0)
            words = strsplit(tline,' ')
            f = str2num(char(words(1,3)))
            fout = strsplit(char(words(1,3)),'/')
            if(length(fout)>1)
                f = str2num(char(fout(1,1)))
            end
       end
       tline = fgets(fid);
       i=i+1;
  end
  fclose(fid);
end
