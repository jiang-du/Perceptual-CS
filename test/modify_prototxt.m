function filename = modify_prototxt(filename, num_blocks, width, height)

fid = fopen(filename,'r');
i = 1;
tline = fgetl(fid);
A{i} = tline;
while ischar(tline)
    i = i+1;
    tline = fgetl(fid);
    A{i} = tline;
end
fclose(fid);
if nargin>1
    str = ['input_dim:',' ',num2str(num_blocks)];
    A{3} = sprintf('%s',str);
end
if nargin>2
    A{5}=sprintf('input_dim: %d',width);
    if nargin>3
        A{6}=sprintf('input_dim: %d',height);
    else
        A{6}=sprintf('input_dim: %d',width);
    end
end
% Write cell A into txt
fid = fopen(filename, 'w');
for i = 1:numel(A)
    if A{i+1} == -1
        fprintf(fid,'%s', A{i});
        break
    else
        fprintf(fid,'%s\n', A{i});
    end
end
fclose(fid);