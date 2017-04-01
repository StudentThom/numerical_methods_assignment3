function [vector_lambda_new,vector_c,residue_vector_lambda_new] = Oosterhuis_assignment3_exercise1(data,vector_initial_guesses)
%Explanation
%Using least square of residuals method Oosterhuis_assignment3_exercise1() 
%gives an function which is an approximation of some data.
%
%Function takes data (form = nx2 matrix: column1 = 
%linespace(0,n,10*n), column2=y) and a row vector of m
%initial guesses for the exponents lambda_i.
%Function output is 1) row vector vector_lambda_new with m values of 
%lambda_i's, 2) a vector vector_c with values for the C_i's
%and 3) a number which is the residue of solution (sum of square of 
%elementswise residues).
%Graphic output is a plot of the data and a function f that is an
%approximation of a function of the data, computed using least square
%method.
%
%Using initial guesses for lambda, Oosterhuis_assignment3_exercise1()
%calculates values for vector_c such that A * C = Y, where A
%is n*m matrix with elements exp(lambda(m)*x(n), C is vector of constants
%and Y is dependent variables of dataset. Using this C, new values are
%calculated for lambdas such that sum of elementwise squares of differences 
%between A * C and data Y are minimalized. Using this new lambdas, new
%values for C are computed as well, such that A*C=Y, where A does now
%depend on new lambdas.

%Examples for input:
%testinput: Oosterhuis_exercise1_1(data_test,[-2,-1.5,-2])
%example input:
%Oosterhuis_assignemnt3_exercise1(data3,[0.1,0.2,0.3,-0.2]) %note the negative lambda
%Oosterhuis_assignment3_exercise1(data2,[0.1,0.2,0.3])
%Oosterhuis_assignment3_exercise1(data1,[0.1,0.2])
%

%read data and make vector of independent and dependent variables
vector_x = data(1:length(data))' ;%independent variables
vector_y = data(1+length(data):2*length(data))' ; %dependent variables

%plot data
plot(vector_x,vector_y,'.')
%hold on to plot solution after it's computed
hold on
 
%use least sqaure method
row_vector_lambda = vector_initial_guesses ;
vector_c = zeros(1,length(row_vector_lambda)) ;

%
%make matrix A_func, vector_c_func, vector_residue_func and residue_func 
%to calculate as a function of lambda respectively a matrix A, vector_c, 
%vector of elementswise difference between solution and data and a number 
%that sums the squares of these difference.
%functions
A_func=@(lambda) exp(vector_x*lambda);
vector_c_func=@(lambda) A_func(lambda) \ vector_y ;
vector_residue_func =@(lambda) A_func(lambda) * vector_c_func(lambda) - vector_y ;
residue_func = @(lambda) sum(vector_residue_func(lambda).^2)  ;  

%use above defined functions to compute vector_lambda_new with new values based on
%vector_c and least square method
A = A_func(row_vector_lambda); %length(data)*length(row_vector_lambda) matrix with elements exp(lambda(m)*x(n)
%compute c using A and vector_y, using initial guesses for lambdas
vector_c = vector_c_func(row_vector_lambda);
%using vector_c, compute new lambdas, such that residue (is sum of squared
%elementswise differences) is minimal
vector_lambda_new = fminsearch(residue_func,row_vector_lambda);
%compute new minimalized residue, using new lambdas
residue_vector_lambda_new = residue_func(vector_lambda_new);
%compute A * vector_C, using new lambdas
vector_c_new = vector_c_func(vector_lambda_new);
solution = A_func(vector_lambda_new) * vector_c_new;

%plotting, continuing from plot of data at beginning of function
%plot solution against independent variable x
plot(vector_x,solution)
xlabel('x');
ylabel('y');
title('Data points and approximation of data')
hold off

end
