function Sp = SudokuSolver_AC3(Start,~,Reset,Start_FC_MRV,Start_BTS,t,D,Nstep,Next,Solve,R)

%% Initializing

R.String = '0';
S = t.Data;
Reset.Enable = 'on';
Next.Enable = 'on';
Solve.Enable = 'on';
t.ColumnEditable = false;

%% Check the domain of each cell: 3 level AllDiff

curDom = findDom(S);

%% formSList Function

sList = sortrows(curDom,3);

%% Calculating Unassigned Cells

UnassCells = size(sList,1);
UAC = num2str(UnassCells);
inst = strcat('Unassigned cells in this puzzle: ',UAC,' Cells');
D.String = inst;
Start.Enable = 'off';
Start_FC_MRV.Enable = 'off';
Start_BTS.Enable = 'off';
pause(0.1)

uiwait;

%% nextAss Function

BtS = [];
Sp = S;
cntr = 0;
Btcntr = 0;
inst = D.String;

while sum(size(curDom))~=0
    cntr = cntr+1;
    
    if sList(1,3)==0
        Btcntr = Btcntr+1;
        inst = sprintf('Backtracking:%d\nIteration: %d\n%s',Btcntr,cntr,inst);
        D.String = inst;
        pause(0.05)
        Sp = BtS(size(BtS,1)-8:end,:);
        BtS = BtS(1:size(BtS,1)-9,:);
        curDom = findDom(Sp);
        sList = sortrows(curDom,3);
        asd = find(sList(1,:));
        sList(1,asd(end)) = 0;
        sList(1,3) = sList(1,3)-1;
        sList = sortrows(sList,3);
    else
        asd = find(sList(1,:));
        ass = sList(1,asd(end));
        if sList(1,3)>1
            BtS = [BtS; Sp];
        end
        Sp(sList(1,1),sList(1,2)) = ass;
        [Sp, curDom] = AC3(Sp);
        if sum(size(curDom))==0
            break
        else
            sList = sortrows(curDom,3);
        end
        inst = sprintf('Enforcing Arc Consistency...\nAssigning: %d to cell: %d%d\n%s',ass,sList(1,1),sList(1,2),inst);
        D.String = inst;
        pause(0.05)
    end
    t.Data = Sp;
    if strcmp(Nstep.String,'1')
        Nstep.String = '2';
        waitfor(Nstep,'String');
    end
    if strcmp(R.String,'2')
        return
    end
end

t.Data = Sp;
ddata = sprintf('Number of Iterations: %d\nNumber of Backtracks:%d\n%s\n%s\n%s',...
    cntr,Btcntr,DispMat(Sp),'Solution Found',inst);
D.String = ddata;
D.Enable = 'on';

end
