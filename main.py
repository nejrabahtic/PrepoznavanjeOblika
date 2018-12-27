import cv2
import numpy as np
import os, os.path
from PIL import Image
from sklearn import svm
from skimage.feature import hog
from sklearn.externals import joblib
from create_descriptor import *
from create_and_train_model import *
from test_model import *


def mainFcn(path):

	clf = createTrainModel(path)

	fm = joblib.load('final_model.sav')

	acc, sen, sp = testModel(path)


mainFcn("/home/nejra/Documents/PrepoznavanjeOblika/Validacija/ValidacijaBiljka1")
