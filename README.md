# QPSK Image Transmission System via USRP

This project implements a digital communication link to transmit images between two computers using **Ettus USRP** hardware and **MATLAB/Simulink**. Developed as part of the *Telecommunications Systems Lab II* at the **University of Cauca**.

---

## Getting Started

To ensure all functions and models work correctly, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone -b dev --single-branch https://github.com/LMiguelGo/usrp-image-transfer-matlab.git
   ```
   
   Note: for development copy the "dev" branch and for execution copy the "main" branch.
3. **Setup the MATLAB Path:**

   Open MATLAB and run the `setup.m` script located in the root folder.
   This will automatically add all subfolders (`src/*`, `data/*`, `utils`) to your workspace.

4. **Run the Simulation:**

   Depending on the node you are configuring, navigate to its respective folder inside `src/` and open the Simulink model:

   * For Transmission: Open `src/QPSKTransmitterWithUSRPHardwareInSimulinkExample/sdruqpsktx.slx`
   * For Reception: Open `src/QPSKReceiverWithUSRPHardwareInSimulinkExample/sdruqpskrx.slx`

   To run the transmitter node, you must first run the `src\ImageLoader\main.m` file. 

---

## Project Structure

The repository is organized as follows to maintain a professional workflow:

```
/
├── docs/                                                # Project documentation and sprint reports.
│   ├── Sprint2_Documentation.pdf
│   ├── Sprint3_Documentation.pdf
│   └── Sprint4_Documentation.pdf
├── src/                                                 # Main source code of the project.
│   ├── ImageLoader/                                     # Image processing, serialization, and compression scripts (.m).
│   │   ├── adaptar_tamano.m
│   │   ├── cargar_imagen.m
│   │   ├── comprimir_paleta.m
│   │   ├── convertir_binario.m
│   │   ├── main.m
│   │   └── serializar_pixeles.m
│   ├── QPSKReceiverWithUSRPHardwareInSimulinkExample/    # Simulink RX model and initialization scripts.
│   │   └── sdruqpskrx.slx
│   ├── QPSKTransmitterWithUSRPHardwareInSimulinkExample/ # Simulink TX model and initialization scripts.
│   │   └── sdruqpsktx.slx
│   └── utils/                                           # Auxiliary files, color palettes, and structural data.
│       ├── datossi.mat
│       └── paleta_colores.mat
├── data/                                                # Input and output data.
│   ├── input/                                           # Original images for testing (e.g., italy.jpg).
│   └── output/                                          # Received images and processing results.
├── tests/                                               # Modular scripts for isolated environment testing.
├── .gitignore                                           # Excludes MATLAB/Simulink temporary and cache files.
├── setup.m                                              # Environment configuration script.
└── README.md                                            # Project description, team members, and usage guide.
```

---

## Technical Specifications

* **Software:** MATLAB R2025B / Simulink
* **Hardware:** Ettus USRP (Universal Software Radio Peripheral)
* **Modulation:** QPSK (Quadrature Phase Shift Keying)
* **Encoding:** Digital image serialization and palette compression

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
