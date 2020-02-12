import os

import cv2
from PIL import Image


class FaceCropper(object):
    CASCADE_PATH = "users/data/haarcascades/haarcascade_frontalface_default.xml"
    CASCADE_PATH2 = "users/data/haarcascades/haarcascade_mcs_upperbody.xml"

    def __init__(self):
        print(os.getcwd())
        self.face_cascade = cv2.CascadeClassifier(self.CASCADE_PATH2)

    def generate(self, image_path, show_result):
        img = cv2.imread(image_path)
        if img is None:
            print("Can't open image file")
            return 0
        image = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        faces = self.face_cascade.detectMultiScale(image, 1.1, 3, minSize=(150, 150))
        if faces is None:
            print('Failed to detect face')
            return 0

        for (x, y, w, h) in faces:
            cropped_img = image[y:y + h, x:x + w]
            im = Image.fromarray(cropped_img)
            return im
