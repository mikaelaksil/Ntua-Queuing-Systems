addpath(pwd);
function result = erlang_iterative(ro,n)
  k=0;
  result = 1;
  while k<=n
    result = ro * result / (ro*result + k);
    k++
  endwhile
endfunction

display(erlang_iterative(1024,1024));
display(erlangb(1024,1024));
ro=200*23/60;
c=1:200;
for i=1:200
  erl(i)=erlang_iterative(ro,i)
endfor
figure(1);
hold on;
title("Probabilities per state")
xlabel("States")
ylabel("Probabilities")
plot(c,erl,"b","linewidth",1.5);
grid on;
hold off;
P=1;
lines=0;
while(P>0.01)
P=erlang_iterative(ro,lines);
lines++
endwhile
display(lines);
