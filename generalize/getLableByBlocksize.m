function [label,EC] = getLableByBlocksize(msg,EC,n)


arys=[5,6,4;%t=1 - Read 5 bits, if this digit greater than 6, read its front 4 bits as the secret digit
    6,58,30;%t=2 - Read 6 bits, if this digit greater than 58, read its front 5 bits as the secret digit
    7,126,64;%t=3 - Read 7 bits, if this digit greater than 126, read its front 6 bits as the secret digit
    ];


if n==19 % For t=1
    ary = arys(1,:);
elseif n==61 % For t=2
    ary = arys(2,:);
else % For t=3
    ary = arys(3,:);
end

bits = num2str(msg(EC:EC+(ary(1)-1)));
label = bin2dec(bits)+1;
EC = EC+ary(1);
if label>ary(2)      
    EC = EC-ary(1);
    bits = num2str(msg(EC:EC+(ary(1)-2)));
    label = bin2dec(bits)+ary(3);
    EC = EC+ary(1)-1;
end


end

