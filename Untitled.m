test1 = load('calibration.txt');
 for i=1:length(test1)-1
        distance(i)=sqrt((test1(i,3)-test1(i+1,3))^2+(test1(i,4)-test1(i+1,4))^2);
    end

for j=1:2:10
    for i=1:length(test1)/2
        distance(i)=sqrt((test1(i,j)-test1(i+1,j))^2+(test1(i,j+1)-test1(i+1,j+1))^2);
    end
end

distance(:,4)=[];
distance(:,7)=[];

dmean1=mean(distance)
dstd1=std(distance)

t1 = load('rob2cart_dana1.txt');
t2 = load('rob2cart_dana2.txt');
t3 = load('rob2cart_dana3.txt');


dif1=t1-t2;
dif2=t2-t3;
dif3=t1-t3;
