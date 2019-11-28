function data_filtered = bilateral_local(data,local_window, sigma)
    Nx = size(data,2);
    Ncy = ceil(local_window(1)/2);
    Ncx = ceil(local_window(2)/2);
    h = fspecial('gaussian',local_window,25);

    for i=1:Nx   
        patch = reshape(data(:,i),local_window);

        [rows, cols] = find(patch == patch);   % ||p - x||
        rows = reshape(rows, local_window);
        cols = reshape(cols,local_window);
        dist = sqrt((Ncy - rows).^2 + (Ncx - cols).^2);
        %obliczmy psi
        psi = dist .* h;

        abs_val = abs(patch - patch(Ncy,Ncx));
        gamma = exp((-1)*(abs_val .^2)/(2*(sigma)^2));
        Wn = sum(sum(psi .* gamma));
        
        data_filtered(i) = sum(sum(psi .* gamma .* patch))/Wn;
    end
end
