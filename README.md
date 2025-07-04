# 🚦Traffic Light Controller - Verilog

A Finite State Machine (FSM)-based traffic light controller implemented using Verilog HDL. The design follows a Moore FSM model for output control based on current states only.

---

## 📁 Project Structure
```

├── FSM_traffic_light.v # Main traffic light controller module.
├── FSM_traffic_light_tb.v # Testbench for simulation.
├── trafficlight_op.png # compiiled output (generated after simulation).
├── traffic_lightwaveform.png # Waveform output (generated after simulation).
├── README.md # Project documentation.
└── .gitignore # Git ignore rules

```

---

## 📋 Module Description

##### `FSM_traffic_light.v`

- Inputs:
  - ⏱️`clk`: Clock signal.
  - 🔁`reset`: Asynchronous reset.
- Outputs:
  - ↕️`nslight`: North-South light (3 bits: RED/YELLOW/GREEN).
  - ↔️`ewlight`: East-West light (3 bits: RED/YELLOW/GREEN).

### State Encoding

```verilog
NSgreen   = 2'b00;
NSyellow  = 2'b01;
EWgreen   = 2'b10;
EWyellow  = 2'b11;
```
### Light Encoding

```verilog
🟥 RED    = 3'b100;
🟨 YELLOW = 3'b010;
🟩 GREEN  = 3'b001;
```
### Timing

Green states: 5 clock cycles
Yellow states: 2 clock cycles

-----

### 🧪 Testbench:

##### `FSM_traffic_light_tb.v`

Generates a 10 ns period clock.
Applies reset and simulates the traffic light for 300 ns.
Generates a traffic_light.vcd waveform file for inspection.

----

### ▶️ Running the Simulation

You can run the simulation using any Verilog simulator like Icarus Verilog:

#### Compile

##### `trafficlight_op.png`

the output has been uploaded in file above

#### View waveform

##### `traffic_lightwaveform.png`

above file shows the waveform after creating a file traffic_light.vcd

---

### 📦 Dependencies

Icarus Verilog

GTKWave (for viewing waveforms)


-------------------

👤 Author
Dhiraj Sharma M S – GitHub Profile(https://github.com/Dhiraj4-alt)
