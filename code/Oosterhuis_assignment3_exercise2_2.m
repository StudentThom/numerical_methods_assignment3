function [ t ] = Oosterhuis_assignment3_exercise2_2()
%Function takes points from user input and makes parametrisation for line between points. Function output is figure of xy-plane with points connected by parametrisation and a special mark for the center of mass.
% Function gives xy-plane to user with instructions to mark some points in xy-plane. The coordinates of these points are stored in vectors x and y. Using interpolation a parametrisation of a closed curve going though all these points is constructed.
% figure('position',get(0,'screensize'))
% axes('position',[0 0 1 1])
text(0.05,0.5,{'Please click some points to make a figure for which the center of mass will be computed. Press enter to continue.'})
[x,y] = ginput
%make sure at least three points are clicked:
if length(x) <= 3
    error('Error: At least 3 points need to be selected')
end
    
% removing double cliks:(doesn't work as wished)
%for j=2:length(x)
%    for k=j:length(x)
%        if x(k)==x(j) && y(k)==y(j)
%            x(k)=10
%            y(k)=10
%        end
%    end
%end
%x(x==10) = []
%y(y==10) = []

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

%center of mass has coordinates \int_{omega}(x) / \int_omega(1),
% \int_{omega}(y) / \int_omega(1)

%%CENTER OF MASS BY USING GREEN: f2=x f1 = 0 (chosen), use trapz() for
% lineintergral

end

