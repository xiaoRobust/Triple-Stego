function [msg_extract,idx] = getMsgExtByBlockSize(label,n,msg_extract,idx)


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



if label>ary(2)
   bits = dec2bin(label-ary(3),ary(1)-1);

   for t=1:ary(1)-1
       msg_extract(idx+t-1) = bits(t)-48;
   end
   idx = idx+ary(1)-1;
else
   bits = dec2bin(label-1,ary(1));

   for t=1:ary(1)
       msg_extract(idx+t-1) = bits(t)-48;
   end
   idx = idx+ary(1);
end

end

