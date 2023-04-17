%% suppression de bruit, mouvements oculaires et signaux musculaires %%

eeg_data = csvread("test.csv",1,0);
eeg_data1 = eeg_data(:,[1:8]); %toutes les électrodes
eeg_data2 = eeg_data(:,[1:4]); %électrodes 1,2,3,4

%plot(data(:,1), data(:,2)); % la première colonne contient les valeurs x, la deuxième colonne contient les valeurs y
%xlabel('X');
%ylabel('Y');
plot(eeg_data1);
title('Courbe à partir d un fichier CSV');

plot(eeg_data2)
title('Courbe à partir des électrodes 1,2,3,4')

%% filtrer sous forme d'échantillons %%

% prendre les parties de tests (7 secondes environ)

%% supp bruit %%

% sur les électrodes 1,2,3,4 %

fs = 250 %fréquence d'échantillonnage
fc = 35
[b,a] = butter(4,fc/(fs/2),"low") %filtre passe-bas (supprimer bruit à haute fréquence)
eeg_data_filtered = filtfilt(b,a,eeg_data2); % appliquer filtre aux données EEG

fc = 12 
[b,a] = butter(4,fc/(fs/2),"high") %filtre passe-haut (supprimer bruit à basse fréquence)
eeg_data_filtered = filtfilt(b,a, eeg_data_filtered); % appliquer filtre aux données EEG

save('ee_data_filtered.mat', "eeg_data_filtered")



%% Définition des régions d'intérêt %%

roi1 = [1 2 3 5 6 7] %région d'intéret pour mouvement ou pensée à droite
roi2 = [1 3 4 5 7 8] %région d'intéret pour mouvement ou pensée à gauche

roi3 = eeg_data_filtered(:,[1 2 3]) %région d'intérêt pour mvt ou pensée à droite (4 électrodes)
roi4 = eeg_data_filtered(:,[1 3 4]) %région d'intérêt pour mvt ou pensée à gauche (4 électrodes)

% extraire les signaux de chaque ROI


plot(roi3);
title('Courbe des régions d intérêt 1');
plot(roi4);
title('Courbe des régions d intérêt 2');

%% scalogramme %%



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