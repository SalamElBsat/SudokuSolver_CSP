function Smat = DispMat(S)

Smat = '';
for i= 1:9
    Row = '';
    for j = 1:9
        Row = strcat(Row,int2str(S(i,j)),'...');
    end
    Smat = sprintf('%s\n%s',Smat,Row);
end

end
