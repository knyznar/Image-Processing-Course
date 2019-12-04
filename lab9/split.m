function split(I,yS,xS,yE,xE)
    global prog min_size segRes MRes index;

    windowH = I(yS:yE,xS:xE);
    Hmean = mean(windowH(:));
    Hstd = std(windowH(:));
    
    if (yE-yS <= min_size) || (xE-xS <= min_size) || (Hstd < prog) 
        segRes(yS:yE,xS:xE) = index;
        index = index + 1;
        MRes(yS:yE,xS:xE) = Hmean;
    else
        xMid = xS + floor((xE-xS) / 2);
        yMid = yS + floor((yE-yS) / 2);
        %Lewy górny
        split(I,yS,xS,yMid,xMid);
        %Prawy górny
        split(I,yS,xMid,yMid,xE);
        %Lewy dolny
        split(I,yMid+1,xS,yE,xMid);
        %Prawy dolny
        split(I,yMid+1,xMid+1,yE,xE);
    end     
end