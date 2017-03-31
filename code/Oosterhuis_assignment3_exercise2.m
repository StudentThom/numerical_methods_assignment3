function [ output_args ] = Oosterhuis_assignment3_exercise2()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%generate graphical user input, number of points: min=1, max=infinity
[x,y] = ginput
%Determine number of points
number_of_points = length(x)

%Use green to calculate line-integral
%\int(dq/dx - dp/dy)dx \smash? dy = \int 1 => q=x,p=0
t = linspace(0,1,100);
A = 0 %total line integral
for i=1:number_of_points-1
    A_i = 0
    %find parametrizaion gamma for C:
    slope = (x(i+1)-x(i))/(y(i+1)-y(i))
    parametrisation = @(t) [x(i);y(i)]+ t * slope %HOW TO DEFINE STARTING POINT??=>ASK TA
    for j=1:length(t)-1
        parametrisation_j_plus_1 = parametrisation(j+1)
        parametrisation_j = parametrisation(j)
        distance = sqrt((parametrisation_j_plus_1(1)+parametrisation_j(1))^2+(parametrisation_j_plus_1(2)+parametrisation_j(2))^2) %pythagoras
        A_j = parametrisation(j) * distance %WHAT TO USE FOR f?? => ASK TA
        A_i = A_i + A_j %A_i is partial line integral between two points, 
        %computed by dividing the line in length(t) parts, each with value 
        %line integral value A_j 
    end
    A = A + A_i
end
%USE INTERPOLATION!

%calculate the center of mass
%HOW IS THIS DEFINED???

%Plot input points and interpolated curve and the area inside the curve
%with a clear marrk at the center of mass
%
%first the points
for i=1:length(x)
    hold on
    plot(x(i),y(i),'*')
end
%now the lines between the points:
t = linspace(0,1,100);
for i=1:length(x)-1
    slope = (x(i+1)-x(i))/(y(i+1)-y(i))
    parametrisation = @(t) [x(i);y(i)]+ t * slope %HOW TO DEFINE STARTING POINT??=>ASK TA
    plot(t,parametrisation(t))
end

hold off

end

