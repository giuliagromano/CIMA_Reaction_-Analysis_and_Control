%% Control Synthesis Plot
% close all;
% clear all;
% clc;

%% Open Loop  
figure;
hold on;
plot(out.tout, out.x_openloop.signals.values(:,1)', 'b', 'LineWidth', 2);
plot(out.tout, out.x_openloop.signals.values(:,2)', 'r', 'LineWidth', 2);
xlabel('Time [s]', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Concentration', 'Interpreter', 'latex', 'FontSize', 14);
legend('$x_1$','$x_2$', 'Interpreter', 'latex', 'Location', 'best','FontSize', 16)
title('System trajectories with $b=2$', 'Interpreter', 'latex', 'FontSize', 18);
grid on;
set(gca, 'FontSize', 24)

%% Control plot - LQ and FBL
figure()
hold on
plot(out.state.time,out.state.signals.values(:,1)', 'Color', [0, 0.4, 0.8], 'LineWidth', 2)
plot(out.state.time,out.state.signals.values(:,2)', 'Color', [0.85, 0.65, 0], 'LineWidth', 2)
plot(out.ref.time, out.ref.signals.values, '--r', 'LineWidth', 2);
legend('$x_1$','$x_2$', '$x_{1d}$', 'interpreter', 'latex','Location','northoutside','Orientation','horizontal', 'FontSize', 24)
xlabel('Time [s]', 'Interpreter', 'latex', 'FontSize', 14);
%ylabel('Concentration', 'Interpreter', 'latex', 'FontSize', 14);
set(gca, 'FontSize', 24)
grid

figure()
plot(out.error.time,out.error.signals.values, 'k','LineWidth', 2)
legend('$e(t)$', 'interpreter', 'latex','Location','northoutside','Orientation','horizontal', 'FontSize', 24)
xlabel('Time [s]', 'Interpreter', 'latex', 'FontSize', 14);
set(gca, 'FontSize', 24)
grid
ylim([-5 5])

% figure()
% hold on
% plot(out.state.time,out.state.signals.values(:,1)', 'Color', [0, 0.4, 0.8], 'LineWidth', 2)
% plot(out.ref.time, out.ref.signals.values, '--', 'Color', [0.85, 0.65, 0], 'LineWidth', 2);
% legend('$x_1$','$x_{1d}$', 'interpreter', 'latex','Location','northoutside','Orientation','horizontal', 'FontSize', 24)
% xlabel('Time [s]', 'Interpreter', 'latex', 'FontSize', 14);
% set(gca, 'FontSize', 24)
% grid
% ylim([0 7])

figure()
hold on
plot(out.u.time,out.u.signals.values, 'g','LineWidth', 2)
legend('$u(t)$', 'interpreter', 'latex','Location','northoutside','Orientation','horizontal', 'FontSize', 24)
xlabel('Time [s]', 'Interpreter', 'latex', 'FontSize', 14);
set(gca, 'FontSize', 24)
ylim([0 20])
grid

%% Control plot - SM
figure()
hold on
plot(out.state.time,out.state.signals.values(1,:), 'Color', [0, 0.4, 0.8], 'LineWidth', 2)
plot(out.state.time,out.state.signals.values(2,:), 'Color', [0.85, 0.65, 0], 'LineWidth', 2)
plot(out.ref.time, out.ref.signals.values, '--r', 'LineWidth', 2);
legend('$x_1$','$x_2$', '$x_{1d}$', 'interpreter', 'latex','Location','northoutside','Orientation','horizontal', 'FontSize', 24)
xlabel('Time [s]', 'Interpreter', 'latex', 'FontSize', 14);
%ylabel('Concentration', 'Interpreter', 'latex', 'FontSize', 14);
set(gca, 'FontSize', 24)
grid

figure()
plot(out.error.time,out.error.signals.values(1,:),'k', 'LineWidth', 2)
legend('$e(t)$', 'interpreter', 'latex','Location','northoutside','Orientation','horizontal', 'FontSize', 24)
xlabel('Time [s]', 'Interpreter', 'latex', 'FontSize', 14);
set(gca, 'FontSize', 24)
grid
ylim([-5 5])

figure()
hold on
plot(out.u.time,out.u.signals.values, 'g','LineWidth', 2)
legend('$u(t)$', 'interpreter', 'latex','Location','northoutside','Orientation','horizontal', 'FontSize', 24)
xlabel('Time [s]', 'Interpreter', 'latex', 'FontSize', 14);
set(gca, 'FontSize', 24)
ylim([0 20])
grid