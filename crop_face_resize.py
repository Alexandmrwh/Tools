import os
import cv2
import glob
import numpy as np
import functools
from mtcnn.mtcnn import MTCNN

FOLDER = "./imgs/"

def sort_face(face0, face1):
    _, _, w0, h0 = face0
    _, _, w1, h1 = face1
    a0 = w0 * h0
    a1 = w1 * h1
    if a0 < a1:
        return -1
    elif a0 == a1:
        return 0
    else:
        return 1

if __name__ == "__main__":

    # initialize face detector
    facedetector = MTCNN()
    paths = glob.glob(os.path.join(FOLDER, '*.jpg'))
    for path in paths:
        img= cv2.imread(path)

        if img.shape == (128, 128, 3):
            print("Processed")
            continue

        # detect faces
        faces = []
        for facejs in facedetector.detect_faces(img):
            faces.append(facejs['box'])

        if len(faces) == 0:
            print("====> No face detected in {}".format(path))
            try: 
                os.remove(path)
            except: pass
        
        elif len(faces) == 1:
            print("====> One Face detected in {}".format(path))
            try:
                x, y, w, h = faces[0]
                face = img[y:y+h, x:x+w]
                face = cv2.resize(face, (128, 128))
                cv2.imwrite(path, face)
            except Exception as e:
                print(str(e))
                os.remove(path)

        elif len(faces) > 1:
            print("====> Largest Face detected in {}".format(path))
            try:
                sorted(faces, key=functools.cmp_to_key(sort_face), reverse=True)
                x, y, w, h = faces[0]
                face = img[y:y+h, x:x+w]
                face = cv2.resize(face, (128, 128))
                cv2.imwrite(path, face)
            except Exception as e:
                print(str(e))
                os.remove(path)
            
            

    

        


            


        
        


        
    
