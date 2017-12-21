function [ strline ] = getHead( file )
  fid = fopen(char(file));
  tline = fgets(fid);
  strline = '';
  while ischar(tline)
       tline = fgets(fid);
       strline = strcat(strline,tline)
  end
  strline = strrep(strline, '\n', '');
  fclose(fid);
end

