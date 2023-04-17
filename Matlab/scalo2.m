function scalo2(signal,mark,ifolder,ifile)
    Fs = 500;
    fc1 = 35;
    fc2 = 12;
    for imark = 4:(length(mark)-1)
        indice_deb = double(mark(imark));
        indice_fin = double(mark(imark+1));

        %Détermination du mouvement 
        if mark(imark,2) == 769
            label = 'gauche';
        elseif mark(imark,2) == 770
            label = 'droite';
        else
            label = '';
        end
        if ~isempty(label)

            %Concaténation des signaux
            sig = [signal(indice_deb:indice_fin,1);...
                signal(indice_deb:indice_fin,2);...
                signal(indice_deb:indice_fin,3);...
                signal(indice_deb:indice_fin,4)];

            %Filtrage du signal 
            [b,a] = butter(4,[fc2 fc1]/(Fs/2)); %filtre passe-bande
            eeg_data_filtered = filtfilt(b,a,sig); % appliquer filtre au signal

            %Transformée en ondlette
            fb = cwtfilterbank(signallength = length(eeg_data_filtered),...
                samplingfrequency=Fs, ...
                wavelet="Morse");
            [cfs,frq] = wt(fb,eeg_data_filtered);

            %Tracé du scalogramme
            t = (0:(length(eeg_data_filtered)-1))/Fs;
            h = figure;
            pcolor(t,frq,abs(cfs));
            set(gca,'yscale','log');shading interp;axis tight;
            title('Scalogram');xlabel('Time (s)');ylabel('Frequency (Hz)');
            set(h, 'Units', 'pixels', 'Position', [0 0 224 224]);
            saveas(h,strcat('data/images_A5/',label,'/',string(ifolder),'_',string(ifile),'_',string(imark)),'jpg');
        end
    end
end

