function [counter1] =  deadCheckRN(cAr,th)

for i =1:cAr.No_of_Cluster
    counter =0;
   
    for j =1:cAr.size(i).subLay
        rn = cAr.RN(i,j) ;
     if rn == 0
        counter = counter +1;
     else if cAr.node(rn).energy < th
            counter = counter +1;
         end
     end
    end
 counter1 = counter;   
end
