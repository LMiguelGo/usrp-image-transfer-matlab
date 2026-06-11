# QPSK Image Transmission System via USRP

This project implements a digital communication link to transmit images between two computers using **Ettus USRP** hardware and **MATLAB/Simulink**. Developed as part of the *Telecommunications Systems Lab II* at the **University of Cauca**.

> **Origin Note:** This project is an adaptation of the official MATLAB & Simulink hardware examples: [QPSK Transmitter with USRP Hardware](https://la.mathworks.com/help/comm/usrpradio/ug/qpsk-transmitter-with-usrp-hardware-in-simulink.html) and [QPSK Receiver with USRP Hardware](https://la.mathworks.com/help/comm/usrpradio/ug/qpsk-receiver-with-usrp-hardware-in-simulink.html). The original models were customized, refactored, and extended to support full image processing, compression, serialization, and end-to-end image transmission.

---

## Getting Started

To ensure all functions and models work correctly, follow these steps on both computers:

1. **Clone the repository:**
     ```bash
     git clone -b main --single-branch https://github.com/LMiguelGo/usrp-image-transfer-matlab.git
     ```

2. **Setup the MATLAB Path:**
   Open MATLAB and run the `setup.m` script located in the root folder. This will automatically add all subfolders (`src/*`, `data/*`, `utils`) to your workspace.

---

## Deployment Instructions (Dual-PC Setup)

The system is designed to run using two separate computers: one acting as the **Transmitter (TX)** and the other as the **Receiver (RX)**. Follow this strict execution order:

### 1. Transmitter Configuration (PC 1)
1. Navigate to `src/ImageLoader/` and run the `main.m` script. This will load, compress, and prepare the image data for transmission.
2. Navigate to `src/Transmitter/` and open the Simulink model `sdruqpsktx.slx`.
3. Ensure the 900MHz antenna are securely connected to the **USRP B210**. Then, connect the USRP to PC1 via the USB interface.
4. Verify that your MATLAB/Simulink environment recognizes the connected **USRP B210** hardware (check the USRP Transmitter block).
5. Run the Simulink model to start broadcasting the data.

### 2. Receiver Configuration (PC 2)
1. Navigate to `src/Receiver/` and open the Simulink model `sdruqpskrx.slx`.
2. Ensure the 900MHz antenna are securely connected to the **USRP B210**. Then, connect the USRP to PC2 via the USB interface.
3. Verify that your MATLAB/Simulink environment recognizes the connected **USRP B210** hardware (check the USRP Transmitter block).

   **IMPORTANT:** Ensure the Transmitter (PC 1) is already running before starting the receiver.

4. Run the Simulink model for **at least 40 seconds** to guarantee that the full image payload is successfully captured and saved to disk.
5. Once the data capture is complete, navigate to `src/ImageLoader/` and run `main.m` (this initializes the environment with the required image structural data).
6. Finally, navigate to `src/ImageRecovery/` and run `main.m`. This script will reconstruct the received bits, decode the image, calculate the Bit Error Rate (BER), and display the comparison between the original and transmitted images.

---

## Project Structure

The repository is organized as follows to maintain a professional workflow:

```
/
├── docs/                                                # Project documentation and sprint reports.
│   ├── Sprint2_Documentation.pdf
│   ├── Sprint3_Documentation.pdf
│   ├─  Sprint4_Documentation.pdf
│   └── Final_Documentation.pdf
├── src/                                                 # Main source code of the project.
│   ├── ImageLoader/                                     # Image processing, serialization, and compression scripts (.m).
│   │   ├── adaptar_tamano.m
│   │   ├── anadir_cabecera.m
│   │   ├── cargar_imagen.m
│   │   ├── comprimir_paleta.m
│   │   ├── convertir_binario.m
│   │   ├── main.m
│   │   └── serializar_pixeles.m
│   ├── ImageRecovery/                                   # Image reconstruction, decompression, and validation scripts (.m).
│   │   ├── calcular_ber.m
│   │   ├── comparar_imagenes.m
│   │   ├── convertir_decimal.m
│   │   ├── descompress_paleta.m
│   │   ├── deserializar_matriz.m
│   │   ├── deserializar_pixeles.m
│   │   ├── eliminar_cabecera.m
│   │   ├── extraer_tramas.m
│   │   └── main.m
│   ├── Receiver/                                        # Simulink RX model and initialization scripts.
│   │   ├── sdruqpskrx.slx
│   │   └── sdruQPSKReceiverSLInit.m
│   ├── Transmitter/                                     # Simulink TX model and initialization scripts.
│   │   ├── sdruqpsktx.slx
│   │   └── sdruQPSKTransmitterSLInit.m
│   └── utils/                                           # Auxiliary files, color palettes, and structural data.
│       └── paleta_colores.mat
├── data/                                                # Input and output data.
│   ├── input/                                           # Original images for testing (e.g., italy.jpg).
│   │   └── italy.jpg
│   └── output/                                          # Received data example (bits)
│       └── data_recv.mat
├── tests/                                               # Modular scripts for isolated environment testing.
├── .gitignore                                           # Excludes MATLAB/Simulink temporary and cache files.
├── setup.m                                              # Environment configuration script.
└── README.md                                            # Project description, team members, and usage guide.
```

---

## Technical Specifications

* **Software:** MATLAB R2025B / Simulink
* **Hardware:**
  * Ettus USRP B210 (Universal Software Radio Peripheral)
  * 2× 900 MHz Antennas (tuned/matched for B210) 

---

## Team Members

* **Briyith Vaneza Guacas** - Student
* **Karol Tatiana Palechor** - Student
* **Jose Martin Gonzalez** - Student
* **Luis Miguel Gomez** - Repository Lead / Student

**Electronics and Telecommunications Engineering**
University of Cauca (2026)
Popayán, Colombia

---
