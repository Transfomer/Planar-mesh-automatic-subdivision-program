function Mesh(nx,ny,Xa,Ya,a,b)
x=zeros(ny+1,nx+1);%ĸ��Ԫ������ڵ�Ŀռ�
y=zeros(ny+1,nx+1);
X=zeros(ny+1,nx+1);%�ӵ�Ԫ������ڵ�Ŀռ�
Y=zeros(ny+1,nx+1);
X1=zeros(1,8);
Y1=zeros(1,8);
dx=2/nx; %ÿ����ĸ��Ԫ�еı��ʷֵ�С��Ԫ�ı߳�
dy=2/ny;
for i=1:4
    X1(i)=Xa(i);
    Y1(i)=Ya(i);
end
xmin=X1(1);xmax=X1(1);
ymin=Y1(1);ymax=Y1(1);
%ȷ����ͼ�ռ�Ĵ�С
for i=1:4
    if X1(i)<xmin
        xmin=X1(i);
    end
    if X1(i)>xmax
        xmax=X1(i);
    end
    if Y1(i)<ymin
        ymin=Y1(i);
    end
    if Y1(i)>ymax
        ymax=Y1(i);
    end
end
xlabel('x����');
ylabel('y����'); 
axis([xmin-1,xmax+1,ymin-1,ymax+1]);
hold on;
plot(X1,Y1,'g');
%�ӵ�Ԫ��5-8�ڵ���������
X1(5)=(X1(1)+X1(2))/2;Y1(5)=(Y1(1)+Y1(2))/2;
X1(6)=(X1(3)+X1(2))/2;Y1(6)=(Y1(3)+Y1(2))/2;
X1(7)=(X1(3)+X1(4))/2;Y1(7)=(Y1(3)+Y1(4))/2;
X1(8)=(X1(1)+X1(4))/2;Y1(8)=(Y1(1)+Y1(4))/2;
for iy=1:(ny+1)
    for ix=1:(nx+1)
        x(iy,1)=-1.0;%����ĸ��Ԫ������
        x(iy,ix)=-1.0+(ix-1)*dx;
        y(iy,ix)=-1.0+(iy-1)*dy;
        N=Shape(x(iy,ix),y(iy,ix));%��Ӧĸ��Ԫ�ϵ���κ���
        %fprintf('%d ',N);
        for i=1:8
        X(iy,ix)=X(iy,ix)+N(i)*X1(i);%ĸ��Ԫ���ӵ�Ԫ�ϵ��ӳ��
        Y(iy,ix)=Y(iy,ix)+N(i)*Y1(i);
        end
    end
end
plot(X,Y,'r');
U=zeros(nx+1,ny+1);
V=zeros(nx+1,ny+1);
U=X';
V=Y';
plot(U,V,'r');
i=1;
if a==1
    for iy=1:ny
        for ix=1:nx
            text((X(iy,ix)+X(iy,ix+1))/2,(Y(iy,ix)+Y(iy+1,ix))/2,num2str(i));
            i=i+1;
            %pause(0.1);
        end
    end
end
i=1;
if b==1
    for iy=1:(ny+1)
        for ix=1:(nx+1)
            text(X(iy,ix),Y(iy,ix),num2str(i));
            i=i+1;
            %pause(0.1);
        end
    end
end
hold off;

       
    
    
    