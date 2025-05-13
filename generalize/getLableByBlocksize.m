function [label,EC] = getLableByBlocksize(msg,EC,n)

%数学公式，满足
%1、x+y=19
%2、x+2y=32
%  x=6,y=13
%3 - 19
%{00000,...,00101}对应{1,...,6}
%{0011,1111}对应{7,19}，差值是4
%5 - 61
%{000000,...,111001}对应{1,...,58}
%{11101,11111}对应{59,61}，差值是30
%7 - 127
%{0000000,...,1111101}对应{1,...,126}
%{1111111}对应{127}，差值是64
arys=[5,6,4;%3-先取5个bit如果大于6（从1开始编号），则取4个bits
    6,58,30;%5-先取6个bit如果大于58（从1开始编号），则取5个bits
    7,126,64;%7-先取7个bit如果大于126（从1开始编号），则取6个bits
    ];


if n==19
    ary = arys(1,:);
elseif n==61
    ary = arys(2,:);
else
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

