function serialDate = sec2date(seconds)
%sec2date
%   Return the serial date number which corresponds to the given time in
%   seconds

serialDate = datenum(0, 0, 0, 0, 0, seconds);

end

