function F=FFibA(n)
if n==1||n==2
    F=1;
else
    F=FFibA(n-1)+FFibA(n-2)
end