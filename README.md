# 🔎 Open Port Scan and Service Mapping

<p align="center">

**Automated Network Reconnaissance & Service Discovery using Nmap and Bash**

[![Linux](https://img.shields.io/badge/Linux-Ubuntu-orange?logo=linux)](https://ubuntu.com/)
[![Bash](https://img.shields.io/badge/Script-Bash-green?logo=gnu-bash)](https://www.gnu.org/software/bash/)
[![Nmap](https://img.shields.io/badge/Scanner-Nmap-blue)](https://nmap.org/)
[![Git](https://img.shields.io/badge/Version%20Control-Git-F05032?logo=git)](https://git-scm.com/)
[![GitHub](https://img.shields.io/badge/Repository-GitHub-black?logo=github)](https://github.com/)


</p>

---

## 📌 Project Overview

**Open Port Scan and Service Mapping** is a network security reconnaissance project designed to identify **open TCP ports and the services running on authorized target systems**.

The project uses **Nmap** as the primary scanning tool and **Bash** to automate the scanning process across multiple IP addresses.

The scanner performs a complete TCP port scan from **1–65535**, identifies open ports, and then performs **service and version detection** on the discovered ports.

All scan results are preserved in raw Nmap formats for verification, analysis, and reporting.

---

## 🎯 Project Objectives

The main objectives of this project are:

* 🔍 Identify open TCP ports on authorized systems.
* 🛠️ Discover services running on open ports.
* 🧩 Detect service and software versions where possible.
* ⚙️ Automate scanning of multiple IP addresses using Bash.
* 📡 Perform full TCP port scanning from ports `1–65535`.
* 📁 Preserve raw Nmap scan results.
* 📊 Analyze network exposure and accessible services.
* 📝 Generate a consolidated project report.

---

## ✨ Key Features

* **Full TCP Port Scanning** — Scans all ports from `1–65535`.
* **Multi-Target Scanning** — Supports scanning multiple authorized IP addresses.
* **Bash Automation** — Automates the complete scanning workflow.
* **Open Port Detection** — Identifies accessible TCP ports.
* **Service Detection** — Identifies services running on discovered ports.
* **Version Detection** — Attempts to determine service/software versions.
* **Structured Results** — Stores results separately for each target.
* **Raw Evidence Preservation** — Maintains `.nmap`, `.gnmap`, and `.xml` outputs.
* **Project Reporting** — Provides consolidated scan results and documentation.

---

# 🏗️ System Architecture

The project follows a simple automated network reconnaissance architecture:

```text
                         ┌──────────────────────┐
                         │  Authorized Targets  │
                         │      targets.txt     │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │    Bash Automation   │
                         │     scan_all.sh      │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │     Nmap Scanner     │
                         │       -Pn -p-        │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │   Open Port          │
                         │   Identification     │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │ Service & Version    │
                         │ Detection (-sV)      │
                         └──────────┬───────────┘
                                    │
                         ┌──────────┴──────────┐
                         │                     │
                         ▼                     ▼
                ┌──────────────────┐   ┌──────────────────┐
                │   Raw Nmap Data  │   │  Project Reports │
                │ .nmap/.gnmap/XML │   │     reports/     │
                └──────────────────┘   └──────────────────┘
```

---

# 🔄 Project Workflow

The complete scanning workflow is:

```text
           ┌──────────────────────────┐
           │ 1. Load Target IPs       │
           │    from targets.txt      │
           └────────────┬─────────────┘
                        ↓
           ┌──────────────────────────┐
           │ 2. Validate Target IP    │
           └────────────┬─────────────┘
                        ↓
           ┌──────────────────────────┐
           │ 3. Perform Full TCP Scan │
           │       Nmap -Pn -p-       │
           └────────────┬─────────────┘
                        ↓
           ┌──────────────────────────┐
           │ 4. Identify Open Ports   │
           └────────────┬─────────────┘
                        ↓
           ┌──────────────────────────┐
           │ 5. Extract Open Ports    │
           └────────────┬─────────────┘
                        ↓
           ┌──────────────────────────┐
           │ 6. Service & Version     │
           │    Detection using -sV   │
           └────────────┬─────────────┘
                        ↓
           ┌──────────────────────────┐
           │ 7. Save Raw Nmap Output  │
           └────────────┬─────────────┘
                        ↓
           ┌──────────────────────────┐
           │ 8. Analyze Scan Results  │
           └────────────┬─────────────┘
                        ↓
           ┌──────────────────────────┐
           │ 9. Generate Final Report │
           └──────────────────────────┘
```

---

# 🛠️ Technologies & Tools

| Technology / Tool     | Purpose                           |
| --------------------- | --------------------------------- |
| 🐧 **Ubuntu / Linux** | Scanning environment              |
| 🐚 **Bash**           | Automation and scripting          |
| 🔎 **Nmap**           | Port and service scanning         |
| 🌐 **TCP/IP**         | Network communication             |
| 📦 **Git**            | Version control                   |
| 🐙 **GitHub**         | Repository and project management |
| 📝 **Markdown**       | Project documentation             |

### Nmap Options Used

| Option | Purpose                                          |
| ------ | ------------------------------------------------ |
| `-Pn`  | Skip host discovery and scan the target directly |
| `-p-`  | Scan all TCP ports from `1–65535`                |
| `-sV`  | Detect services and versions                     |
| `-oN`  | Save normal Nmap output                          |
| `-oG`  | Save grepable Nmap output                        |
| `-oX`  | Save XML Nmap output                             |

---

# 🔬 Scanning Methodology

## 1. Target Configuration

Authorized target IP addresses are stored in:

```text
targets.txt
```

Each IP address is placed on a separate line.

Example:

```text
192.0.2.10
192.0.2.20
192.0.2.30
```

---

## 2. Full TCP Port Scan

The project scans the complete TCP port range:

```bash

nmap -Pn -p- <TARGET_IP>

nmap -Pn -p- 192.68.38.99
```

The `-p-` option instructs Nmap to scan:

```text
1 → 65535
```

This allows the project to identify services running on both standard and non-standard ports.

---

## 3. Open Port Identification

After the full scan, the discovered open TCP ports are extracted from the Nmap results.

Only the identified open ports are passed to the next stage.

---

## 4. Service & Version Detection

Nmap performs service and version detection on the discovered open ports:

```bash
nmap -Pn -sV -p <OPEN_PORTS> <TARGET_IP>
```

Example:

```text
PORT     STATE SERVICE VERSION
22/tcp   open  ssh     OpenSSH
80/tcp   open  http
443/tcp  open  https
```

---

## 5. Result Storage

Each target receives its own directory under:

```text
scans/
```

This keeps scan results organized and preserves the original Nmap output for verification.

---

# 📁 Project Structure

```text
open-port-scan/
│
├── 📄 README.md
├── 📄 targets.txt
├── 🐚 scan_all.sh
│
├── 📂 scans/
│   │
│   ├── 📂 64.23.130.208/
│   │   ├── full-scan.nmap
│   │   ├── full-scan.gnmap
│   │   ├── full-scan.xml
│   │   └── service-detection.txt
│   │
│   ├── 📂 157.230.47.60/
│   │   └── ...
│   │
│   ├── 📂 159.223.62.168/
│   │   └── ...
│   │
│   └── 📂 .../
│
└── 📂 reports/
    ├── final-report.md
    └── raw-results.txt
```

### Directory Description

| File / Directory | Description                             |
| ---------------- | --------------------------------------- |
| `targets.txt`    | Contains authorized target IP addresses |
| `scan_all.sh`    | Main Bash automation script             |
| `scans/`         | Raw Nmap results organized by target    |
| `reports/`       | Final and raw project reports           |
| `README.md`      | Project documentation                   |

---

# 🚀 Installation

## Prerequisites

Before running the project, ensure the following are installed:

* Ubuntu/Linux
* Bash
* Nmap
* Git

### 1. Update Package Repository

```bash
sudo apt update
```

### 2. Install Nmap

```bash
sudo apt install nmap -y
```

### 3. Verify Nmap

```bash
nmap --version
```

### 4. Verify Bash

```bash
bash --version
```

### 5. Verify Git

```bash
git --version
```

---

# ▶️ Usage

## 1. Clone the Repository

```bash
git clone <YOUR-GITHUB-REPOSITORY-URL>
```

## 2. Enter the Project Directory

```bash
cd open-port-scan
```

## 3. Make the Script Executable

```bash
chmod +x scan_all.sh
```

## 4. Configure Authorized Targets

Open the target file:

```bash
nano targets.txt
```

Add one authorized IP address per line.

## 5. Run the Scanner

```bash
./scan_all.sh
```

The generated scan results will be stored inside:

```text
scans/
```

---

# 📊 Results

The project successfully scanned:

> **15 authorized IP addresses**

### Scan Configuration

| Parameter         | Value                     |
| ----------------- | ------------------------- |
| Target IPs        | **15**                    |
| Protocol          | **TCP**                   |
| Port Range        | **1–65535**               |
| Host Discovery    | Skipped using `-Pn`       |
| Service Detection | Enabled using `-sV`       |
| Automation        | Bash                      |
| Scanner           | Nmap                      |
| Output Formats    | `.nmap`, `.gnmap`, `.xml` |
| Project Status    | ✅ Completed               |

### Overall Findings

The scans identified multiple types of network services, including:

* SSH
* HTTP
* HTTPS
* DNS
* Database-related services
* Application/API services
* Services operating on non-standard ports

**TCP/22 (SSH)** was commonly identified across the scanned targets, while several targets exposed additional web, DNS, database, and application-related services.

Detailed target-by-target results are preserved in the `scans/` directory.

---

# 📄 Scan Output & Evidence

The project preserves the original Nmap outputs generated during scanning.

### `.nmap`

Normal Nmap output containing detailed scan information.

```text
full-scan.nmap
```

### `.gnmap`

Grepable Nmap output useful for automated processing and extraction.

```text
full-scan.gnmap
```

### `.xml`

Structured Nmap output suitable for further processing and integration with other tools.

```text
full-scan.xml
```

### `service-detection.txt`

Contains service and version detection results where generated.

---

## 📋 Project Reports

The repository contains two main report files:

### Final Report

```text
reports/final-report.md
```

Contains the consolidated project analysis and findings.

### Raw Results

```text
reports/raw-results.txt
```

Contains the collected raw Nmap scan results.

---

# 🖼️ Screenshots

Screenshots provide visual evidence of the project execution and results.

Store screenshots inside:

```text
screenshots/
```

### Nmap Installation

  <img width="435" height="311" alt="Screenshot 2026-09-05 203159" src="https://github.com/user-attachments/assets/5266c255-da20-4e94-8538-5fc1679fa0fa" />


### Nmap Scan Execution

<img width="443" height="340" alt="Screenshot 2026-09-07 223149" src="https://github.com/user-attachments/assets/066d1eaf-08cb-43f7-8283-caad33a04982" />



### Scan Results

<img width="442" height="341" alt="Screenshot 2026-09-07 222917" src="https://github.com/user-attachments/assets/387387ef-4294-488a-bac4-07c4de8030a9" />

<img width="443" height="259" alt="image" src="https://github.com/user-attachments/assets/e4a4a9e4-78a0-450b-90dc-551bf8f8040b" />




# 🔐 Security & Authorization

This project is intended for **authorized network reconnaissance and academic security testing**.

Scanning should only be performed against systems where explicit authorization has been obtained.

Authorized environments may include:

* Systems owned by the tester
* University/lab infrastructure
* Authorized cloud servers
* Systems explicitly provided for security testing

> **An open port does not automatically indicate a vulnerability.** This project focuses on identifying network-accessible services and mapping the exposed attack surface.

---

# ⚠️ Limitations

* Nmap may not identify every service correctly.
* Custom or uncommon services may appear as `unknown`.
* Firewalls may cause ports to appear as `filtered`.
* Service/version detection depends on the responses provided by the target.
* An open port alone does not confirm a security vulnerability.
* Scan results represent the state of the targets at the time of scanning.
* Network conditions can affect scan duration and accuracy.

---


# 🎓 Learning Outcomes

This project provided practical experience in:

* Network reconnaissance
* TCP port scanning
* Service discovery
* Nmap
* Bash scripting
* Network exposure analysis
* Raw scan result processing
* Security documentation
* Git and GitHub
* Technical reporting

---

# 📌 Project Status

| Component                | Status      |
| ------------------------ | ----------- |
| Target Configuration     | ✅ Completed |
| Full TCP Port Scanning   | ✅ Completed |
| Open Port Identification | ✅ Completed |
| Service Detection        | ✅ Completed |
| Version Detection        | ✅ Completed |
| Result Collection        | ✅ Completed |
| Raw Scan Preservation    | ✅ Completed |
| Final Report             | ✅ Completed |
| GitHub Repository        | ✅ Completed |

## 🟢 Project Status: Completed

---


</p>
