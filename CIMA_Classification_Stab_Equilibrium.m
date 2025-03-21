%% Classification and Stability of Equilibrium Points
% close all;
% clear all;
% clc;
%% Parameters
a=10;

% Bifurcation
step = 0.1;
b_vec = 0:step:6; 
lungh = length(b_vec);

%pre-allocation of vectors
delta = zeros(1, lungh); 
trac = zeros(1, lungh); 
trac2_4delta = zeros(1, lungh);  

% Equilibrium and Stability
for i = 1:lungh
    b = b_vec(i);

     % Equilibrium
    x1_eq = a/5;  
    x2_eq = 1+a^2/25;            

    syms x1 x2 

    % Vector field
    f = [ a-x1-4*x1*x2/(1+x1^2);               
          b*x1*(1-x2/(1+x1^2))];                 
        
    % Jacobian
    J = jacobian(f, [x1, x2]);
    J_eq = double(subs(J, [x1,x2], [x1_eq, x2_eq]));

    % Determinant
    delta(i) = det(J_eq);
    % Trace
    trac(i) = trace(J_eq);
    % trace^2 - 4*det(J_eq)
    trac2_4delta(i) = trac(i)^2 - 4 * delta(i);
end

figure()
hold on
plot(b_vec, delta, 'LineWidth', 2)
yline(0, '--k', 'LineWidth', 1.5) 
xlabel('$b$', 'Interpreter', 'latex')
ylabel('$\Delta$', 'Interpreter', 'latex')
grid on
set(gca,'FontSize',18)

figure()
hold on
plot(b_vec, trac, 'LineWidth', 2)
yline(0, '--k', 'LineWidth', 1.5) 
xlabel('$b$', 'Interpreter', 'latex')
ylabel('$\tau$', 'Interpreter', 'latex')
grid on
set(gca,'FontSize',18)

figure()
hold on
plot(b_vec, trac_del, 'LineWidth', 2)
yline(0, '--k', 'LineWidth', 1.5) 
xlabel('$b$', 'Interpreter', 'latex')
ylabel('$\tau^2 - 4\Delta$', 'Interpreter', 'latex')
grid on
set(gca,'FontSize',18)
