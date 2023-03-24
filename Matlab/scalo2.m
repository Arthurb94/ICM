function scalo2(signal,mark,ifolder,ifile)
    disp('on y est la');
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
%         if not(strcmp(label,''))
            diff_indice = indice_fin - indice_deb; 
            fb = cwtfilterbank(signallength=double(diff_indice),...
                samplingfrequency=Fs, ...
                wavelet="Morse");
            sig = signal(indice_deb:(indice_fin-1));
            [cfs,frq] = wt(fb,sig);
            t = (0:(diff_indice-1))/Fs;
            h = figure;
            pcolor(t,frq,abs(cfs));
            set(gca,'yscale','log');shading interp;axis tight;
            title('Scalogram');xlabel('Time (s)');ylabel('Frequency (Hz)');
            saveas(h,strcat('data/',label,'/',string(ifolder),'_',string(ifile),'_',string(imark)),'jpg');
        end
    end
end
