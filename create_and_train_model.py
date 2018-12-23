import cv2
import numpy as np
import os, os.path
from PIL import Image
from sklearn import svm
from skimage.feature import hog
from sklearn.externals import joblib
from createDescriptor import *

trainData = []
labels = []
valid_images = [".jpg",".jpeg", ".png"]

imageDir = "/home/bebo/Documents/PrepoznavanjeOblika/TrainNew"

for f in os.listdir(imageDir):
    name, ext = os.path.splitext(f)
    if ext.lower() not in valid_images:
        continue


    if (f == '1.jpg' or f == '2.jpg' or f == '3.jpg' or f == '4.jpg' or f == '5.jpg' or f == '6.jpg' or f == '7.jpg' or f == '8.jpg' or f == '9.jpg' or f == '10.jpg' or f == '11.jpg' or f == '12.jpg' or f == '13.jpg' or f == '14.jpg' or f == '15.jpg' or f == '16.jpg' or f == '17.jpg' or f == '18.jpg' or f == '19.jpg' or f == '20.jpg'):
	labels.append(0)
    else: 
	labels.append(1)

    image = Image.open(os.path.join(imageDir,f))
    hf, hi = createDescriptor(image)
    trainData.append(hf)

clf = svm.SVC(kernel='linear', C=1.0)
clf.fit(np.array(trainData), labels)

#eksport modela
filename = 'final_leaf_model.sav'
joblib.dump(clf, filename)


