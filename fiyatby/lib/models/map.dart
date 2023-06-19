// ignore_for_file: equal_keys_in_map

class MapProvider {
  
  //Araba
  Map<String, int> driveTrainMap = {'All': 0, 'Front': 1, 'Rear': 2};
  Map<String, int> typeMap = {
    'Hybrid': 0,
    'SUV': 1,
    'Sedan': 2,
    'Sports': 3,
    'Truck': 4,
    'Wagon': 5
  };
  Map<String, int> originMap = {'Asia': 0, 'Europe': 1, 'USA': 2};
  Map<String, int> arabaMarkalari = {
    'Acura': 0,
    'Audi': 1,
    'BMW': 2,
    'Buick': 3,
    'Cadillac': 4,
    'Chevrolet': 5,
    'Chrysler': 6,
    'Dodge': 7,
    'Ford': 8,
    'GMC': 9,
    'Honda': 10,
    'Hummer': 11,
    'Hyundai': 12,
    'Infiniti': 13,
    'Isuzu': 14,
    'Jaguar': 15,
    'Jeep': 16,
    'Kia': 17,
    'Land Rover': 18,
    'Lexus': 19,
    'Lincoln': 20,
    'MINI': 21,
    'Mazda': 22,
    'Mercedes-Benz': 23,
    'Mercury': 24,
    'Mitsubishi': 25,
    'Nissan': 26,
    'Oldsmobile': 27,
    'Pontiac': 28,
    'Porsche': 29,
    'Saab': 30,
    'Saturn': 31,
    'Scion': 32,
    'Subaru': 33,
    'Suzuki': 34,
    'Toyota': 35,
    'Volkswagen': 36,
    'Volvo': 37
  };
  Map<String, int> modelMap = {};
  void updateModels(var markaAdi) {
    if (markaAdi == 'Acura') {
      modelMap = {
        "3.5 RL w/Navigation 4dr": 1,
        "3.5 RL 4dr": 0,
        "MDX": 228,
        "TL 4dr": 362,
        "TSX 4dr": 363,
        "RSX Type S 2dr": 291
      };
    } else if (markaAdi == 'Audi') {
      modelMap = {
        "RS 6 4dr": 290,
        " A8 L Quattro 4dr": 44,
        "A6 4.2 Quattro 4dr ": 43,
        "S4 Avant Quattro ": 310,
        "S4 Quattro 4dr  ": 311,
        "A4 3.0 Quattro convertible 2dr  ": 36,
        " A6 2.7 Turbo Quattro 4dr ": 39,
        "A4 3.0 convertible 2dr ": 37,
        "A6 3.0 Avant Quattro ": 41,
        " TT 3.2 coupe 2dr (convertible) ": 366,
        " A6 3.0 Quattro 4dr ": 42,
        "TT 1.8 Quattro 2dr (convertible) ": 364,
        "A6 3.0 4dr ": 40,
        "TT 1.8 convertible 2dr (coupe) ": 365,
        "A41.8T convertible 2dr ": 38,
        " A4 3.0 Quattro 4dr auto  ": 34,
        "A4 3.0 Quattro 4dr manual   ": 35,
        " A4 3.0 4dr  ": 33,
        "A4 1.8T 4dr  ": 32
      };
    } else if (markaAdi == 'BMW') {
      modelMap = {
        "745Li 4dr": 19,
        "745i 4dr": 20,
        "M3 convertible 2dr": 225,
        "545iA 4dr": 18,
        "X5 4.4i": 398,
        "M3 coupe 2dr": 226,
        "530i 4dr": 17,
        "330Ci convertible 2dr": 10,
        "Z4 convertible 3.0i 2dr": 414,
        "525i 4dr": 16,
        "325Ci convertible 2dr": 5,
        "330xi 4dr": 12,
        "X3 3.0i": 397,
        "330Ci 2dr": 9,
        "330i 4dr": 11,
        "Z4 convertible 2.5i 2dr": 413,
        "325xi Sport": 8,
        "325Ci 2dr": 4,
        "325xi 4dr": 7,
        "325i 4dr": 6
      };
    } else if (markaAdi == 'Buick') {
      modelMap = {
        "Park Avenue Ultra 4dr": 274,
        "Rainier": 295,
        "Park Avenue 4dr": 273,
        "LeSabre Limited 4dr": 221,
        "Regal GS 4dr": 299,
        "Rendezvous CX": 301,
        "LeSabre Custom 4dr": 220,
        "Regal LS 4dr": 300,
        "Century Custom 4dr": 102
      };
    } else if (markaAdi == 'Cadillac') {
      modelMap = {
        "XLR convertible 2dr": 409,
        "Escalade EXT": 147,
        "Escalade": 146,
        "Deville DTS 4dr": 126,
        "Seville SLS 4dr": 342,
        "SRX V8": 326,
        "Deville 4dr": 125,
        "CTS VVT 4dr": 88
      };
    } else if (markaAdi == 'Chevrolet') {
      modelMap = {
        "Corvette convertible 2dr": 118,
        "Corvette 2dr": 117,
        "Suburban 1500 LT": 359,
        "SSR": 327,
        "Tahoe LT": 368,
        "Silverado SS": 349,
        "Avalanche 1500": 62,
        "TrailBlazer LT": 382,
        "Impala SS 4dr": 195,
        "Venture LS": 389,
        "Astro": 61,
        "Impala LS 4dr": 194,
        "Monte Carlo SS 2dr": 248,
        "Malibu LT 4dr": 236,
        "Malibu Maxx LS": 237,
        "Impala 4dr": 193,
        "Monte Carlo LS 2dr": 247,
        "Malibu LS 4dr": 235,
        "Silverado 1500 Regular Cab": 348,
        "Tracker": 381,
        "Malibu 4dr": 234,
        "Colorado Z85": 109,
        "Cavalier LS 2dr": 99,
        "Cavalier 4dr": 98,
        "Cavalier 2dr": 97,
        "Aveo LS 4dr hatch": 66,
        "Aveo 4dr": 65
      };
    } else if (markaAdi == 'Chrysler') {
      modelMap = {
        "Town and Country Limited": 380,
        "Crossfire 2dr": 119,
        "300M Special Edition 4dr": 3,
        "Pacifica": 272,
        "Sebring Limited convertible 2dr": 334,
        "300M 4dr": 2,
        "Town and Country LX": 379,
        "Concorde LXi 4dr": 111,
        "PT Cruiser GT 4dr": 270,
        "Sebring convertible 2dr": 336,
        "Concorde LX 4dr": 110,
        "PT Cruiser Limited 4dr": 271,
        "Sebring Touring 4dr": 335,
        "Sebring 4dr": 333,
        "PT Cruiser 4dr": 269
      };
    } else if (markaAdi == 'Dodge') {
      modelMap = {
        "Viper SRT-10 convertible 2dr": 392,
        "Grand Caravan SXT": 180,
        "Durango SLT": 129,
        "Intrepid ES 4dr": 200,
        "Intrepid SE 4dr": 201,
        "Caravan SE": 96,
        "Dakota Club Cab": 123,
        "Stratus SE 4dr": 357,
        "Ram 1500 Regular Cab ST": 296,
        "Stratus SXT 4dr": 358,
        "Dakota Regular Cab": 124,
        "Neon SXT 4dr": 257,
        "Neon SE 4dr": 256
      };
    } else if (markaAdi == 'Ford') {
      modelMap = {
        "Excursion 6.8 XLT": 149,
        "Thunderbird Deluxe convert w/hardtop 2d": 372,
        "Expedition 4.6 XLT": 150,
        "F-150 Supercab Lariat": 153,
        "Crown Victoria LX Sport 4dr": 122,
        "Explorer XLT V6": 151,
        "Mustang GT Premium convertible 2dr": 254,
        "Crown Victoria LX 4dr": 121,
        "Freestar SE": 166,
        "Crown Victoria 4dr": 120,
        "Taurus SES Duratec 4dr": 371,
        "Escape XLS": 148,
        "Taurus SE": 370,
        "F-150 Regular Cab XL": 152,
        "Taurus LX 4dr": 369,
        "Focus SVT 2dr": 158,
        "Mustang 2dr (convertible)": 253,
        "Focus ZTW": 159,
        "Focus ZX5 5dr": 161,
        "Focus SE 4dr": 157,
        "Ranger 2.3 XL Regular Cab": 298,
        "Focus LX 4dr": 156,
        "Focus ZX3 2dr hatch": 160
      };
    } else if (markaAdi == 'GMC') {
      modelMap = {
        "Yukon XL 2500 SLT": 412,
        "Yukon 1500 SLE": 411,
        "Envoy XUV SLE": 145,
        "Sierra HD 2500": 346,
        "Sierra Extended Cab 1500": 345,
        "Safari SLE": 331,
        "Sonoma Crew Cab": 352,
        "Canyon Z85 SL Regular Cab": 95
      };
    } else if (markaAdi == 'Honda') {
      modelMap = {
        "S2000 convertible 2dr": 309,
        "Pilot LX": 284,
        "Odyssey EX": 260,
        "Accord EX V6 2dr": 49,
        "Odyssey LX": 261,
        "Accord LX V6 4dr": 51,
        "Accord EX 2dr": 48,
        "Civic Hybrid 4dr manual (gas/electric)": 106,
        "CR-V LX": 87,
        "Accord LX 2dr": 50,
        "Civic Si 2dr hatch": 108,
        "Insight 2dr (gas/electric)": 199,
        "Element LX": 143,
        "Civic EX 4dr": 104,
        "Civic LX 4dr": 107,
        "Civic HX 2dr": 105,
        "Civic DX 2dr": 103
      };
    } else if (markaAdi == 'Hummer') {
      modelMap = {"H2": 187};
    } else if (markaAdi == 'Hyundai') {
      modelMap = {
        "XG350 L 4dr": 402,
        "XG350 4dr": 401,
        "Santa Fe GLS": 332,
        "Sonata LX 4dr": 351,
        "Sonata GLS 4dr": 350,
        "Tiburon GT V6 2dr": 373,
        "Elantra GT 4dr hatch": 142,
        "Elantra GT 4dr": 141,
        "Elantra GLS 4dr": 140,
        "Accent GT 2dr hatch": 47,
        "Accent GL 4dr": 46,
        "Accent 2dr hatch": 45
      };
    } else if (markaAdi == 'Infiniti') {
      modelMap = {
        "Q45 Luxury 4dr": 286,
        "M45 4dr": 227,
        "FX45": 155,
        "FX35": 154,
        "G35 4dr": 168,
        "I35 4dr": 189,
        "G35 Sport Coupe 2dr": 169,
      };
    } else if (markaAdi == 'Isuzu') {
      modelMap = {"Ascender S": 60, "Rodeo S": 305};
    } else if (markaAdi == 'Jaguar') {
      modelMap = {
        "XKR coupe 2dr": 407,
        "XK8 convertible 2dr": 405,
        "XJR 4dr": 404,
        "XK8 coupe 2dr": 406,
        "Vanden Plas 4dr": 388,
        "S-Type R 4dr": 308,
        "XJ8 4dr": 403,
        "S-Type 4.2 4dr": 307,
        "S-Type 3.0 4dr": 306,
        "X-Type 3.0 4dr": 396,
        "X-Type 2.5 4dr": 395
      };
    } else if (markaAdi == 'Jeep') {
      modelMap = {
        "Grand Cherokee Laredo": 181,
        "Wrangler Sahara convertible 2dr": 394,
        "Liberty Sport": 224
      };
    } else if (markaAdi == 'Kia') {
      modelMap = {
        "Amanti 4dr": 59,
        "Sedona LX": 337,
        "Sorento LX": 353,
        "Optima LX V6 4dr": 263,
        "Optima LX 4dr": 262,
        "Spectra GSX 4dr hatch": 356,
        "Spectra GS 4dr hatch": 355,
        "Spectra 4dr": 354,
        "Rio Cinco": 304,
        "Rio 4dr auto": 302,
        "Rio 4dr manual": 303
      };
    } else if (markaAdi == 'Land Rover') {
      modelMap = {
        "Range Rover HSE": 297,
        "Discovery SE": 128,
        "Freelander SE": 165
      };
    } else if (markaAdi == 'Lexus') {
      modelMap = {
        "LX 470": 213,
        "SC 430 convertible 2dr": 321,
        "LS 430 4dr": 208,
        "GS 430 4dr": 172,
        "GX 470": 175,
        "GS 300 4dr": 171,
        "RX 330": 292,
        "IS 300 SportCross": 192,
        "IS 300 4dr auto": 190,
        "ES 330 4dr": 134,
        "IS 300 4dr manual": 191
      };
    } else if (markaAdi == 'Lincoln') {
      modelMap = {
        "Navigator Luxury": 255,
        "Town Car Ultimate L 4dr": 378,
        "Town Car Ultimate 4dr": 377,
        "LS V8 Ultimate 4dr": 212,
        "Aviator Ultimate": 67,
        "Town Car Signature 4dr": 376,
        "LS V8 Sport 4dr": 211,
        "LS V6 Premium 4dr": 210,
        "LS V6 Luxury 4dr": 209
      };
    } else if (markaAdi == 'MINI') {
      modelMap = {"Cooper S": 113, "Cooper": 112};
    } else if (markaAdi == 'Mazda') {
      modelMap = {
        "MPV ES": 230,
        "RX-8 4dr manual": 294,
        "RX-8 4dr automatic": 293,
        "MX-5 Miata LS convertible 2dr": 232,
        "MX-5 Miata convertible 2dr": 233,
        "B4000 SE Cab Plus": 70,
        "Tribute DX 2.0": 383,
        "Mazda6 i 4dr": 244,
        "Mazda3 s 4dr": 243,
        "Mazda3 i 4dr": 242,
        "B2300 SX Regular Cab": 69
      };
    } else if (markaAdi == 'Mercedes-Benz') {
      modelMap = {
        "S500 4dr": 314,
        "G500": 170,
        "S430 4dr": 313,
        "E500 ": 132,
        "E500 4dr": 133,
        "SLK32 AMG 2dr": 325,
        "CLK500 coupe 2dr (convertible)": 86,
        "C32 AMG 4dr": 78,
        "E320": 130,
        "E320 4dr": 131,
        "ML500": 229,
        "CLK320 coupe 2dr (convertible)": 85,
        " SLK230 convertible 2dr": 324,
        "C320 4dr": 79,
        "C320 Sport 4dr": 81,
        "C240": 76,
        "C240 4dr ": 77,
        "C320 Sport 2dr ": 80,
        "C230 Sport 2dr ": 75,
        "CL600 2dr ": 84,
        "SL600 convertible 2dr": 323,
        "SL55 AMG 2dr ": 322
      };
    } else if (markaAdi == 'Mercury') {
      modelMap = {
        "Marauder 4dr": 238,
        "Monterey Luxury": 249,
        "Grand Marquis LS Ultimate 4dr": 184,
        "Mountaineer": 251,
        "Grand Marquis LS Premium 4dr": 183,
        "Grand Marquis GS 4dr": 182,
        "Sable LS Premium 4dr": 330,
        "Sable GS": 328,
        "Sable GS 4dr": 329
      };
    } else if (markaAdi == 'Mitsubishi') {
      modelMap = {
        "Montero XLS": 250,
        "Endeavor XLS": 144,
        "Lancer Evolution 4dr": 215,
        "Diamante LS 4dr": 127,
        "Eclipse Spyder GT convertible 2dr": 139,
        "Galant GTS 4dr": 177,
        "Eclipse GTS 2dr": 138,
        "Galant ES 2.4L 4dr": 176,
        "Outlander LS": 268,
        "Lancer Sportback LS": 218,
        "Lancer OZ Rally 4dr auto": 217,
        "Lancer LS 4dr": 216,
        "Lancer ES 4dr": 214
      };
    } else if (markaAdi == 'Nissan') {
      modelMap = {
        "50Z Enthusiast convertible 2dr": 13,
        "Pathfinder Armada SE": 280,
        "Quest SE": 288,
        "Maxima SL 4dr": 241,
        "Murano SL": 252,
        "Maxima SE 4dr": 240,
        "Pathfinder SE": 281,
        "350Z coupe 2dr": 14,
        "Titan King Cab XE": 374,
        "Quest S": 287,
        "Altima SE 4dr": 58,
        "Xterra XE V6": 410,
        "Frontier King Cab XE V6": 167,
        "Altima S 4dr": 57,
        "Sentra SE-R 4dr": 340,
        "Sentra 1.8 S 4dr": 339,
        "Sentra 1.8 4dr": 338
      };
    } else if (markaAdi == 'Oldsmobile') {
      modelMap = {
        "Silhouette GL": 347,
        "Alero GLS 2dr": 55,
        "Alero GX 2dr": 56
      };
    } else if (markaAdi == 'Pontiac') {
      modelMap = {
        "Bonneville GXP 4dr": 72,
        "GTO 2dr": 174,
        "Montana EWB": 246,
        "Grand Prix GT2 4dr": 186,
        "Montana": 245,
        "Grand Am GT 2dr": 179,
        "Grand Prix GT1 4dr": 185,
        "Aztekt": 68,
        "Sunfire 1SC 2dr": 361,
        "Vibe": 391,
        "Sunfire 1SA 2dr": 360
      };
    } else if (markaAdi == 'Porsche') {
      modelMap = {
        "911 Carrera 4S coupe 2dr (convert)": 28,
        "911 Carrera convertible 2dr (coupe)": 29,
        "911 Targa coupe 2dr": 31,
        "Cayenne S": 100,
        "Boxster S convertible 2dr": 73,
        "Boxster convertible 2dr": 74,
        "911 GT2 2dr": 30
      };
    } else if (markaAdi == 'Saab') {
      modelMap = {
        "9-3 Aero convertible 2dr": 22,
        "9-5 Aero": 25,
        "9-3 Arc convertible 2dr": 24,
        "9-5 Aero 4dr": 26,
        "9-5 Arc 4dr": 27,
        "9-3 Aero 4dr": 21,
        "9-3 Arc Sport 4dr": 23
      };
    } else if (markaAdi == 'Saturn') {
      modelMap = {
        "L300 2": 206,
        "L300-2 4dr": 207,
        "VUE": 387,
        "lon3 quad coupe 2dr": 418,
        "lon3 4dr": 417,
        "lon2 quad coupe 2dr": 416,
        "lon2 4dr": 415,
        "Ion1 4dr": 202
      };
    } else if (markaAdi == 'Scion') {
      modelMap = {"xB": 420, "xA 4dr hatch": 419};
    } else if (markaAdi == 'Subaru') {
      modelMap = {
        "Outback H-6 VDC 4dr": 265,
        "Impreza WRX STi 4dr": 198,
        "Outback H6 4dr": 266,
        "Outback Limited Sedan 4dr": 267,
        "Legacy GT 4dr": 222,
        "Impreza WRX 4dr": 197,
        "Baja": 71,
        "Outback": 264,
        "Forester X": 164,
        "Legacy L 4dr": 223,
        "Impreza 2.5 RS 4dr": 196
      };
    } else if (markaAdi == 'Suzuki') {
      modelMap = {
        "XL-7 EX": 408,
        "Verona LX 4dr": 390,
        "Vitara LX": 393,
        "Aerio SX": 54,
        "Forenza EX 4dr": 162,
        "Aerio LX 4dr": 53,
        "Aeno S 4dr": 52,
        "Forenza S 4dr": 163
      };
    } else if (markaAdi == 'Toyota') {
      modelMap = {
        "Land Cruiser": 219,
        "Sequoia SR5": 341,
        "Avalon XLS 4dr": 64,
        "Sienna XLE Limited": 344,
        "Highlander V6": 188,
        "4Runner SR5 V6": 15,
        "Avalon XL 4dr": 63,
        "Camry Solara SLE V6 2dr": 93,
        "Tundra Access Cab V6 SR5": 384,
        "Camry XLE V6 4dr": 94,
        "MR2 Spyder convertible 2dr": 231,
        "Sienna CE": 343,
        "Camry LE V6 4dr": 90,
        "Celica GT-S 2dr": 101,
        "Camry Solara SE V6 2dr": 92,
        "Prius 4dr (gas/electric)": 285,
        "RAV4": 289,
        "Camry Solara SE 2dr": 91,
        "Camry LE 4dr": 89,
        " Matrix XR": 239,
        "Tundra Regular Cab V6 ": 385,
        "Corolla LE 4dr": 115,
        "Corolla S 4dr": 116,
        "Corolla CE 4dr": 114,
        "Tacoma": 367,
        "Echo 2dr auto": 135,
        "Echo 4dr": 137,
        "Echo 2dr manual": 136
      };
    } else if (markaAdi == 'Volkswagen') {
      modelMap = {
        "Phaeton W12 4dr": 283,
        "Phaeton 4dr": 282,
        "Passat W8": 278,
        "Passat W8 4MOTION 4dr": 279,
        "Touareg V6": 375,
        "Passat GLX V6 4MOTION 4dr": 277,
        "Passat GLS 1.8T": 275,
        "Passat GLS 4dr": 276,
        "Jetta GLI VR6 4dr": 204,
        "New Beetle GLS convertible 2dr": 259,
        "Jetta GLS TDI 4dr": 205,
        "New Beetle GLS 1.8T 2dr": 258,
        "GTI 1.8T 2dr hatch": 173,
        "Jetta GL": 203,
        "Golf GLS 4dr": 178
      };
    } else if (markaAdi == 'Volvo') {
      modelMap = {
        "S80 T6 4dr": 320,
        "C70 HPT convertible 2dr": 82,
        "XC90 T6": 400,
        "C70 LPT convertible 2dr": 83,
        "S80 2.5T 4dr": 318,
        "S80 2.9 4dr": 319,
        "S60 R 4dr": 316,
        "XC70": 399,
        "S60 T5 4dr": 317,
        "S60 2.5 4dr": 315,
        "V40": 386,
        "S40 4dr": 312
      };
    } else {
      modelMap = {};
    }
  }
//Telefon
Map<String, int> telefonMarkalari = {
    "Apple": 0,
    "Huawei": 1,
    "Omix": 2,
    "Oneplus": 3,
    "Oppo": 4,
    "Realme": 5,
    "Samsung": 6,
    "Tecno": 7,
    "Vestel": 8,
    "Xiaomi": 9
  };
Map<String, int> deceit = {'Evet': 0, 'Hayır': 1};
Map<String, int> modelPcMap = {};
void updatePcModels(var markaAdi) {
    if (markaAdi == 'Xiaomi') {
      modelPcMap = {
        ":Redmi Note 9": 99,
        ":Redmi 9T": 94,
        ":Mi Note 10 Lite": 80,
        ":Redmi Note 8": 97,
        ":Mi 11 Lite": 78,
        ":Mi 8 Lite": 79,
        ":Redmi Note 9S": 101,
        ":Redmi Note 9 Pro": 100,
        ":Redmi Note 8 Pro": 98,
        ":Redmi 10s": 93,
        ":Redmi Note 7": 96,
        ":Poco X3 NFC": 88,
        ":Redmi Note 10": 95,
        ":Poco M3 Pro": 87
      };
    } else if (markaAdi == 'Vestel') {
      modelPcMap = {"Venüs V6": 119};
    } else if (markaAdi == 'Huawei') {
      modelPcMap = {
        "P30 Lite": 85,
        "P40 Lite": 86,
        "Mate 10 Lite": 76,
        "Mate 20 Lite": 77,
        "P20 Lite": 84
      };
    } else if (markaAdi == 'Oppo') {
      modelPcMap = {
        "A5": 3,
        "A5 2020": 4,
        "A9": 10,
        "A91": 11,
        "A72": 7,
        "Reno 4": 102,
        "A73": 8,
        "Reno 4 Lite": 103,
        "A74": 9,
        "A52": 5,
        "AX7": 12,
        "A15s": 0,
        "Reno5 Lite": 104,
        "A31 64 GB Siyah": 1,
        "A5s": 6
      };
    } else if (markaAdi == 'Oneplus') {
      modelPcMap = {
        "Oneplus   Nord N10 5G": 83,
      };
    } else if (markaAdi == 'Realme') {
      modelPcMap = {
        "Realme   C25s": 91,
        "Realme   C21Y": 90,
        "Realme   C15": 89,
        "Realme 6i": 92
      };
    } else if (markaAdi == 'Tecno') {
      modelPcMap = {
        "Tecno Pova 128GB": 118,
      };
    } else if (markaAdi == 'Omix') {
      modelPcMap = {
        "Omix X500": 82,
      };
    } else if (markaAdi == 'Apple') {
      modelPcMap = {
        "iPhone 12 Pro Max": 126,
        "iPhone 12 Pro": 125,
        "iPhone 12": 123,
        "iPhone SE 2020": 139,
        "iPhone 12 Mini": 124,
        "iPhone 8 Plus": 137,
        "iPhone SE": 138,
        "iPhone 6S Plus": 133,
        "iPhone 8": 136,
        "iPhone 6 Plus": 131,
        "iPhone XR": 141,
        "iPhone 7 Plus": 135,
        "iPhone 6": 130,
        "iPhone 13 Pro Max": 129,
        "iPhone 11": 120,
        "iPhone XS Max": 143,
        "iPhone 13 Pro": 128,
        "iPhone 7": 134,
        "iPhone 11 Pro": 121,
        "iPhone 11 Pro Max": 122,
        "iPhone 6S": 132,
        "iPhone XS": 142,
        "iPhone X": 140,
        "iPhone 13": 127
      };
    } else if (markaAdi == 'Samsung') {
      modelPcMap = {
        "Note 9": 81,
        "SM-A920F A9": 106,
        "SM-A325F A32": 105,
        "Galaxy Note 9": 50,
        "SM-A920F A9 2018": 107,
        "Galaxy S22 Ultra": 69,
        "Galaxy Note 10 Lite": 45,
        "SM-M315F M31": 115,
        "Galaxy A30S SM-A307FN/D": 27,
        "Galaxy S20 Ultra": 59,
        "Galaxy S21 5G": 61,
        "SM-N960F Note 9": 117,
        "Galaxy A30S SM-A307FN/DS": 28,
        "Galaxy S21 Ultra 5G": 68,
        "A32": 2,
        "SM-N950F Note 8": 116,
        "Galaxy S8 Plus SM-G955F": 72,
        "Galaxy A70 SM-A705FN": 37,
        "SM-G980F S20": 113,
        "Galaxy S20 Plus": 58,
        "Galaxy S21 FE 5G": 63,
        "Galaxy S10 Plus": 53,
        "Galaxy S10E": 54,
        "Galaxy Note 20 Ultra": 48,
        "Galaxy A52": 35,
        "SM-G955F S8 + Plus": 109,
        "Galaxy A50 SM-A505F": 33,
        "Galaxy S10": 51,
        "SM-G950F S8": 108,
        "Galaxy S9 SM-G960F": 74,
        "Galaxy S10 Lite": 52,
        "Galaxy A31": 30,
        "Galaxy S21 FE 5G SM-G990E": 64,
        "Galaxy A51": 34,
        "Galaxy S20": 56,
        "Galaxy M31S": 42,
        "Galaxy A71": 38,
        "Galaxy S20 FE": 57,
        "Galaxy S21": 60,
        "SM-G965FS9 + Plus": 112,
        "Galaxy A30 SM-A305F": 26,
        "Galaxy S21 FE 5G SM-G990e": 65,
        "SM-G965F S9 + Plus": 111,
        "SM-M205F M20": 114,
        "SM-G960F S9": 110,
        "Galaxy S21 Plus 5G": 67,
        "Galaxy Note 20": 47,
        "Galaxy M11": 40,
        "Galaxy A21s": 23,
        "Galaxy A20S": 21,
        "Galaxy A20 SM-A205F": 20,
        "Galaxy Z Flip3 SM-F711": 75,
        "Galaxy S21 Plus": 66,
        "Galaxy Note 10 Plus": 46,
        "Galaxy S21 FE": 62,
        "Galaxy Note 10": 44,
        "Galaxy A72": 39,
        "Galaxy M52": 43,
        "Galaxy S10e": 55,
        "Galaxy A32": 31,
        "Galaxy Note 8": 49,
        "Galaxy A70": 36,
        "Galaxy A22": 24,
        "Galaxy S9": 73,
        "Galaxy S8": 70,
        "Galaxy S8 Plus": 71,
        "Galaxy M30s": 41,
        "Galaxy A50": 32,
        "Galaxy A30s": 29,
        "Galaxy A30": 25,
        "Galaxy A12": 18,
        "Galaxy A03s": 15,
        "Galaxy A20s": 22,
        "Galaxy A20": 19,
        "Galaxy A02S": 14,
        "Galaxy A11": 17,
        "Galaxy A02": 13,
        "Galaxy A10": 16
      };
    }else {
      modelPcMap = {};
    }
    print("BURADAAAA");
  }


}
