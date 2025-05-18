function [ x,msg_extract,idx ] = extraction( x1,x2,x3,msg_extract,idx,locations,n)


% Convert the pixles into double, since the difference maybe negative
dx = double(x1)-double(x2);
dy = double(x2)-double(x3);

% Find out the embedded secret digit (label) from dis based on dx and dy
label = -1;
for i=1:n
    if dx == (locations(i,1)-locations(i,2)) && dy == (locations(i,2)-locations(i,3))
       label = i;
       break
    end
end

if -1 == label
    error('label = -1');
end

% Reterive the embedded secret bits from label
[msg_extract,idx] = getMsgExtByBlockSize(label,n,msg_extract,idx);

% Reterive the cover pixel
x = x1 - locations(label,1);
end

