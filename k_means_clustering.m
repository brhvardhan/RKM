function [RP,S,Np_new]=k_means_clustering(n,k,size)
clc;
%size=250;% size of the plane
%n=300;   %n sensor nodes
%k=3;    %k rendezevous points

S = randi(size,[2,n]);

%k=evalclusters(S,'kmeans','Gap');

RP = randi(size,[2,k]); %Renzevous points

plot(S(1,:),S(2,:),'b.','MarkerSize',20)
hold on
plot(RP(1,:),RP(2,:),'r.','MarkerSize',30)
axis([0 size 0 size]);
Np_old=ones([1,n]);
Np_new=zeros([1,n]); %nearest RP node number
while ~isequal(Np_new,Np_old)
    Np_old=Np_new;
    %disp('old NP is')
    %disp(Np_old);
    
    for i=1:n
        min=1000;
        dist=0;
        temp=0;
        for j=1:k
            dist=sqrt( ((S(1,i)-RP(1,j))^2) + ((S(2,i)-RP(2,j))^2) );
            if dist<min
                min=dist;
                Np_new(1,i)=j;
                temp=j;
            end
        end
    
        %fprintf('minimum distace %f,index=%f\n',min,temp);
    end
   % disp('after processing')
   % disp(Np_new);
    
    

    for i=1:k
        sum_x=0;
        sum_y=0;
        count=0;
        for j=1:n
            if Np_new(1,j)==i
                sum_x = sum_x + S(1,j);
                sum_y = sum_y + S(2,j);
                count=count+1;
            end
        end

        if count~=0
        RP(1,i)=sum_x/count;
        RP(2,i)=sum_y/count;
        end
    end
    %disp('new Rps are');
    %disp(RP);
 
end
    disp('centers are');
    disp(RP);
figure()   
for i=1:n
 if Np_new(1,i)== 1   
 plot(S(1,i),S(2,i),'b.','MarkerSize',20)
 hold on
 elseif Np_new(1,i)== 2
   plot(S(1,i),S(2,i),'g.','MarkerSize',20) 
    hold on
 elseif Np_new(1,i)== 3
   plot(S(1,i),S(2,i),'c.','MarkerSize',20) 
    hold on   
 else  
     plot(S(1,i),S(2,i),'m.','MarkerSize',20)
 end
 plot(RP(1,:),RP(2,:),'r.','MarkerSize',30)
 axis([0 size 0 size]);
end

end



