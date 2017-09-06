function Resetf(Reset,~,Start_FC_MRV,Start_BTS,Start_AC3,Next,Solve,Nstep,t,S,D,R)

R.String = '2';
Nstep.String = '0';
pause(0.2)
Start_FC_MRV.Enable = 'on';
Start_AC3.Enable = 'on';
Start_BTS.Enable = 'on';
Next.Enable = 'off';
Solve.Enable = 'off';
Reset.Enable = 'off';
D.Enable = 'off';
t.Data = S;
t.ColumnEditable = true;
D.String = 'The steps of Solving will be printed here';

end

