%% Control Synthesys
close all;
clear all;
clc;

%% Parameters
a= 10;
b= 2;       %unstable with LC
%b= 5;       %stable 

% Equilibrium
x1_eq = a/5;  
x2_eq = 1+a^2/25;            
Eq =[x1_eq;x2_eq];

% Initial condition near the equilibrium point
x0 = [x1_eq+0.5; x2_eq+0.2];

syms x1 x2 
% Vector fields 
f = [ a-x1-4*x1*x2/(1+x1^2);               
      b*x1*(1-x2/(1+x1^2))];                 
    
% Jacobian
J = jacobian(f, [x1, x2]);
J_eq = double(subs(J, [x1,x2], [x1_eq, x2_eq]));

%% LQ Control

A = J_eq;
B=[1;0];
C=eye(2);
D=zeros(2,1);

%Integrator
Aaug=[A zeros(2,1);
      -C(1,:) 0];
Baug=[B;0];
Caug=[C zeros(2,1)];
Daug=D;

Q = diag([800,10,10000]);
R = 100;

rank(ctrb(Aaug,Baug))
rank(obsv(Aaug,sqrt(Q)))

% LQ control parameters
[K,S,P] = lqr(Aaug,Baug,Q,R);
Kp=K(1:2);
Ki=K(3);