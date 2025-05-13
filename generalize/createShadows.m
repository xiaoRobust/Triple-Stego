function [ x1,x2,x3 ] = createShadows(x,label,locations)

   x1 = x + locations(label,1);
   x2 = x + locations(label,2);
   x3 = x + locations(label,3);

end

