function [counter1] =  deadCheckCH(cAr,th)

for i =1:cAr.No_of_Cluster
    counter =0;
   
    for j =1:cAr.size(i).subLay
        ch = cAr.CH(j,i) ;
        if ch == 0
        counter = counter +1;
        else if cAr.node(ch).energy < th
            counter = counter +1;
            end
        end
    end
 counter1 = counter;   
end
