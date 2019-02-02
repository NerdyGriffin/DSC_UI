function cuiWaitbar(x,msg)
%cuiWaitbar
%   Create a waitbar in the command window
%   
%   Author: Christian Kunis (Nov 27, 2018)

if x > 1
    error('Error: Fractional wait bar length, x, cannot be greater than 1')
elseif x < 0
    error(['Error: Fractional wait bar length, x, must be a positive value,\n'...
        'less than or equal to 1'])
end

waitbarLength = 60;

disp(' ')
disp(' ')
disp(' ')
disp(' ')
disp(' ')
disp(' ')
disp(' ')
disp(' ')
fprintf('[')
i = 1;
while i < x.*waitbarLength
    fprintf('=')
    i = i + 1;
end
fprintf('>')
i = i + 1;
while i < waitbarLength
    fprintf(' ')
    i = i + 1;
end
fprintf('] %3.0f%%\n',x*100)
disp(msg)
end

