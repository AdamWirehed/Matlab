GranData=load('GranData.txt');

L=zeros(length(GranData),1);
TD=zeros(length(GranData),1);
RD=zeros(length(GranData),1);
V=zeros(length(GranData),1);
VN=[];
for n=1:length(GranData)
    L(n,1)=GranData(n,1);
    TD(n,1)=GranData(n,2);
    RD(n,1)=GranData(n,3);
    if L(n,1)~=0 && TD(n,1)~=0 && RD(n,1)~=0
        V(n,1)=L(n,1)*pi/12*((TD(n,1).^2+TD(n,1)*RD(n,1)+(RD(n,1)).^2));
        VN=[VN V(n,1)];
    end
end

%%
Med=sum(VN)/length(VN);
StV=std(VN);
fprintf('Medelvolymen på stockarna är %0.3f m3 och standardavvikelsen är %0.3f m3 \n',Med,StV);
%%
figure;
bar([V]);
hold on
plot([0,length(V)],[Med,Med],'-k','LineWidth',2);
plot([0,length(V)],[Med+StV,Med+StV],'-c','LineWidth',1);
plot([0,length(V)],[Med-StV,Med-StV],'-r','LineWidth',1);
axis tight
ylabel('Volym [m3]');
xlabel('Stock nr x');
legend('Volym','Medelvärde','+Stdavv.','-Stdavv.','Location','Best');