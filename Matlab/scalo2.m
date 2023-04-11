function scalo2(signal,mark,ifolder,ifile)
    disp('on y est');
    Fs = 500;
    for imark = 4:(length(mark)-1)
        indice_deb = double(mark(imark));
        indice_fin = double(mark(imark+1));
        if mark(imark,2) == 769
            label = 'gauche';
        elseif mark(imark,2) == 770
            label = 'droite';
        elseif mark(imark,2) == 771
            label = 'pied';
        else
            label = '';
        end
        if ~isempty(label)
            sig = [signal(indice_deb:indice_fin,1);...
                signal(indice_deb:indice_fin,2);...
                signal(indice_deb:indice_fin,3);...
                signal(indice_deb:indice_fin,4)];
            fb = cwtfilterbank(signallength = length(sig),...
                samplingfrequency=Fs, ...
                wavelet="Morse");
            [cfs,frq] = wt(fb,sig);
            t = (0:(length(sig)-1))/Fs;
            h = figure;
            pcolor(t,frq,abs(cfs));
            set(gca,'yscale','log');shading interp;axis tight;
            title('Scalogram');xlabel('Time (s)');ylabel('Frequency (Hz)');
            set(h, 'Units', 'pixels', 'Position', [0 0 224 224]);
            saveas(h,strcat('data/images_A5/',label,'/',string(ifolder),'_',string(ifile),'_',string(imark)),'jpg');
        end
    end
end
