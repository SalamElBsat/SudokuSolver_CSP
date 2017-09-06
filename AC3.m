function [S , curDom] = AC3(S)

curDom = findDom(S);

if isempty(curDom)
    return
end

while any(curDom(:,3)==1)
    ind = find(curDom(:,3)==1);
    
    for iind = ind'
        S(curDom(iind,1),curDom(iind,2)) = curDom(iind,4);
    end
    curDom = findDom(S);
    
    if isempty(curDom)
        break
    end
end

return