%% Jason Kootsher
% Independent Study: Distributed Kalman Filtering

%% Analysis
centralKF;
microKF;

%% Plots for CKF vs Actual
figure; 
plot(linspace(0,t, length(CKF(1,:))), CKF(1,:)'); hold;
plot(linspace(0,t, length(x(1,1:T))), x(1,1:T)');
title('Centered KF vs Actual');
xlabel('Time (s)'); ylabel('x position'); legend('CKF','Actual');

figure;
plot(linspace(0,t, length(CKF(2,:))), CKF(2,:)'); hold;
plot(linspace(0,t, length(x(2,1:T))), x(2,1:T)');
title('Centered KF vs Actual');
xlabel('Time (s)'); ylabel('y position'); legend('CKF','Actual');

%% Plots for CKF vs MKF
figure;
plot(linspace(0,t, length(CKF(1,:))), CKF(1,:)'); hold;
plot(linspace(0,t, length(MKF(1,:))), MKF(1,:)');
title('Centered KF vs Distributed KF');
xlabel('Time (s)'); ylabel('x position'); legend('CKF','DKF');

figure;
plot(linspace(0,t, length(CKF(2,:))), CKF(2,:)'); hold;
plot(linspace(0,t, length(MKF(2,:))), MKF(2,:)');
title('Centered KF vs Distributed KF');
xlabel('Time (s)'); ylabel('y position'); legend('CKF','DKF');

%% Plots for MKF vs Actual
figure;
plot(linspace(0,t, length(MKF(1,:))), MKF(1,:)'); hold;
plot(linspace(0,t, length(x(1,1:T))), x(1,1:T)');
title('Distributed KF vs Actual');
xlabel('Time (s)'); ylabel('x position'); legend('DKF','Actual');

figure;
plot(linspace(0,t, length(MKF(2,:))), MKF(2,:)'); hold;
plot(linspace(0,t, length(x(2,1:T))), x(2,1:T)');
title('Distributed KF vs Actual');
xlabel('Time (s)'); ylabel('y position'); legend('DKF','Actual');

%% Plots for CKF and MKF error
figure; probplot(CKFe'); legend('x','y');
figure; probplot(MKFe'); legend('x','y');

figure; histogram(CKFe);
title('Histogram of Error (CKF, x-xhat)');
xlabel('Data'); ylabel('Count');

figure; histogram(MKFe);
title('Histogram of Error (MKF,x-xhat)');
xlabel('Data'); ylabel('Count');
