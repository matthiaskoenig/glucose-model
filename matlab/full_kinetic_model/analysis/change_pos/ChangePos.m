function [ output_args ] = ChangePos(xh, k, varargin)
%% ChangePos changes the Position of thing with handle by k
% varargin takes a 1 for set pos to coordinates all other values shift position by k
% falls k=0 dann GetPos
% user must know that xh has feature position
% if neccessary use 
% user must know that dimension of position

% xh is handle
% plot has no handle.position (subplot or parent of plot needed)
if nargin>3
    output_args=varargin;
    return;
end;
if(max((k.^2))==0)

     oldp=get(xh,'Position');
     output_args=oldp;
     return;
end;
if nargin==3
    if varargin{1}==1
        set(xh,'Position',k);
        output_args=k;
        return;
    end;
end;
oldp=get(xh,'Position');
set(xh,'Position',oldp+k);
output_args=oldp+k;
end