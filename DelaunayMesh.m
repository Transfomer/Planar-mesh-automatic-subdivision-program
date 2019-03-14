function DelaunayMesh(h0,x,y)
%讲任意的四边形划成两个部分分别求其面积
A=[x(1) y(1) 1;x(2) y(2) 1;x(3) y(3) 1];
B=[x(1) y(1) 1;x(4) y(4) 1;x(3) y(3) 1];
A1=abs(det(A));
A2=abs(det(B));
xmin=min(x(:));
xmax=max(x(:));
ymin=min(y(:));
ymax=max(y(:));
n1=fix((xmax-xmin)/h0);
n2=fix((ymax-ymin)/(h0*sqrt(3)/2));
[X,Y]=meshgrid(xmin:h0:xmax,ymin:h0*sqrt(3)/2:ymax);
X(2:2:end,:)=X(2:2:end,:)+h0/2; 
[a,b]=size(X);
[c,d]=size(Y);
fprintf('%f \n ',c);
node=(n1+1)*fix(n2+1);
n=1;
for i=1:node
    C=[x(1) y(1) 1;x(2) y(2) 1;X(i) Y(i) 1];
    D=[x(3) y(3) 1;x(2) y(2) 1;X(i) Y(i) 1];
    E=[x(1) y(1) 1;x(4) y(4) 1;X(i) Y(i) 1];
    F=[x(3) y(3) 1;x(4) y(4) 1;X(i) Y(i) 1];
    A3=abs(det(C));
    A4=abs(det(D));
    A5=abs(det(E));
    A6=abs(det(F));
    if (A3+A4+A5+A6==A1+A2)
            X1(n)=X(i);
            Y1(n)=Y(i);
            n=n+1;
    end
end
%fprintf('%d   ',X1);
for j=1:4
    X1(end+j)=x(j);
    Y1(end+j)=y(j);
end
if rem(a,2)==0
    X(a+1,:)=X(a-1,:);
else
    X(a+1,:)=X(a,:);
end
Y(c+1,:)=ymax;

for i=1:b
    X1(end+i)=X(end,i);
    Y1(end+i)=Y(end,i);
end

% delaunay是MATLAB中三角剖分的函数，返回的TRI是三角形的矩阵  
% TRI的每一行表示三角形的三个点  

TRI = delaunay(X1,Y1);  
%fprintf('%f  ',TRI);

% 绘图  
%figure;   
xl = xmax - xmin; yl = ymax - ymin;  
axis([xmin-xl*0.1, xmax+xl*0.1,...  
    ymin-yl*0.1, ymax+yl*0.1]);  
hold on;  
  
n = size(TRI, 1);  
for i = 1 : n  
    t1 = TRI(i, :);  
    for j = 1 : length(t1)-1  
        xt = [X1(t1(j)) X1(t1(j+1))];  
        yt = [Y1(t1(j)) Y1(t1(j+1))]; 
        plot(xt, yt, 'k-', 'LineWidth', 2);  
        %pause(0.1);  
    end  
    xt = [X1(t1(end)) X1(t1(1))];  
    yt = [Y1(t1(end)) Y1(t1(1))];  
    plot(xt, yt, 'k-', 'LineWidth', 2);  
    %pause(0.1);  
end  






  
