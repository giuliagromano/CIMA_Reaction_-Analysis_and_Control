%% CIMA Control Info - LQ and FBL

% Infty-Norm of control input
uinf = norm(out.u.signals.values,inf);

%Settling Time 1%
x1 = out.state.signals.values(:,1); 
x1_ref = out.ref.signals.values;   
x1_error = abs(x1 - x1_ref);        
threshold = 0.01 * abs(x1_ref(end));        %  1%
settling_index = find(x1_error > threshold, 1, 'last'); 
if isempty(settling_index)
    settling_time = 0;  
else
    settling_time = out.state.time(settling_index);
end

%Steady-State Error
e_infty = abs(x1(end) - x1_ref(end));
e_infty_perc = (e_infty / abs(x1_ref(end))) * 100;  

% Overshoot 
x1_peak = max(x1);  
overshoot = ((x1_peak - x1_ref(end)) / abs(x1_ref(end))) * 100;  
overshoot = max(overshoot, 0); 

% Display results
fprintf('Settling Time (1%% criterion): %.4f s\n', settling_time);
fprintf('Overshoot (Percentage): %.2f%%\n', overshoot);
fprintf('Steady-State Error (Percentage): %.2f%%\n', e_infty_perc);
fprintf('Steady-State Error: %.4f\n', e_infty);
fprintf('Norm_infty Control Input: %.4f\n', uinf);

%% %% CIMA Control Info - SM

% Infty-Norm of control input
uinf = norm(out.u.signals.values,inf);

%Settling Time 1%
x1 = out.state.signals.values(1,:)'; 
x1_ref = out.ref.signals.values;   
x1_error = abs(x1 - x1_ref);        
threshold = 0.01 * abs(x1_ref(end));        % 1 %
settling_index = find(x1_error > threshold, 1, 'last'); 
if isempty(settling_index)
    settling_time = 0;  
else
    settling_time = out.state.time(settling_index);
end

%Steady-State Error
e_infty = abs(x1(end) - x1_ref(end));
e_infty_perc = (e_infty / abs(x1_ref(end))) * 100;  

% Overshoot 
x1_peak = max(x1);  
overshoot = ((x1_peak - x1_ref(end)) / abs(x1_ref(end))) * 100;  
overshoot = max(overshoot, 0); 

% Display results
fprintf('Settling Time (1%% criterion): %.4f s\n', settling_time);
fprintf('Overshoot (Percentage): %.2f%%\n', overshoot);
fprintf('Steady-State Error (Percentage): %.2f%%\n', e_infty_perc);
fprintf('Steady-State Error: %.4f\n', e_infty);
fprintf('Norm_infty Control Input: %.4f\n', uinf);
