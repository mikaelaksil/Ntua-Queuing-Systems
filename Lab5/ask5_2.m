addpath(pwd);
% erotima 2
function [r,is_ergodic] = intensities(lambda,mu)
r(1) = lambda(1)/mu(1);
r(2) = (lambda(2) + 2*lambda(1)/7)/mu(2);
r(3) = (4*lambda(1)/7)/mu(3);
r(4) = (3*lambda(1)/7)/mu(4);
r(5) = (lambda(2) + (4/7)*lambda(1))/mu(5);
is_ergodic = true;
for i=1:5 
  printf('Q%d: %f\n',i,r(i));
  is_ergodic  = is_ergodic && (r(i) < 1)
endfor
printf("Ergodicity: %d \n",is_ergodic)
endfunction


% erotima 3
function [R] = mean_clients(lambda,mu)
[r,is_ergodic] = intensities(lambda,mu);
R = r ./ (1-r);
for i=1:5 
  printf("Mean Clients at Q%d: %d\n",i,R(i))
endfor
endfunction

% erotima 4
l = 4;
lambda = [l,1];
mu = [6,5,8,7,6];
R = mean_clients(lambda,mu);
average = sum(R)/sum(lambda);
printf("Average service time: %d", average);

% erotima 6

max_lambda = 6
for i=1:99
   l = max_lambda*i/100;
   vec_lambda(i) = l;
   lambda = [l,1];
   mu = [6,5,8,7,6];
   vec_sum(i) = sum(mean_clients(lambda,mu))/sum(lambda);
endfor

figure(1);
plot(vec_lambda,vec_sum,"r","linewidth",2);
title("Mean Waiting Time","fontsize", 15);
xlabel('\lambda_1',"fontsize", 15);
ylabel("Waiting Time","fontsize", 15);
