from sklearn.model_selection import train_test_split
from save_image import saveImage
import os
import numpy as np
from PIL import Image
import random
import cv2

path_biljka1 = '/home/nejra/Documents/PrepoznavanjeOblikaSlike/SlikeBiljka1'
path_biljka2 = '/home/nejra/Documents/PrepoznavanjeOblikaSlike/SlikeBiljka2'
path_biljka3 = '/home/nejra/Documents/PrepoznavanjeOblikaSlike/SlikeBiljka3'

valid_images = [".jpg",".jpeg", ".png"]

br = 1
image_list = []

for f in os.listdir(path_biljka1):
    ext = os.path.splitext(f)[1]
    if ext.lower() not in valid_images:
        continue
    image = Image.open(os.path.join(path_biljka1, f))

    image_list.append(image)

random.shuffle(image_list)

train_data, test_data = train_test_split(image_list, test_size=0.2)

br=1
for img in train_data:
    newpath = '/home/nejra/Documents/PrepoznavanjeOblikaDivide/Train'
    img = np.array(img)
    saveImage(cv2.cvtColor(img, cv2.COLOR_BGR2RGB), newpath, str(br)+".jpg")
    br += 1

for img in test_data:
    newpath = '/home/nejra/Documents/PrepoznavanjeOblikaDivide/Test'
    img = np.array(img)
    saveImage(cv2.cvtColor(img, cv2.COLOR_BGR2RGB), newpath, str(br)+".jpg")
    br += 1

