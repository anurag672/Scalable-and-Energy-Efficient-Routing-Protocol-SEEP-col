?Kzz???ɲ???ϱ?????;Iޘ???~S8?h̥qœ???ҫ,??q}LKy??;c??TNRu??7??Q??ɓg?^????o????᧷??5????4?????I;KǸ??ή??{&??????CD                                                                                                                                                                                                                                                                                                                                                                                                s= 1;
        kk = cAr.size(i).totalNode;
        counter = counter +1;
        else
        new_s = new_s +cAr.size(i-1).totalNode;
        kk = kk + cAr.size(i).totalNode;
        counter = counter +1;
        end
        end
      for m =1:n  
      index =1;    
      for k =new_s:kk    
      if cAr.node(k).dead == 0 && cAr.node(k).energy > th && cAr.node(k).clusterID  == j && strcmp(cAr.node(k).type, 'NN') && cAr.node(k).zoneID  == i && cAr.node(k).G == 0
      x = cAr.node(k).x;
      y = cAr.node(k).y;
      dist = 0; d=0;
      for l = new_s:kk  
      if cAr.node(l).dead == 0 && cAr.node(l).energy > th && cAr.node(l).clusterID  == j && cAr.node(l).zoneID  == i
          x1 = cAr.node(l).x;
          y1 = cAr.node(l).y;
          d = ((x1-x)^2 + (y1-y)^2) ^ (0.5);
          dist = dist + d;
      end 
   
      end
      ene =  cAr.node(k).energy;
      avgDist =dist;
      
      chDist = ((x-ch_x)^2 + (y-ch_y)^2)^ (0.5);
  
      if m == 1
      weight(index) = (w1* ene) + (w2 * ((kk - new_s)/avgDist)) + (w3 * (1/chDist));
      sensor(index) = k;
      index = index +1;
      end
      
      if m == 2
      weight(index) = (w2* ene) + (w1 * ((kk - new_s)/avgDist)) + (w3 * (1/chDist));
      sensor(index) = k;
      index = index +1;
      end
      
      if m == 3
      weight(index) = (w2* ene) + (w3 * ((kk - new_s)/avgDist)) + (w1 * (1/chDist));
      sensor(index) = k;
      index = index +1;
      end
      end
    
      end
      rNode = floor(cAr.subLtotalnode(i,j) * p);
      if rNode > 0
          for zz=1:rNode
          [a b] = min(weight);
          cAr.node(sensor(b)).G=1;
          weight(b) =[];
          sensor(b) =[];
          end
          if  m ~= n
          clear weight sensor dist d avgDist rNode
          end
      end
      end
      [a b] = max(weight);
      cAr.node(sensor(b)).RN=1;
      cAr.node(sensor(b)).type='RN';
      cAr.RN(i,j) =  sensor(b);
    end
end
cAr2  = cAr;
end