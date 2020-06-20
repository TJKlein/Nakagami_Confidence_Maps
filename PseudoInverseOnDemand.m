function [Lstar, xi] = PseudoInverseOnDemand(col, R, idx, xi)
% NOTE:
% prior to cholesky decomposition, the matrix A = R'R has to be permuted to
% minimize the non-zero banding, i.e. using r = symrcm(A), such that
% cholesky is performed on chol(A(r,r)).
threshold = 1.0e-3;
N = size(R,1);

n = (N*size(R,2))*1e9;

%ei = zeros(N,1);
%e = ones(1,N);
%ei(col)=1;

fac = 1/n;

yi = -ones(N,1)*fac;
yi(col) = 1-fac;


if ( nargin < 4)
xi=R'\(R\yi);

end

if ( nargin < 3 )

idx = find(abs(xi) > threshold);
end


tmp = zeros(1,length(idx));

%for i=1:length(idx)
 i=1;   
%Lstar = ((eye(60)-e'*e/n)*xi)';
v = -ones(1,N)/n;
v(idx(i)) = 1 - 1/n;
tmp(i) = v * xi;

%end

if ( nargin < 3)
Lstar = zeros(N,1);
Lstar(idx) = tmp;
else
    Lstar = tmp;
end
