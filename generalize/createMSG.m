function [ msg ] = createMSG( num,stateRandom )
%创建一个随机的0-1串
%stateRandom - 随机数是否要固定1-固定 0-真随机



key = 2021;

msg=zeros(1,num); 
for i=1:num     
      if 1==stateRandom
            rand('state',key); 
            key=key+1;
      end

      if rand>0.5
          msg(i)=1;
      else
          msg(i)=0;
      end
end

end

