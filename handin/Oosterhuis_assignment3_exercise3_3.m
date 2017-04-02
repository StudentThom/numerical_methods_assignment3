function convolution = Oosterhuis_assignment3_exercise3_3(f,g)
%Oosterhuis_assignment3_exercise3_3 computes convolution of two  function
%by taking fourier transforms of both functions, multiplying these outputs
%and then taking the inverse fourier transform of that. Output is the
%function f*g, i.e. the convolution of f and g
%input is two functions OR two vectors both consisting of a 2^n number of
%points being the result of a function f resp. g for some t.
%
%info for testing convolution: http://www.ee.ic.ac.uk/hp/staff/dmb/courses/E1Fourier/00700_TransformParseval.pdf
%
%test input1 (functions): 
%f = @(x) sin(x)
%g = @(x) cos(x)
%Oosterhuis_assignment3_exercise3_3(f,g)
%test input2(vectors with function results):
%t = linspace(-pi,pi,32)
% Oosterhuis_assignment3_exercise3_3(function_u(t),function_g(t))
%
%define variables
number_of_points = 8; %=2^n since that's required lenght of input vector in Oosterhuis_assignment3_exercise3_2
t = linspace(-pi,pi,number_of_points);
%
%Check whether f is function, if so evalutate it on #number_of_points to
%make a vector
if isa(f,'function_handle')
    %evaluate function f at t, results is vector of length length(t)
    f_evaluated = feval(f,t)';
else
    f_evaluated = f;
end
%
%Check whether g is function, if so evalutate it on #number_of_points to
%make a vector
if isa(g,'function_handle')
    %evaluate function g at t, results is vector of length length(t)
    g_evaluated = feval(g,t)';    
else
    g_evaluated = g;
end
%compute fourier transform of these vectors
f_fft = Oosterhuis_assignment3_exercise3_2(0,f_evaluated);
g_fft = Oosterhuis_assignment3_exercise3_2(0,g_evaluated);
%compute elementwise product of fourier transforms
product_f_fft_g_fft = f_fft .* g_fft;
%now take inverse fourier transform of computed product to get the
%convolution of f and g (i.e. f*g)
convolution = Oosterhuis_assignment3_exercise3_2(1, product_f_fft_g_fft);
end
