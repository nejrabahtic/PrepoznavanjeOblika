from __future__ import division
import cv2
import os
from PIL import Image
from sklearn import *
from sklearn.metrics import accuracy_score
from sklearn.externals import joblib
from sklearn.metrics import confusion_matrix
from create_descriptor import *
from create_and_train_model import *


testData = []
labels = []
valid_images = [".jpg",".jpeg", ".png"]

for f in os.listdir('/home/bebo/Documents/PrepoznavanjeOblika/TestNew'):
    name, ext = os.path.splitext(f)
    if ext.lower() not in valid_images:
        continue

    if (f == '18.jpg' or f == '21.jpg' or f == '22.jpg' or f == '29.jpg' or f == '33.jpg' or f == '34.jpg'):
	labels.append(0)
    else: 
	labels.append(1)    

    image = Image.open(os.path.join('/home/bebo/Documents/PrepoznavanjeOblika/TestNew',f))
    hf, hi = createDescriptor(image)
    testData.append(hf)

pred = clf.predict(testData)

cm1 = confusion_matrix(labels, pred)
print('Confusion Matrix : \n%s' % cm1)

total1=sum(sum(cm1))

accuracy1=(cm1[0,0]+cm1[1,1])/total1
print ('Accuracy : ', accuracy1)

sensitivity1 = cm1[0,0]/(cm1[0,0]+cm1[0,1])
print('Sensitivity : ', sensitivity1 )

specificity1 = cm1[1,1]/(cm1[1,0]+cm1[1,1])
print('Specificity : ', specificity1)

