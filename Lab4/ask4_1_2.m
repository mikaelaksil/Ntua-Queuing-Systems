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