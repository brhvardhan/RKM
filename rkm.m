%RKM
clear all;
clc;
n=250;k=4;size=220;prop_distance=50;
%n=input('Enter number of sensor nodes');
%k=input('Enter number of clusters');
[C,S,Np]=k_means_clustering(n,k,size);
disp('Sensor nodes are');
disp(S);
disp('10.Nearest points are');
disp(Np);
%step 1 : Removing less than 1 SN Centroid
degree=zeros(1,k);
Rp_final=[];
while true
    for i=1:n
        degree(1,Np(i))=degree(1,Np(i))+1;
    end
    disp('degree is');
    disp(degree);
    disp('centers are');
    disp(C);

    temp=k;
    i=1;
        disp('26.Degree before');
        disp(degree);

    while i<=temp
        %fprintf('i is %d   temp is %d\n',i,temp);
        if indegree(i)<=1 
            C(:,i)=[];
            degree(i)=[];
            %Np(1,i)=[];
            i=i-1;
            temp=temp-1;
        end
        i=i+1;
    end
    disp('40.Degree after');
    disp(degree);
            
    k=temp
    disp('44.center after removal');
    disp(C);
    disp('46.sensor nodes')
    disp(S);
    %{
    figure()
    plot(S(1,:),S(2,:),'.','Markersize',15);
    hold on 
    plot(C(1,:),C(2,:),'*','Markersize',15);
    axis([0 size 0 size]);
    hold off
    %}

    if(isempty(C))
        break;
    end
    disp('58.weight is');
    wt=cal_weight(k)
    max=wt(1);
    index=1;
    for i=2:k
        if wt(i)>max
            max=wt(i);
            index=i;
        end
    end
    disp('70.index is'); disp(index)
    disp('71 c is');
    disp(C)
    i=1;
    while i<=n
        disp('75.i is ');
        disp(i);
        if sqrt( ((S(1,i)-C(1,index))^2) + ((S(2,i)-C(2,index))^2) ) < prop_distance
            S(:,i)=[];
            Np(i)=[];
            n=n-1;
        else
            i=i+1;
        end
    end

    Rp_final=[Rp_final C(:,index)];
    C(:,index)=[];
    k=k-1;
    disp('85.final rp are');
    disp(Rp_final);
    figure();
    plot(S(1,:),S(2,:),'.','MarkerSize',15);
    axis([0 size 0 size]);
    hold on
    plot(C(1,:),C(2,:),'*','MarkerSize',15);
end
figure();
plot(S(1,:),S(2,:),'.','MarkerSize',15);
axis([0 size 0 size]);


