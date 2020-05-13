function [lambda,z]=extrem(f,x0,tol)

    [X,Y,Z]=meshgrid(-1:0.1:1);
    V=(1/3).*X.^3+Y.^2+Z.^2-4.*X.*Y+7.*X+8
    slice(X,Y,Z,V,x0(1),x0(2),x0(3));
      
    df1=@(x) (jacobi(f,x)');   %Gradient
    
    kp=newton(df1,x0,tol);  %Kritiska punkter    
    
    df2=@(x) (jacobi(df1,x)); %Hessematris
    
    H=df2(kp);
    
    lambda=eig(H);
    
    z=f(kp);
    