%% Jason Kootsher
% Independent Study: Distributed Kalman Filtering
% Script: Executes the Micro (Distributed) Kalman Filter algorithm

%% Initialization
n = 200; % Nodes
t = 12; dt = .02; T = t/dt;

I = eye(2); Q = 25*I;
H = I; P = I; S = zeros(2);
[A,B] = state.params(dt);

r = zeros(1,n); y = zeros(2,T);
xhat = zeros(2,T); xbar = zeros(2,T); error = zeros(2,T);

%% State calculation
x = state.euler(dt,T);

%% Generate the measured states and partial covariances
for i = 1:n   
    r(i) = 100*sqrt(i);
    R = r(i)*I;
    
    S = S + H'*(R\I)*H;
    
    z = state.measure(T,x,r(i));
    y = y + H'*(R\I)*z;
end

S = S/n; y = y/n;

%% MKF Algorithm
for k = 1:T
    M = ((n*P)\I + S)\I;
    xhat(:,k) = xbar(:,k) + M*(y(:,k) - S*xbar(:,k));

    P = A*M*A' + B*n*Q*B';
    xbar(:,k+1) = A*xhat(:,k);
    
    error(:,k) = x(:,k)-xhat(:,k);
end

MKF = xhat;
MKFe = error;