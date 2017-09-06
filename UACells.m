function UnAssCells = UACells(S)

UnAssCells = [];

for i = 1:size(S,1)
    for j = 1:size(S,2)
        if S(i,j) == 0
            UnAssCells = [UnAssCells; i j];
        end
    end
end
end