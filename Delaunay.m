clc;  
clear;  
close all;  
  
rand('RNG', 0);  
node = 10;  
x = rand(1,node);  
y = rand(1,node);  
% delaunay��MATLAB�������ʷֵĺ��������ص�TRI�������εľ���  
% TRI��ÿһ�б�ʾ�����ε�������  
TRI = delaunay(x,y);  
  
% ��ͼ  
figure;   
xmin = min(x(:)); xmax = max(x(:));  
ymin = min(y(:)); ymax = max(y(:));  
xl = xmax - xmin; yl = ymax - ymin;  
axis([xmin-xl*0.1, xmax+xl*0.1,...  
    ymin-yl*0.1, ymax+yl*0.1]);  
hold on;  
  
n = size(TRI, 1);  
for i = 1 : n  
    t1 = TRI(i, :);  
    for j = 1 : length(t1)-1  
        xt = [x(t1(j)) x(t1(j+1))];  
        yt = [y(t1(j)) y(t1(j+1))];  
        plot(xt, yt, 'k-', 'LineWidth', 2);  
        pause(0.1);  
    end  
    xt = [x(t1(end)) x(t1(1))];  
    yt = [y(t1(end)) y(t1(1))];  
    plot(xt, yt, 'k-', 'LineWidth', 2);  
    pause(0.1);  
end  
  
W = zeros(node);  
for i = 1 : n  
    for j = 1 : length(TRI(i, :))-1  
        W(TRI(i, j), TRI(i, j+1)) = 1;  
        W(TRI(i, j+1), TRI(i, j)) = 1;  
    end  
    W(TRI(i, end), TRI(i, 1)) = 1;  
    W(TRI(i, 1), TRI(i, end)) = 1;  
end  
for i = 1 : node  
    for j = 1 : node  
        if ~W(i, j)  
            W(i, j) = 10000;  
        end  
    end  
end  