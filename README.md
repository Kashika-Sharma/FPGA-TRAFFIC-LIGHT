
# 🚦 Traffic Light Controller (12 I/O) – Verilog Project

This project implements a fully functional traffic light controller using **Verilog HDL**. Designed with a simple yet effective finite state machine (FSM), the controller simulates the behavior of four traffic lights: **M1**, **M2**, **MT**, and **S**.

Each light outputs 3 bits (Red, Yellow, Green), for a total of **12 output lines**. Ideal for FPGA boards like **PyNQ-Z1/Z2**, this project demonstrates basic digital design principles including timing control, sequential logic, and real-world interfacing.

---

## ✨ Features

- ✅ Controls **4 independent traffic lights**
- ✅ Each light has **Red, Yellow, Green** (3-bit output)
- ✅ Finite State Machine with **6 defined states**
- ✅ Timed transitions simulate real-world traffic flow
- ✅ Testbench included for simulation in **Vivado**
- ✅ Compatible with **FPGA boards** like PyNQ (via GPIO/PMOD)

---

## 🧠 How It Works

The controller cycles through six traffic phases (S1 to S6), each lasting for a predefined number of seconds (internally converted into clock cycles). The transitions simulate normal vehicle and pedestrian flow across intersections.

Each traffic light is represented by:
- **3 bits**:  
  - `100` = Red  
  - `010` = Yellow  
  - `001` = Green  

The 12-bit output `lights` maps the signals in this order:
```verilog
lights = {M1[2:0], M2[2:0], MT[2:0], S[2:0]}
```

---

## 📦 File Structure

```
├── Traffic_Light_Controller.v        # Main Verilog module (12-bit output)
├── Traffic_Light_Controller_TB.v     # Testbench for simulation
├── README.md                         # This file
```

---

## 🛠 Tools Used

- **Vivado Design Suite** – For simulation and bitstream generation  
- **ModelSim / Vivado Simulator** – To test timing and state transitions  
- **PyNQ Board (optional)** – For real hardware implementation  
- **Jupyter + Pynq library (optional)** – If using Python to observe outputs

---


## 🔌 Output Mapping

If using LEDs on your FPGA board, map each 3-bit segment of `lights[11:0]` to a corresponding RGB LED or trio of single-color LEDs.

| Signal     | Bits      | Description             |
|------------|-----------|--------------------------|
| M1         | [11:9]    | Main Road 1 Traffic Light |
| M2         | [8:6]     | Main Road 2 Traffic Light |
| MT         | [5:3]     | Turning Lane Light       |
| S          | [2:0]     | Side Road / Pedestrian   |

---

## 📷 Demo

![WhatsApp Image 2025-07-31 at 1 09 23 PM (1)](https://github.com/user-attachments/assets/63c3aa66-12ba-4145-9bba-05b2e1da0439)
![WhatsApp Image 2025-07-31 at 1 09 23 PM](https://github.com/user-attachments/assets/ab578e6f-ceeb-4509-b48d-b61625e71bba)


## 🙌 Credits

Made with determination by Kashika Sharma, a student of digital design, exploring traffic systems through RTL design.

---
