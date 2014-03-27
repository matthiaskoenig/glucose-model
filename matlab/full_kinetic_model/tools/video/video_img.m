function [] = video_img()
% Create the images for the video
folder = './data/';
N = 100;

[X,Y,Z] = peaks(30);
fig1 = figure('Name', 'Video', 'Position', [0 0 300 300])
for i =1:N
    i
    fname = strcat(folder, getLeadingZeros(i), num2str(i));
    Z = Z + 0.3*(rand(30)-0.5);
    surfc(X,Y,Z, 'EdgeAlpha', 0.1)
    colormap hsv
    axis([-3 3 -3 3 -10 5])
    caxis([-10 5])
    axis square
    drawnow
    print(fig1, fname, '-dpng') 
    
end

% Create the video and remove the files (Linux)
% ffmeg
% -r framerate
% -b video bitrate
% -i input files
% -qscale viddeo quantizer (1 best, 31 worst)

% cd data
% ffmpeg -qscale 1 -r 20 -b 9600 -i %04d.png movie.mp4
% rm *.png


    function n = getLeadingZeros(i)
        if i>9999
            error('WTF are you doing')
        end
        n = '';
        if i<10
            n = '000';
            return
        elseif i<100
            n= '00';
            return
        elseif i<1000
            n='0';
            return
        end
    end



end