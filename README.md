# QPSK Image Transmission System via USRP

This project implements a digital communication link to transmit images between two computers using **Ettus USRP** hardware and **MATLAB/Simulink**. Developed as part of the *Telecommunications Systems Lab II* at the **University of Cauca**.

---

## Getting Started

To ensure all functions and models work correctly, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/LMiguelGo/usrp-image-transfer-matlab.git
   ```

2. **Switch to development branch:**

   ```bash
   git checkout dev
   ```

3. **Setup the MATLAB Path:**

   Open MATLAB and run the `setup.m` script located in the root folder.
   This will automatically add all subfolders (`src`, `data`, `utils`) to your workspace.

4. **Open the Model:**

   Navigate to `src/simulink/` and open:

   * `tx.slx` for transmission
   * The respective reception model for RX

---

## Project Structure

The repository is organized as follows to maintain a professional workflow:

```
/
├── docs/                # Block diagrams, user manual, and final report.
├── src/                 # Main source code of the project.
│   ├── matlab/          # Image processing scripts (.m) (encoding/decoding).
│   ├── simulink/        # TX and RX models (.slx) with USRP blocks.
│   └── utils/           # Auxiliary functions and specific filters.
├── data/                # Input and output data.
│   ├── input/           # Original images for testing (e.g., italy.jpg).
│   └── output/          # Received images, constellation plots, and BER data.
├── tests/               # Small scripts for modular testing (e.g., QPSK only).
├── .gitignore           # Excludes MATLAB/Simulink temporary files.
└── README.md            # Project description, team members, and usage guide.
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
