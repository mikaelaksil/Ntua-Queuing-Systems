pkg load queueing

clc;
clear all;
close all;

a = 0.001:0.001:0.999;
lambda = 10000;

mu1 = (15 * 10^6) / (128 * 8);
mu2 = (12 * 10^6) / (128 * 8);

lambda1 = a.*lambda;
lambda2 = (1-a).*lambda;

[U1 R1 Q1 X1 P1] = qsmm1(lambda1,mu1);
[U2 R2 Q2 X2 P2] = qsmm1(lambda2,mu2);

R = a.*R1 + (1-a).*R2;

figure(1);
plot(a,R,'r',"linewidth",2);
title("Average waiting time E(T)","fontsize", 15);
xlabel("Probability of a","fontsize", 15);
ylabel("Average waiting time (sec)","fontsize", 15);

[minR,position] = min(R);
display(minR);
display(position);
