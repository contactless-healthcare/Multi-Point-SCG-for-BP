close all; clear; clc;
t0=cputime;

fps = 250;    
time = 20;     
time_spec = time/2;    
time_angle = time;   
time_start = 0;    
vedio_name = 'video1-4108585667';
save_name = vedio_name;
channel = 2;
     
      
 
iframe = fps*time_start+1;
nframe = fps*time-1; 
 
Drx = [];
Dry = [];
 
Dgx = [];
Dgy = [];
 
Dbx = [];
Dby = [];

 
name = strcat('D:\Dataset\SCG-Mutiband\',vedio_name);   

v = VideoReader(strcat(name,'.avi'));

 
frame = read(v, 1);

zengyi = 1;
frame_r = frame(:,:,1)*zengyi;
frame_g = frame(:,:,2)*zengyi;
frame_b = frame(:,:,3)*zengyi;

 
imshow(frame_r);
roi_r = drawrectangle('Color', [1 0.1 0.1]);
roi_r = floor(roi_r.Position);
imshow(frame_g);
roi_g = drawrectangle('Color', [1 0.1 0.1]);
roi_g = floor(roi_g.Position);
 
 


opticFlowr = opticalFlowFarneback("NumPyramidLevels",5);
opticFlowg = opticalFlowFarneback("NumPyramidLevels",5);

for i = 1:channel
    if i ==1
        for idx = iframe : iframe+nframe
             
            disp([num2str('R:'),num2str(idx),'|',num2str(iframe + nframe)]);
            
            frame = read(v, idx);
            frame = frame(:,:,1);
             
            frame = frame(roi_r(2):roi_r(2)+roi_r(4), roi_r(1):roi_r(1)+roi_r(3),:);
            
            flow = estimateFlow(opticFlowr,frame);

             
            dx = mean2(double(flow.Vx));
            dy = mean2(double(flow.Vy));

            Drx = [Drx, dx];
            Dry = [Dry, dy];
        end
    elseif i == 2
        for idx = iframe : iframe+nframe
             
            disp([num2str('G:'),num2str(idx),'|',num2str(iframe + nframe)]);
             
            frame = read(v, idx);
            frame = frame(:,:,2);
            frame = frame(roi_g(2):roi_g(2)+roi_g(4), roi_g(1):roi_g(1)+roi_g(3),:);

            
            flow = estimateFlow(opticFlowg,frame);

            
            dx = mean2(double(flow.Vx));
            dy = mean2(double(flow.Vy));

            Dgx = [Dgx, dx];
            Dgy = [Dgy, dy];
        end
    elseif i ==3
         for idx = iframe : iframe+nframe
             
            disp([num2str('B:'),num2str(idx),'|',num2str(iframe + nframe)]);
             
            frame = read(v, idx);
            frame = frame(:,:,3);
            frame = frame(roi_b(2):roi_b(2)+roi_b(4), roi_b(1):roi_b(1)+roi_b(3),:);

             
            flow = estimateFlow(opticFlowb,frame);

             
            dx = mean2(double(flow.Vx));
            dy = mean2(double(flow.Vy));

            Dbx = [Dbx, dx];
            Dby = [Dby, dy];
        end
    end
end
 
% [Dxyr, Dxyg] = motion_synthesis(Drx, Dry , Dgx, Dgy, time, fps); 


 
save(strcat(save_name,'.mat'),"Dgy","Dgx","Dry","Drx", 'roi_r',"roi_g","time");

figure
subplot(3,2,1)
plot(Drx)
title("X")
ylabel("R-channel")
subplot(3,2,2)
plot(Dry)
title("Y")
subplot(3,2,3)
plot(Dgx)
ylabel("G-channel")
subplot(3,2,4)
plot(Dgy)
subplot(3,2,5)
plot(Dxyr)
subplot(3,2,6)
plot(Dxyg)

t1=cputime-t0;
disp([num2str('The program running time is:'),num2str(t1)]);