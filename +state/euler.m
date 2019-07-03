function x = euler(epsilon,k)
% EULER integration method
x = zeros(2,k);
x(:,1) = [15;-10];
[A,B] = state.params(epsilon);

for n = 1:k
    w = [random('norm',0,5);random('norm',0,5)];
    x(:,n+1) = A*x(:,n) + B*w;
end

end

