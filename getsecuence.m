function [f]=getsecuence(file)
  f=0;
  fid = fopen(char(file));
  tline = fgets(fid);
  i=0;
  while ischar(tline)
       if (i == 0)
            words = strsplit(tline)
            disp(words)
            f = str2num(char(words(1,4)))
       end
       tline = fgets(fid);
       i=i+1;
  end
  fclose(fid);
end