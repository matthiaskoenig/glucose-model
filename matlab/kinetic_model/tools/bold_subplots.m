%%%%%%%%%% 
function bold_subplots() 
% bold_subplots() 
% 
% Bolds all the titles, axis labels and axis ticks in all subplots
% 
H_axes = findobj(gcf,'type','axes');



for i=1:length(H_axes); 
  H=H_axes(i); 
  set(findobj(H, 'Type','Text'),'FontWeight','bold')
  
  
  % Get the position and size of the axes 
  set(get(H, 'XLabel'), 'FontWeight', 'bold');
  set(get(H, 'YLabel'), 'FontWeight', 'bold');
  set(get(H, 'ZLabel'), 'FontWeight', 'bold');
  set(get(H, 'Title'), 'FontWeight', 'bold');
  set(get(H, 'Title'), 'FontSize', 13);
  set(H, 'FontWeight', 'bold')
end
  
end 