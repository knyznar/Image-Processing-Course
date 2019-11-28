function rysuj(img, prog_reczny)
    figure();
    subplot(3, 2, 1);
    imshow(img);
    title("Orginal");
    subplot(3, 2, 2);
    imhist(img);
    title("Histogram");
    subplot(3, 2, 3);
    imshow(im2bw(img, prog_reczny/255));
    title("Prog reczny=" + num2str(prog_reczny));
    subplot(3, 2, 4);
    gt = graythresh(img);
    imshow(im2bw(img, gt));
    title("Otsu Prog=" + num2str(gt*255));
    subplot(3, 2, 5);
    Kittler = clusterKittler(img);
    imshow(im2bw(img, Kittler/255));
    title("Kittler Prog=" + num2str(Kittler));
    subplot(3, 2, 6);
    Yen = entropyYen(img);
    imshow(im2bw(img, Yen/255));
    title("Yen Prog=" + num2str(Yen));
end