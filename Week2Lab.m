%% ENGR 232 Matlab Assignment Week #2
% Version 1

%%
% *Equation: dy/dt = y * (1-y/3) where y(0) = 2*
%%
% *or re written dy/dt = y-y^2/3*
%%
% *with y(0)=2 from t=0 to t=5 and delta t=0.2* 


function week2
%% Euler's Method 
t=0:.2:5;
t2=t;
y=t;
y(1)=2;
n=1;
while(n<length(t))
    y(n+1)=y(n)+(y(n)*(1-y(n)/3))*.2;
    n=n+1;
end
hold on
plot(t,y,'r')

%% ODE solution
%define function
function dydt=func(t,y)
    dydt=y*(1-y/3);
end

[T,Y]=ode45(@func,t2,y(1)); 
plot(T,Y,'b*')


%% Analytical Solution
% using the given solution

t=0:.2:5;
y=t;
n=1;
while(n<=length(t))
    y(n)=3-(3/(2*exp(t(n))+1));
    n=n+1;
end
plot(t,y,'g')



%% Find the equilibrium then plot the result to the graph

equilibrium=max(y)
Etext=['The equilibrium value is ',num2str(equilibrium)];
text(3,2.2,Etext)

%% How does it take to go from 2.2 to 2.8?
a1=find(abs(y-2.2)<.1,1);
a2=find(abs(y-2.8)<.1,1);
time2double=t(a2)-t(a1);

Etext2=['The time to go from 2.2 to 2.8 is ',num2str(time2double)];
text(3,2.1,Etext2)
end



