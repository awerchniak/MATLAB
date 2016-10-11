%% Creating a COE file for the Xilinx memory generator
%  Adapted for making the bin2bcd component of the calculator project
%  E.W. Hansen, Engs 31 16X
%  Edited by Andy Werchniak

%% Copy and paste your code for computing memory contents here; your results will
%  normally be positive integers less than 255 (for 8 bit-wide memory) or 65535 (for
%  16-bit wide memory).  If you want to do negative numbers or fractions, talk to me.
%
%  The results of your calculation must be in a vector called y.
%-----------
dv = 3.3/4095;
ad_lim = 2^12-1;
y = round(1000.*(0:ad_lim).*dv);



%------------
%% Write a .coe file for the Xilinx memory cores

%  File browser box for choosing a filename
[fname, pname] = uiputfile(...
    {'*.coe', 'COE files (*.coe)'; '*.*', 'All Files (*.*)'},...
    'Save coefficients as', 'myROM.coe');

fid = fopen([pname,fname], 'w+t');	% open the file for writing

fprintf(fid, '; Block ROM, created %s\n', datestr(now));
fprintf(fid, 'MEMORY_INITIALIZATION_RADIX=16;\n');
fprintf(fid, 'MEMORY_INITIALIZATION_VECTOR=\n');
Ny = length(y);						% how many coefficients
for n=1:Ny-1,
     fprintf(fid, '%04.0f,\n', y(n));	% comma-separated values
end;
fprintf(fid, '%04.0f;\n', y(Ny));		% last value is followed by semicolon

fclose(fid);						% close the file