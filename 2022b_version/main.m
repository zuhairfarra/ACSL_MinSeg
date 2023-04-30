% Define state space model matrices

A = [0 1 0 0;...
     62.1 -44.6 0 2120;...
     0 0 0 1;...
     -6.11 10.2 0 -485];

B = [0;...
     -90;...
     0;...
     20.6];

C = [1 0 0 0;...
     0 1 0 0;...
     0 0 1 0;...
     0 0 0 1];

D = [0;0;0;0];

Q = [1000 0 0 0;...
     0 100 0 0;...
     0 0 1 0;...
     0 0 0 1];

R = 1;

sys_ss = ss(A,B,C,D);

K = lqr(sys_ss,Q,R)
Rw = 0.0216;
TS = 0.030;

%% Plotting data logged from Simulink model
figure(1)
subplot(1,2,1)
plot(tout,angles_no_bias)
grid on
ylabel("Gyro Angle Measurements (rad)")
xlabel("Time (s)")
title("Gyro with no bias compensation")

subplot(1,2,2)
plot(tout,gyro_angles)
grid on
ylabel("Gyro Angle Measurements (rad)")
xlabel("Time (s)")
title("Gyro with bias compensation")

figure(2)
subplot(1,3,1)
plot(tout,gyro_angles_deg)
grid on
ylabel("Gyro Angle Measurements(deg)")
xlabel("Time (s)")
title("Gyro Angles")

subplot(1,3,2)
plot(tout,accel_angles_deg)
grid on
ylabel("Accelerometer Angle Measurements(deg)")
xlabel("Time (s)")
title("Accelerometer Angles")

subplot(1,3,3)
plot(tout,complimentary_angles_deg)
grid on
ylabel("Complementary Angle Measurements(deg)")
xlabel("Time (s)")
title("Complementary Angles")

figure(3)
plot(tsim,ref,'b'); hold on; plot(tsim,readings,'r');
grid on
ylabel("Angle (deg)")
xlabel("Time (s)")
title("Closed Loop DC Motor Position Control")

figure(4)
plot(tout,encoder_pos,'b');
grid on
ylabel("Angle (deg)")
xlabel("Time (s)")
title("Manual Position Test")
%%

figure(5)
subplot(2,2,1)
plot(tout,state_alpha)
grid on
ylabel("Pendulum angle(deg)")
xlabel("Time(s)")
title("Pendulum angle vs time")

subplot(2,2,2)
plot(tout,state_alphadot)
grid on
ylabel("Pendulum angular velocity(deg/s)")
xlabel("Time(s)")
title("Pendulum angular velocity vs time")

subplot(2,2,3)
plot(tout,state_x)
grid on
ylabel("Robot translational position(m)")
xlabel("Time(s)")
title("Translational position vs time")

subplot(2,2,4)
plot(tout,state_xdot)
grid on
ylabel("Robot translational velocity(m)")
xlabel("Time(s)")
title("Translational velocity vs time")

figure(6)
yyaxis left
plot(tout,state_alpha,'b')
ylabel("Pendulum angle(deg)")
hold on
yyaxis right
plot(tout,~Motor_Cutoff,'r')
ylabel("Motor cutoff signal")
ylim([0 1.1])
grid on
xlabel("Time(s)")
title("Pendulum angle & Motor cutoff")