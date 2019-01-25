function seconds = date2sec(serialdate)
%date2sec
%   Return the time represented by the give serial date, measured in
%   seconds

seconds = serialdate .* 24 .* 60 .* 60;

end

