%% suppression de bruit, mouvements oculaires et signaux musculaires %%

eeg_data = csvread("test.csv",1,0);
eeg_data1 = eeg_data(:,[1:8]);

%plot(data(:,1), data(:,2)); % la première colonne contient les valeurs x, la deuxième colonne contient les valeurs y
%xlabel('X');
%ylabel('Y');
plot(eeg_data1);
title('Courbe à partir d un fichier CSV');

%% filtrer sous forme d'échantillons %%

% prendre les parties de tests (7 secondes environ)

%% supp bruit %%

fs = 250 %fréquence d'échantillonnage
fc = 35
[b,a] = butter(4,fc/(fs/2),"low") %filtre passe-bas (supprimer bruit à haute fréquence)
eeg_data_filtered = filtfilt(b,a,eeg_data1); % appliquer filtre aux données EEG

fc = 12 
[b,a] = butter(4,fc/(fs/2),"high") %filtre passe-haut (supprimer bruit à basse fréquence)
eeg_data_filtered = filtfilt(b,a, eeg_data_filtered); % appliquer filtre aux données EEG

save('ee_data_filtered.mat', "eeg_data_filtered")

%% Définition des régions d'intérêt %%

roi1 = [1 2 3 5 6 7] %région d'intéret pour mouvement ou pensée à droite
roi2 = [1 3 4 5 7 8] %région d'intéret pour mouvement ou pensée à gauche

roi3 = [1 2 3]
roi4 = [1 3 4]

% extraire les signaux de chaque ROI

signal_roi1 = eeg_data_filtered(roi1,:);
signal_roi2 = eeg_data_filtered(roi2,:);

signal_roi3 = eeg_data_filtered(roi3,:);
signal_roi4 = eeg_data_filtered(roi4,:);

plot(signal_roi1);
title('Courbe des régions d intérêt 1');
plot(signal_roi2);
title('Courbe des régions d intérêt 2');

%% supp artefacts oculaires %%


%corr() 

%% supp artefacts musculaires %%

%cleanline()


% sélection des fenêtres d'échantillonnage

% analyse de fréquence (transformée en ondelettes)

% analyse synchronisation entre différentes régions du cerveau :
% utilisation corrélation croisée ou cohérence de phase

% analyse des caractéristiques : pics ondes cérébrales, pics puissance,
% latences etc

% classif (pas notre partie)