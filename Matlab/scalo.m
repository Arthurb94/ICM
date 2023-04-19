function scalo(signal,mouv,indice)
    data = signal(:,1:4);
    fs = 250; %fréquence d'échantillonnage
    fc1 = 12;
    fc2 = 35;
%     N = length(data);
    decompte = 3*250;
    nn = 14*250;

    for i = 0:12
        startIndexCroix = int32(decompte + nn*i);
        endIndexCroix = int32(startIndexCroix + 7*250);
        startIndexSignal = int32(endIndexCroix);
        endIndexSignal = int32(startIndexSignal + 7*250);
        
        mouvement = data(startIndexSignal:endIndexSignal, :);
        electrodes = [mouvement(:,2);...
            mouvement(:,4)];

        [b,a] = butter(4,fc2/(fs/2),"high"); %filtre passe-haut (supprimer bruit à basse fréquence)
        eeg_data_filtered = filter(b,a,electrodes); % appliquer filtre aux données EEG
        
        [b,a] = butter(4,fc1/(fs/2),"low"); %filtre passe-bas (supprimer bruit à haute fréquence)
        eeg_data_filtered = filter(b,a, eeg_data_filtered);

        fb = cwtfilterbank(signallength = length(eeg_data_filtered),...
                    samplingfrequency=fs, ...
                    wavelet="Morse");
        [cfs,frq] = wt(fb,eeg_data_filtered);
        t = (0:(length(eeg_data_filtered)-1))/fs;
        h = figure;
        pcolor(t,frq,abs(cfs));
        set(gca,'yscale','log');shading interp;axis tight;
        title('Scalogram');xlabel('Time (s)');ylabel('Frequency (Hz)');
        set(h, 'Units', 'pixels', 'Position', [0 0 224 224]);
        saveas(h,strcat('data/scalo/',string(mouv),'_',string(indice),'_',string(i)),'jpg');
    end
end