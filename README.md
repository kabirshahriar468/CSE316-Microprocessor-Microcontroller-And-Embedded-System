# CSE 316 - Microprocessor, Microcontroller and Embedded System Sessional

This repository contains coursework, assignments, experiments, and projects for the CSE 316 course on Microprocessor, Microcontroller and Embedded Systems.

## 📋 Table of Contents

- [Course Overview](#course-overview)
- [Repository Structure](#repository-structure)
- [Assembly Programming](#assembly-programming)
- [Microcontroller Experiments](#microcontroller-experiments)
- [Projects](#projects)
- [Tools and Software](#tools-and-software)
- [Getting Started](#getting-started)

## 📚 Course Overview

This course covers fundamental concepts of:
- Assembly Language Programming (8086)
- Microcontroller Programming (ATmega32)
- Embedded System Design
- Hardware-Software Interface
- Digital I/O Operations
- ADC/DAC Operations
- LCD Display Interfacing

## 📁 Repository Structure

```
├── Assembly codes/           # Assembly language programming exercises
│   ├── B1 - week 1/         # Week 1 basic programs
│   └── Batch 17 Offline 1/  # Offline assignment solutions
├── Assembly Resources/       # Learning materials and templates
├── AT mega32/               # ATmega32 development tools and setup
├── Experiments/             # Lab experiments and simulations
│   ├── ADC-exp3/           # ADC experiment
│   └── LCD Display/        # LCD interfacing experiment
├── MicroController Labsheet/ # Lab experiment documentation
├── offline-01 (Assembly)/   # Assembly offline assignments
├── offline-02(Assembly)/    # Assembly offline assignments
├── online/                  # Online exam solutions
└── Project/                 # Course project files
```

## 🔧 Assembly Programming

### Basic Programs (Week 1)
- **ADD X,2 WITH NEWLINE.asm** - Basic arithmetic operations
- **INPUT 1 DIGIT NUMBERS, OUTPUT THEIR SUM.asm** - Input/output operations
- **OUTPUT PREVIOUS LETTER IN LOWERCASE.asm** - Character manipulation

### Advanced Programs
- **1_s complement.asm** - Binary operations
- **25-(X+Y).ASM** - Complex arithmetic expressions
- **2X-3Y.asm** - Multi-variable calculations
- **Y-X+1.asm** - Expression evaluation

### Key Features
- 8086 Assembly Language
- DOS interrupts for I/O operations
- Character and numeric data handling
- Conditional operations and branching

## 🧪 Microcontroller Experiments

### Experiment 1: Basic I/O Operations
- Digital input/output with ATmega32
- LED control and switch interfacing

### Experiment 2: LCD Display Interface
- 16x2 LCD display connection
- Character and string display
- Custom character generation

### Experiment 3: ADC Operations
- Analog-to-Digital conversion
- Sensor data acquisition
- Voltage measurement and display

### Experiment 4: Advanced Projects
- Temperature sensor interfacing
- LED matrix control
- Integrated sensor systems

## 🚀 Projects

### LCD Display Project
- **Language**: C (AVR-GCC)
- **Microcontroller**: ATmega32
- **Features**: 
  - LCD interfacing using 4-bit mode
  - ADC integration for sensor readings
  - Real-time data display

### Pollution Detector
- Environmental monitoring system
- Multiple sensor integration
- Data logging and display

## 🛠️ Tools and Software

### Development Environment
- **Atmel Studio 7.0** - Primary IDE for microcontroller programming
- **Proteus 8** - Circuit simulation and PCB design
- **MASM/TASM** - Assembly language assembler

### Hardware
- **ATmega32** microcontroller
- **16x2 LCD Display**
- Various sensors (temperature, gas, etc.)
- Development boards and prototyping components

## ⚡ Getting Started

### For Assembly Programming
1. Install MASM or compatible assembler
2. Use the provided `template.asm` as a starting point
3. Compile and run using DOS environment or emulator

```assembly
.MODEL SMALL
.STACK 100H
.DATA
    ; Your data declarations here

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Your code here
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
```

### For Microcontroller Programming
1. Install Atmel Studio 7.0
2. Set up ATmega32 development board
3. Use provided header files (`lcd.h`, `adc.h`)
4. Program and simulate using Proteus

### Prerequisites
- Basic understanding of digital logic
- Familiarity with C programming
- Knowledge of computer architecture

## 📖 Resources

- **Assembly&Atmega32AllSlidesMerged.pdf** - Complete course slides
- **Lecture-1.pdf, Lecture-2.pdf** - Individual lecture materials
- **template.asm** - Assembly programming template
- Lab experiment documentation in `MicroController Labsheet/`

## 🎓 Student Information

- **Student ID**: 2005114
- **Course**: CSE 316 - Microprocessor, Microcontroller and Embedded System Sessional
- **Academic Level**: L3 T1

## 📝 Assignment Status

### Completed Assignments
- ✅ Offline Assignment 1 (Assembly)
- ✅ Offline Assignment 2 (Assembly)
- ✅ Online Examination 1
- ✅ Lab Experiments 1-4
- ✅ Course Project

### File Naming Convention
- Assembly files: `2005114_[assignment]_[problem].asm`
- C files: `main.c` with project-specific names
- Documentation: Descriptive names with experiment details

## 🔧 Troubleshooting

### Common Issues
1. **Assembly compilation errors**: Check syntax and directive usage
2. **Microcontroller programming issues**: Verify pin connections and fuse settings
3. **Simulation problems**: Ensure correct component values in Proteus

### Support Resources
- Course slides and lecture materials
- Lab experiment guides
- Online documentation for ATmega32

---

**Note**: This repository contains educational materials for academic purposes. All code and documentation are part of coursework for CSE 316 at the university level.
