function [ t ] = Oosterhuis_assignment3_exercise2_2()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% figure('position',get(0,'screensize'))
% axes('position',[0 0 1 1])
text(0.05,0.5,{'Please clicks some points to make a figure for which the center of mass will be computed'})
[x,y] = ginput
% removing double cliks:

% add first point at the end to make closed curve
x(length(x)+1)=x(1)
y(length(y)+1)=y(1)

% take cumultative sum of square root of (difference between x_i and x_i-1
% squared plus difference between y_i and y_i-1 squared).
t = cumsum(sqrt([0,diff(x')].^2 + [0,diff(y')].^2));
%define steps  
ti = linspace(t(1),t(end),500);
%find line between points 
xi = interp1(t,x',ti,'cubic');
yi = interp1(t,y',ti,'cubic');
%plot points and interpolation
plot(x,y,'b.',xi,yi,'r-') 
hold off
%Z = trapz(xi,yi')
Z = trapz(xi,yi)
Z2 = trapz(ones(length(yi),1),yi)
%
A = 1/2*sum(splineX.*y2 - x2.*splineY);
%center of mass has coordinates \int_{omega}(x) / \int_omega(1),
% \int_{omega}(y) / \int_omega(1)

%%CENTER OF MASS BY USING GREEN: f2=x f1 = 0 (chosen), use trapz() for
% lineintergral

end

