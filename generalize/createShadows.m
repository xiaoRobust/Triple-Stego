function [ x1,x2,x3 ] = createShadows(x,label,dis)

   x1 = x + dis(label,1);
   x2 = x + dis(label,2);
   x3 = x + dis(label,3);

end

