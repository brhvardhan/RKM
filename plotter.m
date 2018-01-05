function plotter(set1,set2,set3,cases)
    figure()
   
    disp(set3);
        for i=1:cases
         if set1(1,i)== 1   
         plot(set2(1,i),set2(2,i),'.','MarkerSize',20,'Color',[0 0.5 0])
         hold on
         elseif set1(1,i)== 2
           plot(set2(1,i),set2(2,i),'.','MarkerSize',20,'Color',[1 0.988235 0.2]) 
            hold on
         elseif set1(1,i)== 3
           plot(set2(1,i),set2(2,i),'c.','MarkerSize',20) 
            hold on   
         else  
             plot(set2(1,i),set2(2,i),'m.','MarkerSize',20)
         end
         plot(set3(1,:),set3(2,:),'r.','MarkerSize',30)
        end
        axis([0 size 0 size]);

end

%40,70