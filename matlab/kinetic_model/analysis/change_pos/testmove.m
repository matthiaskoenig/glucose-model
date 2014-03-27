f=figure(1)
sh=subplot(1,1,1)
p=plot([1 2 3],[2 3 4])
p2=get(p,'Parent') %sh=p2
a=ChangePos(p2,0)                           % get position of graph
b=ChangePos(p2,[0 0 -0.20 -0.20],0)         % shift position (0 drittes)
%c=ChangePos(p2,[0.05 0.05 0.95 0.95],1)     % set position to coordinates 