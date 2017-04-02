function [ y ] = Oosterhuis_assignment3_exercise3_4(vector_fft)
% Function takes vector with evaluated points of fourier transform function and plots it on the xy plane.
%plots frequencies
%
%define variables
N = length(vector_fft)
nyquist_limit = N/2
%make vector with magnitudes of complex numbers in vector_fft
magnitudes = zeros(nyquist_limit,1)
for j=1:nyquist_limit
    magnitudes(j) = (real(vector_fft(j))^2 + imag(vector_fft(j))^2)^(0.5)
end
%make frequencies one sided
magnitudes_one_sided = magnitudes(1:nyquist_limit) .*2
%scale by devide by number of samples
magnitudes_final = magnitudes_one_sided ./ N
%plotting
frequencies = linspace(1,nyquist_limit,nyquist_limit)
plot(frequencies,magnitudes_final)
xlabel('Frequency in Hertz');
ylabel('Amplitude');
title('Magnitude Response')

% example
% syms k
% t = linspace(0,0.5,128)
% func = @(t) symsum(k*cos(k*20*pi*t),k , 1, 5)
% test = func(t)
% vector_fft = Oosterhuis_assignment3_exercise3_2(0,test)
% Oosterhuis_assignment3_exercise3_4(vector_fft)
%%plot original function
% plot(t,func(t))
% xlabel('Time');
% ylabel('Amplitude');
% title('g(t)')
end
    

