# Matlab - Traitement des signaux

ICM (Interface Cerveau-Machine) est un répertoire entièrement disponible sur Github.
Il contient l'ensemble des fonctions et scripts Matlab permettant l'extraction des fichiers, leur traitement et leurs prédictions.

Nous avons créé plusieurs progammes en fonction des données. Une partie des programmes vise à traiter et exploiter les données de la base de données récupérée sur internet. L'autre partie nous sert à traiter et exploiter les donnnées récupérées à partir des mesures réalisées par Marion.
# Pour la base de données sur internet
## 1) Extraction des fichiers
#### - Unziper.mlx
Permet d'unziper les fichiers une fois téléchargés depuis la base de données accessible par internet. Ce script permet également de bien structurer les fichiers avec des sous-répertoires dans le répertoire 'Unziped' correspondant aux sujets, aux dates et aux expériences réalisées. (Ex: Unziped/A5_20190613/fichier1/)

#### - 'NPY'
Tous les programmes ayant dans leur nom NPY proviennent d'internet et permettent d'ouvrir et de lire des fichiers .npy. Les fichiers de la base de données d'internet sont tous dans ce format au départ.

## 2) Traitement des données
#### - Signal_filter.mlx
Permet de directement traiter les données extraites de la base de données sur internet. C'est dans ce script que le filtrage, l'affichage de graphiques / scalogrammes se réalise.

#### - Scalogramme.mlx
Trace les scalogrammes à partir des signaux en appelant la fonction 'scalo2.m'.

#### - data/images_A...
Fichiers contenant l'ensemble des scalogrammes tracés grâce au script scalogramme.mlx selon le mouvement réalisé.

# 3) Création des modèles et prédictions

#### - Model_maker.mlx
Crée le modèle en entraînant le réseau de neurones GoogleNet. Il appelle pour ce faire le fichier model.mat qui correspond au modèle entraîné.

#### - Répertoire GoogleNet
Contient l'ensemble des scripts et fonctions permettant de faire fonctionner un exemple de réseau de neurones GoogleNet. Nous nous sommes basés sur ces exemple pour créer notre modèle.

#### - Prediction.m
Réalise les prédictions sur le modèle en prenant en paramètre le modèle créé et sauvegardé par le programme model_maker.mlx et le chemin vers l'image.


# Pour les données provenant des mesures de Marion

#### - data/Marion
Dossier contenant l'ensemble des mesures brutes représentant les variations des éléctrodes du casque obtenus grâce au logiciel Unicorn en format csv.

#### - Traitement_EEG.mlx
Permet de directement traiter les données de Marion. C'est dans ce script que le filtrage, l'affichage de graphiques / scalogrammes se réalise. (équivalent à Signal_filter.mlx pour les données d'internet)

#### - Save_to_scalo.mlx
Trace les scalogrammes à partir des signaux de Marion en appelant la fonction 'scalo.m', puis les enregistre sur votre machine.  (équivalent à Scalogramme.mlx)

#### - 'data/data_pred' et 'data/data_train'
Fichiers contenant l'ensemble des scalogrammes tracés grâce au script save_to_scalo.mlx selon le mouvement réalisé.

# 3) Création des modèles et prédictions

#### - Model_maker.mlx
Créé le modèle en entraînant le réseau de neurones GoogleNet. Il appelle pour ce faire le fichier model.mat qui correspond au modèle entraîné.

#### - Répertoire GoogleNet
Contient l'ensemble des scripts et fonctions permettant de faire fonctionner le réseau de neurones GoogleNet.

#### - Prediction.m
Réalise les prédictions sur le modèle en prenant en paramètre le modèle (en appelant model.mat et model_maker.mlx) et le chemin vers l'image.

