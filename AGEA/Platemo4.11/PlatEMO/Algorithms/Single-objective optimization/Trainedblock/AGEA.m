classdef AGEA<ALGORITHM
    % <2025> <single> <real>
methods
function main(x,y)
d=load('H:\Platemo4.11\PlatEMO\Algorithms\Single-objective optimization\Trainedblock/C05D30M2T.mat','Blocks','Graph','Population');
a=d.Blocks;g=d.Graph;e=1e-4;m=length(a);p=arrayfun(@(s)isa(s,'Block_Population'),a(:)');a(p).Initialization(y.Initialization());a(1,m).Weight(:,1)=min(rand(size(a(1,m).Weight,1),1)+0.5);u=a(1,m).Weight(:,1);z=2:size(a(1,m).Weight,2)-1;t=a(1,m).Weight(:,z);if rand<0.2;a(1,m).Weight(:,z)=t+e*rand;else;a(1,m).Weight(:,z)=t;end
persistent q
while x.NotTerminated(a(1).output)
b=false(1,m);
while ~all(b(p))
for i=find(~b)
if all(b(logical(g(:,i)))|p(logical(g(:,i))))
if i==m
if y.FE<=3e4
w=(1-0.9*(y.FE/3e4)).*u;
elseif y.FE>3e4&&y.FE<=1.5e5
w=(0.1-0.09*((y.FE-3e4)/1.2e5)).*u;
elseif y.FE>1.5e5&&y.FE<=2.4e5
r=(y.FE-1.5e5)/9e4;if rand<=0.5;w=(0.01-0.009*r).*u;else;w=max(0.01-0.01*r^2,0).*u;end
else
if isempty(q);q=ceil((0.8+rand*0.1)*3e5);end
if y.FE>=q;w=0;end
end
a(1,i).Weight(1:size(a(1,i).Weight,1))=w;
end
eval(['a(',num2str(i),').Main(y,a(logical(g(:,',num2str(i),'))),g(:,',num2str(i),'));']);
b(i)=1;
end
end
end
end
end
end
end
