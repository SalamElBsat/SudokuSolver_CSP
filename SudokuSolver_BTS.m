function Sp = SudokuSolver_BTS(Start,~,Reset,Start_FC_MRV,Start_AC3,t,D,Nstep,Next,Solve,R)

%% Initializing


R.String = '0';
S = t.Data;
Reset.Enable = 'on';
Next.Enable = 'on';
Solve.Enable = 'on';
t.ColumnEditable = false;

%% Calculating Unassigned Cells

Sp = S;
UAC = UACells(S);
UAC = [UAC' ; ones(1,size(UAC,1))]';
UnassCells = size(UAC,1);
UAssC = num2str(UnassCells);
inst = strcat('Unassigned cells in this puzzle: ',UAssC,' Cells');
D.String = inst;
Start.Enable = 'off';
Start_FC_MRV.Enable = 'off';
Start_AC3.Enable = 'off';
pause(0.1)

uiwait;

%% nextAss Function

i = 1;
cntr = 0;
Btcntr = 0;
inst = D.String;

while i <= size(UAC,1)
    cntr = cntr+1;
    CellDom = cellDom(Sp,UAC(i,1),UAC(i,2));
    if ((UAC(i,3)>size(CellDom,2)) || isempty(CellDom))
        Btcntr = Btcntr+1;
        inst = sprintf('Backtracking\nIteration: %d\n%s',cntr,inst);
        %inst = sprintf('Backtracking\nIteration: %d\n%s',cntr,inst);
        D.String = inst;
        pause(0.05)
        Sp(UAC(i-1,1),UAC(i-1,2)) = 0;
        UAC(i-1,3) = UAC(i-1,3)+1;
        UAC(i,3) = 1;
        i = i-1;
        continue
    end
    ass = CellDom(UAC(i,3));
    Sp(UAC(i,1),UAC(i,2)) = ass;
    inst = sprintf('Assigning: %d to cell: %d%d\n%s',ass,UAC(i,1),UAC(i,2),inst);
    D.String = inst;
    t.Data = Sp;
    pause(0.05)
    i = i+1;
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

return