from flask import Flask, jsonify, request
import tensorflow as tf
import numpy as np

# Flask uygulamasını oluşturma
app = Flask(__name__)

modelsCar = tf.keras.models.load_model("D:/BitirmeProjesi/datasetler/path/to/save/model")
modelsComputer = tf.keras.models.load_model("D:/BitirmeProjesi/datasetler/pathComputer/to/save/model")
modelsPhone = tf.keras.models.load_model("D:/BitirmeProjesi/datasetler/pathPhone/to/save/model")
    # Diğer kategorilere göre modelleri buraya ekleyin

print("burda")

def preprocess_data_car(make, modell, type, origin, driveTrain, engineSize, cylinders, horsepower, mPGCity, mPGHighway):
    # Veri ön işleme adımlarını burada gerçekleştirin
    # Gerekli dönüşümleri, ölçeklendirmeleri veya diğer işlemleri uygulayın
    # İşlenmiş veriyi uygun bir formatla geri döndürün
    # Örnek bir işlem
    input_data = [make, modell, type, origin, driveTrain, engineSize, cylinders, horsepower, mPGCity, mPGHighway]
    return input_data

def preprocess_data_computer(hiz, hd, ram, ekran, cd, multi, ads):
    # Veri ön işleme adımlarını burada gerçekleştirin
    # Gerekli dönüşümleri, ölçeklendirmeleri veya diğer işlemleri uygulayın
    # İşlenmiş veriyi uygun bir formatla geri döndürün

    # Örnek bir işlem
    input_data = [hiz, hd, ram, ekran, cd, multi, ads]
    return input_data
def preprocess_data_phone(model,marka,ram,kamera,ekran,yuzTanima,hafiza):
    # Veri ön işleme adımlarını burada gerçekleştirin
    # Gerekli dönüşümleri, ölçeklendirmeleri veya diğer işlemleri uygulayın
    # İşlenmiş veriyi uygun bir formatla geri döndürün

    # Örnek bir işlem
    input_data = [model,marka,ram,kamera,ekran,yuzTanima,hafiza]
    return input_data
# Modeli yükleme

#model = tf.keras.models.load_model("D:/BitirmeProjesi/datasetler/path/to/save/model")



# API endpoint'i tanımlama
@app.route("/car", methods=["POST"])
def predictCar():
    # İstekten veriyi alma
    category = request.json['category']
    print("Gelen veri: ", category)
    data = request.json['make']
    modellRequest = request.json['modell']
    typeRequest = request.json['type']
    originRequest = request.json['origin']
    driveTrainRequest = request.json['driveTrain']
    engineSizeRequest = request.json['engineSize']
    cylindersRequest = request.json['cylinders']
    horsepowerRequest = request.json['horsepower']
    mPGCityRequest = request.json['mPGCity']
    mPGHighwayRequest = request.json['mPGHighway']
    # Gelen verileri kullanma
    make = int(data)
    modell = int(modellRequest)
    type = int(typeRequest)
    origin = int(originRequest)
    driveTrain = int(driveTrainRequest)
    engineSize = float(engineSizeRequest)
    cylinders = float(cylindersRequest)
    horsepower = float(horsepowerRequest)
    mPGCity = float(mPGCityRequest)
    mPGHighway = float(mPGHighwayRequest)
    # Veriyi modelin giriş formatına dönüştürme
    # (gerektiğine bağlı olarak veriyi ön işleme yapabilirsiniz)
    input_data = preprocess_data_car(make,modell,type,origin,driveTrain,engineSize,cylinders,horsepower,mPGCity,mPGHighway)
    input_data = np.array([input_data])
    price = modelsCar.predict(input_data)
    price = float(price.item())  # Tahmin edilen fiyatı ondalık sayıya dönüştürme
    response = {'price': price}
    print(response)
    return jsonify(response)

@app.route("/computer", methods=["POST"])
def predictComputer():
    # İstekten veriyi alma
    category = request.json['category']
    print("Gelen veri: ", category)

    hiz = request.json['hiz']
    hd = request.json['hd']
    ram = request.json['ram']
    ekran = request.json['ekran']
    cd = request.json['cd']
    multi = request.json['multi']
    ads = request.json['ads']
    # Gelen verileri kullanma
    hiz = int(hiz)
    hd = int(hd)
    ram = int(ram)
    ekran = int(ekran)
    cd = int(cd)
    multi = int(multi)
    ads = int(ads)
    # Veriyi modelin giriş formatına dönüştürme
    # (gerektiğine bağlı olarak veriyi ön işleme yapabilirsiniz)
    input_data = preprocess_data_computer(hiz,hd,ram,ekran,cd,multi,ads)
    input_data = np.array([input_data])
    price = modelsComputer.predict(input_data)
    price = float(price.item())  # Tahmin edilen fiyatı ondalık sayıya dönüştürme
    response = {'price': price}
    print(response)
    return jsonify(response)

@app.route("/phone", methods=["POST"])
def predictPhone():
    # İstekten veriyi alma
    category = request.json['category']
    print("Gelen veri: ", category)

    modelPhone = request.json['model']
    markaPhone = request.json['marka']
    ramPhone = request.json['ram']
    kamera = request.json['kamera']
    ekranPhone = request.json['ekran']
    yuzTanima = request.json['yuzTanima']
    hafiza = request.json['hafiza']
    # Gelen verileri kullanma
    modelPhone = int(modelPhone)
    markaPhone = int(markaPhone)
    ramPhone = int(ramPhone)
    kamera = int(kamera)
    ekranPhone = int(ekranPhone)
    yuzTanima = int(yuzTanima)
    hafiza = int(hafiza)
    # Veriyi modelin giriş formatına dönüştürme
    # (gerektiğine bağlı olarak veriyi ön işleme yapabilirsiniz)
    input_data = preprocess_data_phone(modelPhone,markaPhone,ramPhone,kamera,ekranPhone,yuzTanima,hafiza)
    input_data = np.array([input_data])
    price = modelsPhone.predict(input_data)
    price = float(price.item())  # Tahmin edilen fiyatı ondalık sayıya dönüştürme
    response = {'price': price}
    print(response)
    return jsonify(response)


# Sunucuyu başlatma
if __name__ == "__main__":
    app.run(host='192.168.1.37', port=8000)
