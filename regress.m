function [b,bint,r,rint,stats] = regress(y,X,alpha)
%REGRESS Performs multiple linear regression using least squares.
%	b = REGRESS(y,X) returns the vector of regression coefficients, B.
%	Given the linear model: y = Xb, 
%	(X is an nxp matrix, y is the nx1 vector of observations.) 
%	[B,BINT,R,RINT,STATS] = REGRESS(y,X,alpha) uses the input, ALPHA
%	to calculate 100(1 - ALPHA) confidence intervals for B and the 
%	residual vector, R, in BINT and RINT respectively. 
%	The vector STATS contains the R-square statistic along with the F 
%	and p values for the regression.

%	References:
%	   [1] Samprit Chatterjee and Ali S. Hadi, "Influential Observations,
%	   High Leverage Points, and Outliers in Linear Regression",
%	   Statistical Science 1986 Vol. 1 No. 3 pp. 379-416. 
%	   [2] N. Draper and H. Smith, "Applied Regression Analysis, Second
%	   Edition", Wiley, 1981.

%	B.A. Jones 3-04-93
%	Copyright (c) 1993 by The MathWorks, Inc.
%	$Revision: 1.4 $  $Date: 1993/10/04 12:26:29 $
 X2 = allData{1}{3};y=X2
    Y2 = allData{1}{4};

    ArgumentsMat1 = [X1.^2  Y1.^2 X1.*Y1 X1 Y1 ones(length(X1),1)];
X=ArgumentsMat1;

if  nargin < 2,              
    error('REGRESS requires at least two input arguments.');      
end 

if (nargout >= 2 & nargin == 2), 
    alpha = 0.05; 
end

% Check that matrix (X) and left hand side (y) have compatible dimensions
[n,p] = size(X);
[n1,collhs] = size(y);
if n~=n1, 
    error('The number of rows in Y must equal the number of rows in X.'); 
end 

if collhs ~= 1, 
    error('Y must be a vector, not a matrix'); 
end

% Find the least squares solution.
[Q R]=qr(X);
b = R\Q'*y;
