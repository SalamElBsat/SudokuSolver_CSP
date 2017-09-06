function curDom = cellDom(S,i,j)

curDom = [];

tcurDom = [];
for row = 1:9
    if (S(row,j)~= 0 && ~ismember(S(row,j),tcurDom))
        tcurDom = [tcurDom S(row,j)];
    end
end
for col = 1:9
    if (S(i,col)~=0 && ~ismember(S(i,col),tcurDom))
        tcurDom = [tcurDom S(i,col)];
    end
end
if i<4
    rows = [1,2,3];
elseif i<7
    rows = [4,5,6];
else
    rows = [7,8,9];
end
if j<4
    cols = [1,2,3];
elseif j<7
    cols = [4,5,6];
else
    cols = [7,8,9];
end
for trow=rows(1):rows(end)
    for tcol=cols(1):cols(end)
        if (S(trow,tcol)~=0 && trow~=i && tcol~=j && ~ismember(S(trow,tcol),tcurDom))
            tcurDom = [tcurDom S(trow,tcol)];
        end
    end
end
rcurDom = [];
for ti = 1:9
    if ~ismember(ti,tcurDom)
        rcurDom = [rcurDom ti];
    end
end

curDom = rcurDom;

end