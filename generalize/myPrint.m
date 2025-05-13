function [  ] = myPrint(fileLog, msg )
disp(msg);
fprintf(fileLog,'%s\r\n',msg);
end

