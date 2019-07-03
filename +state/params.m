function [A,B] = params(epsilon)
% Return the paramters A and B
A = [0 -1;1 0]; B = eye(2);

% Taylor expanded matrices
A = eye(2) + (epsilon)*A + (1/2)*(epsilon^2)*A^2 + (1/6)*(epsilon^3)*A^3;
B = B*epsilon;
end

