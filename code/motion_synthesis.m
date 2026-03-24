function [Dxyr, Dxyg] = motion_synthesis(Drx, Dry , Dgx, Dgy, time, fps)
 
time_angle = time;
Dxyr = [];Dxyg=[];
for i = 1:2
    disp([num2str('i:'),num2str(i)]);

    if i == 1
         Dx =Drx; 
         Dy =Dry;
    elseif i == 2  
         Dx = Dgx;
         Dy = Dgy;
    end

    AMP = [];
    amp_1 = 0;
    amp_2 = 0;
    amp_3 = 0;
    amp_4 = 0;

    for t = 1 : time
        for idx = 1 : fps  
            number = (t-1)*fps+idx;
            if Dx(number)>0 && Dy(number)>0
                amp_1 = amp_1 + sqrt(Dx(number)*Dx(number)+Dy(number)*Dy(number));
            elseif Dx(number)<0 && Dy(number)>0
                amp_2 = amp_2 + sqrt(Dx(number)*Dx(number)+Dy(number)*Dy(number));
            elseif Dx(number)<0 && Dy(number)
                amp_3 = amp_3 + sqrt(Dx(number)*Dx(number)+Dy(number)*Dy(number));
            elseif Dx(number)>0 && Dy(number)
                amp_4 = amp_4 + sqrt(Dx(number)*Dx(number)+Dy(number)*Dy(number));
            end
        end
    end

    % disp([num2str(amp_1),'|',num2str(amp_2),'|',num2str(amp_3),'|',num2str(amp_4)]);
    if amp_1>amp_2 && amp_1>amp_3 && amp_1>amp_4
        AMP = [AMP, 1];
    elseif amp_2>amp_1 && amp_2>amp_3 && amp_2>amp_4
        AMP = [AMP, 2];
    elseif amp_3>amp_1 && amp_3>amp_2 && amp_3>amp_4
        AMP = [AMP, 3];
    elseif amp_4>amp_1 && amp_4>amp_2 && amp_4>amp_3
        AMP = [AMP, 4];
    end
    disp(AMP)

    
    ANGLE = [];
    angle = [];
    for t = 1 : time
        amp = AMP(1);
        if amp==1
            for idx = 1 : fps
                number = (t-1)*fps+idx;
                if Dx(number)>0 && Dy(number)>0
                    angle = [angle, atan(Dy(number)/Dx(number))*180/pi];
                end
            end
        elseif amp==2
            for idx = 1 : fps
                number = (t-1)*fps+idx;
                if Dx(number)<0 && Dy(number)>0
                    angle = [angle, (180+atan(Dy(number)/Dx(number))*180/pi)];
                end
            end
        elseif amp==3
            for idx = 1 : fps
                number = (t-1)*fps+idx;
                if Dx(number)<0 && Dy(number)<0
                    angle = [angle, atan(Dy(number)/Dx(number))*180/pi-180];
                end
            end
        elseif amp==4
            for idx = 1 : fps
                number = (t-1)*fps+idx;
                if Dx(number)>0 && Dy(number)<0
                    angle = [angle, atan(Dy(number)/Dx(number))*180/pi];
                end
            end
        end
        if time_angle == 1
            ANGLE = [ANGLE, median(angle)];
            angle = [];
        else
            if mod(t,time_angle)==0 && (t>0)
                ANGLE = [ANGLE, median(angle)];
                angle = [];
            end
        end
    end

    disp(ANGLE);

    
    Dxy = [];
    for t = 1 : time
        if time_angle == 1
            ang = ANGLE(t);
        else
            if mod(t,time_angle)==1
                ang = ANGLE(floor(t/time_angle)+1);
                disp(ang);
            end
        end

        for idx = 1 : fps
            number = (t-1)*fps+idx;
            Dxy = [Dxy, Dx(number)*cos(ang)+Dy(number)*sin(ang)];
        end
    end
    if i ==1
        Dxyr = Dxy;
    elseif i ==2
        Dxyg = Dxy;
%     elseif i ==3
%         Dxyb = Dxy;
    end
end

end