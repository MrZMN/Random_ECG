function [S1] = fileIPI4(bbdd,record,frecuency)
disp('--------------------------------------------------------------------------------');
disp(record);
c = num2cell(clock);
disp(datestr(datenum(c{:})));

%% load ECG signal 
fs=frecuency;     
load(bbdd); 
%% sensor 1
ECG = eval(record);

%% Pan-Tompkins Algorithm 
[qrs_amp_raw,qrs_i_raw,delay]=pan_tompkin(ECG,fs,0); 
 
IPI_raw = diff(qrs_i_raw); 

IPI_sc= IPI_raw/fs; 

IPI_nor = IPI_sc/max(IPI_sc); 

disp(' Pan-Tompkins Algorithm ');
nb=8; 
%%% Dynamic Quantization 
IPI = IPI_nor - mean(IPI_nor) ; %removes baseline. No safe information is in baseline.
IPI = normcdf(IPI,0,std(IPI)); %dynamic quantization, first step, now it is between 0 and 1 
   
IPI = IPI*(2^nb) ; 
IPI (IPI==2^nb ) = 2^nb - 1; 
IPI = round(IPI) ; %quantization
disp(' Dynamic Quantization  ');


%gray code
% IPI_int = int32(IPI) ;
IPI_gray = dec2gc(IPI,nb);
disp(' gray code');

%% 4-least significant bits
IPI4 = IPI_gray(:,5:8); 
disp(' 4-least significant bits');
 

mi_matriz = zeros(fix(numel(IPI4)/8),8);
cont = 1;
for i=1:size(IPI4,1)
    if cont<=size(mi_matriz,1)
        if mod(i,2) == 0
            mi_matriz(cont,5:8)=IPI4(i,:);
            cont = cont +1;
        else
            mi_matriz(cont,1:4)=IPI4(i,:);
        end
    end
end

disp('groups 8 bits ');


%%%% sensor1

 S1 = mi_matriz; 



end

