function [ x,msg_extract,idx ] = extraction( x1,x2,x3,msg_extract,idx,locations,n)


%ͼ��pixel-value��uint8����������и���������Ҫ����doubleת��
dx = double(x1)-double(x2);
dy = double(x2)-double(x3);

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

[msg_extract,idx] = getMsgExtByBlockSize(label,n,msg_extract,idx);


x = x1 - locations(label,1);
end

