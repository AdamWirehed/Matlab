function y=Extra1_21(MaxError)
n=1;
e=1;
while abs(e-exp(1))>MaxError
    e=(1-1/n).^(-n);
    n=n+1;
end
format long
y=[abs(e-exp(1));e];