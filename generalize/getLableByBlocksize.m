function [label,EC] = getLableByBlocksize(msg,EC,n)

%��ѧ��ʽ������
%1��x+y=19
%2��x+2y=32
%  x=6,y=13
%3 - 19
%{00000,...,00101}��Ӧ{1,...,6}
%{0011,1111}��Ӧ{7,19}����ֵ��4
%5 - 61
%{000000,...,111001}��Ӧ{1,...,58}
%{11101,11111}��Ӧ{59,61}����ֵ��30
%7 - 127
%{0000000,...,1111101}��Ӧ{1,...,126}
%{1111111}��Ӧ{127}����ֵ��64
arys=[5,6,4;%3-��ȡ5��bit�������6����1��ʼ��ţ�����ȡ4��bits
    6,58,30;%5-��ȡ6��bit�������58����1��ʼ��ţ�����ȡ5��bits
    7,126,64;%7-��ȡ7��bit�������126����1��ʼ��ţ�����ȡ6��bits
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

