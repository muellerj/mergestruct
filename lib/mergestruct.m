function outstruct = mergestruct(s1, s2)
%MERGESTRUCT
% Merge two given structs. If the same field exists in both S1 and S2,
% the value from S2 is used. If either struct is a struct array, the two
% are concatenated. For example:
%
% >> a.x = 1;
% >> a.y = 2;
% >> b.y = 5;
% >> b.z = 10;
% ans =
%
%     x: 1
%     y: 5
%     z: 10


if not(isstruct(s1)) || not(isstruct(s2))
  error('Both arguments must be structs');
end

% By default, the first argument is passed through
outstruct = s1;

% Go through all fields of the 2nd struct and decide, what to do
fnames = fieldnames(s2);

if length(outstruct) > 1 || length(s2) > 1
  for sidx = 1:length(s2)
    for fidx = 1:length(fnames)
      outstruct(length(s1)+sidx).(fnames{fidx}) = s2(sidx).(fnames{fidx});
    end
  end
else
  for fidx = 1:length(fnames)
    if isfield(outstruct, fnames{fidx}) && isstruct(outstruct.(fnames{fidx})) && isstruct(s2.(fnames{fidx}))
      outstruct.(fnames{fidx}) = mergestruct(outstruct.(fnames{fidx}), s2.(fnames{fidx}));
    else
      outstruct.(fnames{fidx}) = s2.(fnames{fidx});
    end
  end
end

