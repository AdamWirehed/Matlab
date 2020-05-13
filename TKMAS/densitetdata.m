function densitet=densitetdata(material)
Data=importdata('materialdata.txt');

for n=3:length(Data.textdata)
    Check=char(Data.textdata{n,1})
    if material==Check==1
        densitet=Data.data(n-2);
        n=length(Data.textdata)+1;
        return
    elseif n==length(Data.textdata)
        error('Materialet du sökte finns inte i listan');
    end
end
