function [ msg ] = createMSG( num,stateRandom )
%����һ�������0-1��
%stateRandom - ������Ƿ�Ҫ�̶�1-�̶� 0-�����



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

