% M/M/1/10 simulation. We will find the probabilities of the first states.
% Note: Due to ergodicity, every state has a probability >0.

clc;
clear all;
close all;

rand('seed',1);

lambdaAll = [1,5,10];
for i = lambdaAll
    clear to_plot;
    arrivals = [0,0,0,0,0,0,0,0,0,0,0]
    total_arrivals = 0; % to measure the total number of arrivals
    current_state = 0;  % holds the current state of the system
    previous_mean_clients = 0; % will help in the convergence test
    index = 0;
    mu = 5;
    threshold = (i)/((i) + mu); 

    transitions = 0; 
  %debugging 
  %my_i = 0
  %debug_array = [];
   
   while  transitions >= 0 % && transitions < 30
        transitions = transitions + 1; 
        
      %{   
       my_i = my_i + 1
        if 0 < my_i < 31 && current_state > 0
            debug_array(my_i,1) = my_i;
            debug_array(my_i,2) = current_state;
            debug_array(my_i,3) = arrivals(current_state);
        endif
      %} 
      
        if mod(transitions,1000) == 0 % check for convergence every 1000 transitions steps
            index = index + 1;
            for j=1:1:length(arrivals)
                P(j) = arrivals(j)/total_arrivals; % calcuate the probability of every state in the system
            endfor
            
            mean_clients = 0; % calculate the mean number of clients in the system
            for j=1:1:length(arrivals)
                mean_clients = mean_clients + (j-1).*P(j);
            endfor
            
            to_plot(index) = mean_clients;
                
            if abs(mean_clients - previous_mean_clients) < 0.00001 || transitions > 1000000 % convergence test
            break;
            endif
            
            previous_mean_clients = mean_clients;
            
        endif
        
        random_number = rand(1); 
        if current_state == 0 || random_number < threshold % arrival
            
           %{ 
            if 0 < my_i < 31
                debug_array(my_i,4) = 1
            endif 
            %}
            
            total_arrivals = total_arrivals + 1;
            
           % x = arrivals(current_state + 1) + 1
           % arrivals(current_state + 1) = x; % increase the number of arrivals in the current state
          
          arrivals(current_state + 1) = arrivals(current_state + 1) + 1; 
           if (current_state != 10) 
                current_state = current_state + 1;
            endif
            else % departure
            %{
            if 0 < my_i < 31
                debug_array(my_i,5) = 1
            endif
            %}
            
            if current_state != 0 % no departure 
            current_state = current_state - 1;
            endif
        endif
    endwhile
   
   % for j=1:1:length(arrivals)
   %    display(P(j));
   % endfor
 
    figure(1);
    plot(to_plot,"r","linewidth",1.3);
    title(strjoin({"Average number of clients in the M/M/1/10 queue: Convergence for lambda = ",num2str((i))},""));
    xlabel("transitions in thousands");
    ylabel("Average number of clients");
    
    
    figure(2);
    bar(0:1:(length(arrivals)-1),P,'b',0.4);
    title(strjoin({"Probabilities for lambda = ",num2str((i))},""));
    
    
  
    
endfor
