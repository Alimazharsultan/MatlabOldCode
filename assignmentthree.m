clc
clear
%Ali bin Mazhar Sultan
%160487
costs(1,1,2,1) = 4;
costs(1,1,2,2) = 3;
costs(2,1,3,1) = 6;
costs(2,1,3,2) = 5;
costs(2,1,3,3) = 9;
costs(2,2,3,1) = 12;
costs(2,2,3,2) = 10;
costs(2,2,3,3) = 2;
costs(3,1,4,1) = 1;
costs(3,1,4,2) = 6;
costs(3,2,4,1) = 7;
costs(3,2,4,2) = 1;
costs(3,3,4,1) = 6;
costs(3,3,4,2) = 4;
costs(4,1,5,1) = 4;
costs(4,1,5,2) = 7;
costs(4,1,5,3) = 15;
costs(4,2,5,1) = 6;
costs(4,2,5,2) = 1;
costs(4,2,5,3) = 12;
costs(5,1,6,1) = 6;
costs(5,2,6,1) = 9;
costs(5,3,6,1) = 7;
num_states = [1 2 3 2 3 1];
stages = 6;
d = costs;
V(6,1)=0;
for k=(stages-1):-1:1
 for i=1:num_states(k)
 for j = 1:num_states(k+1)
 path_length(j)= d(k,i,k+1,j)+V(k+1,j);
 end
 V(k,i)=min(path_length);
 clear path_length
 end
end
V(1,1)
path = 0;
index = 1;
s =0;
y = 1;
for k=1:(stages-1)
 for j=1:num_states(k+1)
 path_length(j)= d(k,index,k+1,j)+V(k+1,j);
 end
 [minval, index] = min(path_length);
 if(k==1)
 end
 if(k~=1)
    y = num_states(k-1)+y; 
 end
 s=s+y;
 path(k) = (y);
 clear path_length
end