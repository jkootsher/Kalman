function z = measure(k,x,r)
% Calculate the measured state from 'truth'
H = eye(2);
z = zeros(2,k);

for n = 1:k
    v = [random('norm',0,sqrt(r));random('norm',0,sqrt(r))];
    z(:,n) = H*x(:,n) + v;
end
end

