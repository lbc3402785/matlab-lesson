function [x,w]=GaussLegendre(n,method) 
% n: total number of points
% x and w are the Gauss nodes and weights
P=zeros(n+2); % coefficients of n+1 Legendre polynomials
b=zeros(n+1,1); % vector on right side for undetermined coefficients
w=zeros(n+1,1); % weights for the quadrature
P([1,2],1)=1; % coefficients of p_0(x)=1 and p_1(x)=x in first 2 rows
for k=1:n % recursively generat remaining p_2(x) to p_{n+1}(x)
    P(k+2,1:k+2)=((2*k+1)*[P(k+1,1:k+1) 0]-k*[0 0 P(k,1:k)])/(k+1);
end
% (i+1)th row of P contains coefficients of p_i(x) (i=0,...,n)
x=sort(roots(P(n+2,1:n+2))) % find all n+1 roots of p_{n+1}(x) (Gauss points)
switch method
    % Method 1
    case 1
        dp=polyder(P(n+2,:)); % coefficients of p'_{n+1}(x)
        dp
        for i=1:n+1
            t=x(i); % p'_n(x_i)
            t=polyval(dp,t);
            w(i)=2/(1-x(i)^2)/t/t; % weights for the quadrature
            fprintf('w[%d]=%f\n',i,w(i));
        end
    % method of undetermined coefficients: f(x)=x^k
    case 2
        A=zeros(n+1);
        for k=1:n+1
            A(k,:)=x.^(k-1); % matrix on left side
            b(k)=(1-(-1)^k)/k; % vector on right side
        end
        w=A\b;
        
    % Method of undetermined coefficients: f(x)=p_k(x)
    case 3
        A=zeros(n+1);
        for k=1:n+1 % evaluate p_0(x)...p_{n-1}(x) at roots of p_n(x)
            A(k,:)=polyval(P(k,1:k),x); % matrix on left side
        end
        b=[2;zeros(n,1)]; % vector on right side
        disp(b)
        w=A\b; % find all weights   
end
end
