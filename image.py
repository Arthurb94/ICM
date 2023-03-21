import random
import time
from PIL import Image, ImageTk
import tkinter as tk

images = ['images/droite.png', 'images/gauche.png', 'images/haut.png', 'images/bas.png']
root = tk.Tk()
root.title("Affichage d'images")
root.geometry(f"{int(root.winfo_screenwidth())}x{int(root.winfo_screenheight())}")

def show_image(image_path):
    cross = Image.open('images/cross.png')
    photo = ImageTk.PhotoImage(cross)
    label = tk.Label(root, image=photo)
    label.pack()
    root.update()
    time.sleep(5)
    cross.close()
    label.destroy()
    
    image = Image.open(image_path)
    photo = ImageTk.PhotoImage(image)
    label = tk.Label(root, image=photo)
    label.pack()
    root.update()
    time.sleep(10)
    image.close()
    label.destroy()

# Boucle pour afficher une image aléatoire toutes les 10 secondes pendant 5 minutes
for i in range(30):
    # Choix aléatoire d'une image
    image_path = random.choice(images)
    # Appel de la fonction pour afficher l'image
    show_image(image_path)

# Fermeture de la fenêtre Tkinter
root.destroy()
