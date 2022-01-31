pkg load queueing
addpath(pwd);

function result = erlang_factorial(ro,c)
  arithm=(ro^c)/factorial(c);
  paranom=0;
  k=0;
  while(k<=c)
  paranom+=(ro^k)/factorial(k);
  k++;
  endwhile
  result = arithm/paranom;
endfunction
display(erlang_factorial(1024,1024));
display(erlangb(1024,1024));