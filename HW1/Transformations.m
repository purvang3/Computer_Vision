clc;
clear all;
close all;

display('Answer-1')
display('Transformations For Equilateral Triangle')

x = [0,0];
y = [1,1];
z = [2,0];
figure(1)
axis([-5 5 -5 5])
line([x(1),y(1)],[x(2),y(2)],'color','green');
line([x(1),z(1)],[x(2),z(2)],'color','green');
line([y(1),z(1)],[y(2),z(2)],'color','green');
xlabel('X Axis')
ylabel('Y Axis')
title('Original Triangle')
w=1                            % To Transfer in Homogeneous Coordinates
x1=[x';w];
y1=[y';w];
z1=[z';w];
t=[1 0 2; 0 1 2; 0 0 1]        %Translation Matrix
x2=t*x1;
disp(x2)
y2=t*y1;
disp(y2)
z2=t*z1;
disp(z2)
axis([-5 5 -5 5])
line([x2(1),y2(1)],[x2(2),y2(2)])
line([x2(1),z2(1)],[x2(2),z2(2)])
 line([y2(1),z2(1)],[y2(2),z2(2)])
 xlabel('X Axis')
 ylabel('Y Axis')
 title('Translation') 
 
 %
 theta= 150
 R=[cos(theta) -sin(theta) 1;sin(theta) cos(theta) 1;0 0 1]  %Euclidean Matrix
 R1=R*x1;
 disp(R1)
 R2=R*y1;
 disp(R2)
 R3=R*z1;
 disp(R3)
 figure(3)
 axis([-5 5 -5 5])
 line([R1(1),R2(1)],[R1(2),R2(2)])
 line([R1(1),R3(1)],[R1(2),R3(2)])
 line([R2(1),R3(1)],[R2(2),R3(2)])
 xlabel('X Axis')
 ylabel('Y Axis')
 
  %affine
 A=[1 -1 0 ;-2 0 1;0 0 1]
 A1=A*x1;
 disp(A1)
 A2=A*y1;
 disp(A2)
 A3=A*z1;
 disp(A3)
 figure(5)
 line([A1(1),A2(1)],[A1(2),A2(2)])
 line([A1(1),A3(1)],[A1(2),A3(2)])
 line([A2(1),A3(1)],[A2(2),A3(2)])
 xlabel('X Axis')
 ylabel('Y Axis')
 title('Affine')
 axis([-10 10 -10 10])
 
 %  projective transformation
 H=[-1 0 -2;1 2 -2;0 1 1];
 H1=H*x1;
 disp(H1)
 H2=H*y1;
 disp(H2)
 H3=H*z1;
 disp(H3)
 figure(6)
 axis([-10 10 -10 10]) 
 line([H1(1),H2(1)],[H1(2),H2(2)])
 line([H1(1),H3(1)],[H1(2),H3(2)])
 line([H2(1),H3(1)],[H2(2),H3(2)])
 xlabel('X Axis')
 ylabel('Y Axis')
 title('Projective')
 
 