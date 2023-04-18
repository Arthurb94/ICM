import random
import time
from PIL import Image, ImageTk
import tkinter as tk

images = ['images/droite.png', 'images/gauche.png']
root = tk.Tk()
root.title("Affichage d'images")
root.geometry(f"{int(root.winfo_screenwidth())}x{int(root.winfo_screenheight())}")

cross = Image.open('images/3.png')
photo = ImageTk.PhotoImage(cross)
label = tk.Label(root, image=photo)
label.pack()
root.update()
time.sleep(1)
cross.close()
label.destroy()

cross = Image.open('images/2.png')
photo = ImageTk.PhotoImage(cross)
label = tk.Label(root, image=photo)
label.pack()
root.update()
time.sleep(1)
cross.close()
label.destroy()

cross = Image.open('images/1.png')
photo = ImageTk.PhotoImage(cross)
label = tk.Label(root, image=photo)
label.pack()
root.update()
time.sleep(1)
cross.close()
label.destroy()

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
    time.sleep(7)
    image.close()
    label.destroy()

# Boucle pour afficher une image aléatoire toutes les 10 secondes pendant 5 minutes
l = []
cont = 0
for i in range(26):
    if (i%2 == 0):
        image = 'images/droite.png'
    else:
        image = 'images/gauche.png'
    # Appel de la fonction pour afficher l'image
    show_image(image)
    l.append(image)
    cont +=1
# Fermeture de la fenêtre Tkinter
root.destroy()
print(cont)
print(l)
