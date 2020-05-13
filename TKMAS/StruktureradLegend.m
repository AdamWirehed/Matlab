clear variables

x=linspace(0,2*pi,1000);
a=2:4:10; %2,6,10
legendString=cell(length(a),1);

for n=1:length(a)
    
   y(n,:)=sin(a(n).*x);
   legendString{n}=sprintf('sin(%02i)',a(n)); %02="Zeropaddin" nollorframfor 2=storleken pa luckan
end
plot(x,y,'LineWidth',2);
legend(legendString,'Location','SouthWest');