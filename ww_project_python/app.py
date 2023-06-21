from flask import Flask
from flask import request
import base64
import json
from ultralytics import YOLO
import cv2
import numpy as np

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World'

@app.route("/yolo", methods=["POST"])
def yolo():
    print("yolo function start")




    # image = request.get_json()
    # print("image=")
    # encoded_data = image.get("data")
    encoded_data = request.data.decode('utf-8')
    #print("encoded_data=", encoded_data)
    # print("="*100)
    # print("encoded_data=", encoded_data)
    # print("="*100)

    encoded_data = encoded_data.replace("image/jpeg;base64,", "")


    decoded_data = base64.b64decode(encoded_data)
    # print("="*100)
    # print("decoded_data=",decoded_data)
    # print("="*100)

    nparr = np.fromstring(decoded_data, np.uint8)

    img = cv2.imdecode(nparr, cv2.IMREAD_COLOR)
    # print("img=", img)

    model = YOLO('best.pt')
    results = model(img)
    detect_img = results[0].plot()
    cv2.imwrite('detect_result.jpg', detect_img)
    img_result = []
    for r in results:
        images = r.boxes
        for i in images:
            cls = int(i.cls)
            conf = i.conf
            if conf>0.6:
                img_result.append({
                    "cls": int(cls), "conf":float(conf)
                })
    print("yolo function end")
    return json.dumps(img_result)

@app.route("/weather", methods=["POST"])
def weather():

    weather_json = request.data.decode('utf-8')
    print("weather_json=", weather_json)

    return weather_json


if __name__ == '__main__':
    app.run()