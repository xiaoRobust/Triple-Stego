function [ result ] = testing( fileLog,I,IS,msg,msg_extract )
d = sum(sum(msg~=msg_extract));

psnrval =PSNR(uint8(I),uint8(IS));

result =1;
if d~=0
    result=0;
    myPrint(fileLog,['difference:',num2str(d)]);
elseif isinf(psnrval)==0
    result = 0;
    myPrint(fileLog,['PSNR:',num2str(psnrval)]);
end


end

