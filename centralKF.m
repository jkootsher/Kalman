%% Jason Kootsher
% Independent Study: Distributed Kalman Filtering
% Script: Executes the Central Kalman Filter algorithm

%% Initialization
n = 200; % Nodes
t = 12; dt = .02; T = t/dt;

I = eye(2); Q = 25*I;
H = I; P = I; R = (1/n)*I;
[A,B] = state.params(dt);

r = zeros(1,n); y = zeros(2,T);
xhat = zeros(2,T); xbar = zeros(2,T); error = zeros(2,T);

%% State calculations
x = state.euler(dt,T);
z = state.measure(T,x,1);

%% CKF Algorithm
for k = 1:T
    M = (P + H'*(R\I)*H)\I;
    K = M*H'*(R\I);
    xhat(:,k) = xbar(:,k) + K*(z(:,k) - H*xbar(:,k));

    P = A*M*A' + B*Q*B';
    xbar(:,k+1) = A*xhat(:,k);
    
    error(:,k) = x(:,k)-xhat(:,k);
end

CKF = xhat;
CKFe = error;