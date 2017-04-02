function [ y ] = Oosterhuis_assignment3_exercise3_2(normal_or_inverse,vector_x)
%Oosterhuis_assignment_exercise3_1() calculates the discrete Fourier transform of
%a vector or its inverse Fourier transform. Input is a vector of length
%2^n and a variable which indicates whether the normal or inverse
%transform needs to be calculated
%output is vector of same size as input vector
%testinput: Oosterhuis_assignment3_exercise3_2(0,[0;0.707;1;0.707;0;-0.707;-1;-0.707])
normal_or_inverse;
if normal_or_inverse == 0
N = length(vector_x);

%recursion:
if N==1
    %b = -1i*(2 * pi * k * (n-1))/N
    y = vector_x;
    %i = i + 1
else
    vector_x_even = vector_x(2:2:end);
    vector_x_odd = vector_x(1:2:end);
    y_even = Oosterhuis_assignment3_exercise3_2(0,vector_x_even);
    y_odd = Oosterhuis_assignment3_exercise3_2(0,vector_x_odd);
    N = length(y_even);
    omega = exp(-2 * pi * 1i / (N*2)) .^ (0:N-1)' ;
    z = omega .* y_even;
    y = [ y_odd + z; y_odd - z];
    end
end
%
%The inverse fourier transform:
if normal_or_inverse == 1
    N = length(vector_x);
    if N==1
        y = vector_x;
    else
        vector_x_even = vector_x(2:2:N);
        vector_x_odd = vector_x(1:2:N);
        y_even = Oosterhuis_assignment3_exercise3_2(normal_or_inverse,vector_x_even);
        y_odd = Oosterhuis_assignment3_exercise3_2(normal_or_inverse,vector_x_odd);
        N = length(y_odd);
        omega = exp(2 * pi * 1i / (N*2)) .^ (0:N-1)' ; %no '-' sign since it's the inverse Fourier transform
        z = omega .* y_even;
        y = [ y_odd + z; y_odd - z];
    end
end
end

