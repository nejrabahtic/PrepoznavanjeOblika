import cv2
import os
import numpy as np
from PIL import Image
from skimage.feature import hog
from resizeimage import resizeimage

imageDir = "/home/bebo/Documents/PrepoznavanjeOblika/Deskriptor/SL1"
hogPath = "/home/bebo/Documents/PrepoznavanjeOblika/Deskriptor/DeskriptorBiljka1"

def createDescriptor(image):
    image = resizeimage.resize_cover(image, [50, 50])
    gray = cv2.cvtColor(np.array(image), cv2.COLOR_BGR2GRAY)
    fd, hog_image = hog(image, orientations=8, pixels_per_cell=(12, 12), cells_per_block=(4, 4), block_norm='L2', visualize=True)

    return fd, hog_image

hog_images = []
hog_features = []
image_path_list = []

valid_images = [".jpg", ".jpeg", ".png"]
br = 1


#print (imageDir)

for file in os.listdir(imageDir):
    	extension = os.path.splitext(file)[1]
	if extension.lower() not in valid_images:
		continue
	image_path_list.append(os.path.join(imageDir, file))

for imagePath in image_path_list:
    img = Image.open(imagePath)

    #print(imagePath[56:])

    #print(img)

    fd, hog_image = createDescriptor(img)
    hog_images.append(hog_image)
    hog_features.append(fd)

    #print(hog_features)

    fullpath = os.path.join(hogPath, 'hog_'+imagePath[56:])
    cv2.imwrite(fullpath, hog_image)

    br += 1
