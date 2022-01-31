pkg load statistics

clc;
clear all;
close all;

k = 0:0.00001:8
exp1=exppdf(k,0.5)
exp2=exppdf(k,1)
exp3=exppdf(k,3)

figure(1,"graphicssmoothing","off")
hold on;
plot(k,exp1,"r","linewidth",1.3)
plot(k,exp2,"g","linewidth",1.3)
plot(k,exp3,"b","linewidth",1.3)

hold off;

title("Probability Density Function of Exponential Process")
xlabel("k values")
ylabel("Probability")
legend("1/ë=0.5","1/ë=1","1/ë=3")


exp5=expcdf(k,0.5)
exp6=expcdf(k,1)
exp7=expcdf(k,3)

figure(2,"graphicssmoothing","off")
hold on;
plot(k,exp5,"r","linewidth",1.3)
plot(k,exp6,"g","linewidth",1.3)
plot(k,exp7,"b","linewidth",1.3)

hold off;

title("Cumulative Distribution Function of Exponential Process")
xlabel("k values")
ylabel("Probability")
legend("1/ë=0.5","1/ë=1","1/ë=3")


exp4=expcdf(k,2.5)
p1=1-exp4(30000);
display("Pr(X>30000) =");
display(p1);
p2=(1-exp4(50000))/(1-exp4(20000));
display("Pr(X>50000|X>20000) =");
display(p2);

d=exprnd(0.2,1,100);
time=zeros(1,100);
time(1)=d(1);
for i=2:100
  time(i)=time(i-1)+d(i);
endfor
 

figure(3) 
stairs(1:100, time);
title("Poisson Process Counting")

E = 100/time(100)

for n = [200,300,500,1000,10000]
d=exprnd(0.2,1,n);
time=zeros(1,n);
time(1)=d(1);
for i=2:n
  time(i)=time(i-1)+d(i);
endfor
 
mean=n/time(n)
endfor