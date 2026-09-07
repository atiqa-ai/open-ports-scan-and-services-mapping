# open-ports-scan-and-services-mapping
# 🔎 Open Port Scan and Service Mapping

<p align="center">

**Automated Network Reconnaissance & Service Discovery using Nmap and Bash**

[![Linux](https://img.shields.io/badge/Linux-Ubuntu-orange?logo=linux)](https://ubuntu.com/)
[![Bash](https://img.shields.io/badge/Script-Bash-green?logo=gnu-bash)](https://www.gnu.org/software/bash/)
[![Nmap](https://img.shields.io/badge/Scanner-Nmap-blue)](https://nmap.org/)
[![Git](https://img.shields.io/badge/Version%20Control-Git-F05032?logo=git)](https://git-scm.com/)
[![GitHub](https://img.shields.io/badge/Repository-GitHub-black?logo=github)](https://github.com/)
[![Status](https://img.shields.io/badge/Project-Completed-success)](#project-status)

</p>

---

## 📌 Overview

**Open Port Scan and Service Mapping** is a network security reconnaissance project that automatically scans authorized IP addresses to identify **open TCP ports and the services running on them**.

The project uses **Nmap** for network scanning and **Bash** for automation. It performs a complete TCP port scan from **1–65535**, extracts open ports, and then performs service/version detection on the discovered ports.

All scan outputs are stored as raw Nmap evidence for analysis, verification, and reporting.

---

## 🎯 Objectives

* 🔍 Identify open TCP ports on authorized systems.
* 🛠️ Identify services running on discovered ports.
* 🧩 Detect service/software versions where possible.
* ⚙️ Automate scanning of multiple IP addresses using Bash.
* 📡 Perform full TCP port scanning from ports `1–65535`.
* 📁 Store raw Nmap scan results for verification.
* 📊 Analyze network exposure and accessible services.
* 📝 Generate a consolidated project report.

---

## 📚 Table of Contents

* [Overview](#-overview)
* [Objectives](#-objectives)
* [Architecture](#-architecture)
* [Workflow](#-workflow)
* [Technologies](#️-technologies)
* [Project Structure](#-project-structure)
* [Scanning Methodology](#-scanning-methodology)
* [Results](#-results)
* [Screenshots](#-screenshots)
* [Installation](#-installation)
* [Usage](#-usage)
* [Output Files](#-output-files)
* [Security & Authorization](#-security--authorization)
* [Limitations](#️-limitations)
* [Future Improvements](#-future-improvements)
* [Learning Outcomes](#-learning-outcomes)
* [Project Status](#-project-status)
* [Disclaimer](#-disclaimer)

---

# 🏗️ Architecture

The project follows a simple automated reconnaissance architecture:

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
                         │    Open Port         │
                         │    Identification    │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │ Service & Version    │
                         │ Detection (-sV)      │
                         └──────────┬───────────┘
                                    │
                                    ▼
              ┌─────────────────────┴─────────────────────┐
              │                                           │
              ▼                                           ▼
     ┌──────────────────┐                       ┌──────────────────┐
     │   Raw Nmap Data  │                       │  Project Report  │
     │ .nmap/.gnmap/XML │                       │   reports/       │
     └──────────────────┘                       └──────────────────┘
```

---

# 🔄 Workflow

The complete scanning process follows these steps:

```text
1. Load authorized IP addresses
             ↓
2. Validate target IP
             ↓
3. Perform full TCP scan
             ↓
4. Scan ports 1–65535
             ↓
5. Identify open ports
             ↓
6. Extract open ports
             ↓
7. Perform service/version detection
             ↓
8. Save Nmap output
             ↓
9. Analyze results
             ↓
10. Generate final report
```

---

# 🛠️ Technologies

| Technology            | Purpose                           |
| --------------------- | --------------------------------- |
| 🐧 **Ubuntu / Linux** | Scanning environment              |
| 🐚 **Bash**           | Automation and scripting          |
| 🔎 **Nmap**           | Port and service scanning         |
| 🌐 **TCP/IP**         | Network communication             |
| 📦 **Git**            | Version control                   |
| 🐙 **GitHub**         | Repository and project management |
| 📝 **Markdown**       | Documentation                     |

### Nmap Options Used

| Option | Function                                         |
| ------ | ------------------------------------------------ |
| `-Pn`  | Skip host discovery and scan the target directly |
| `-p-`  | Scan all TCP ports from `1–65535`                |
| `-sV`  | Detect services and versions                     |
| `-oN`  | Save normal Nmap output                          |
| `-oG`  | Save grepable Nmap output                        |
| `-oX`  | Save XML Nmap output                             |

---

# 🔬 Scanning Methodology

## 1. Target Input

Authorized target IP addresses are stored in:

```text
targets.txt
```

Each target is placed on a separate line.

Example:

```text
192.0.2.10
192.0.2.20
192.0.2.30
```

---

## 2. Full Port Scan

The project performs a complete TCP port scan:

```bash
nmap -Pn -p- <TARGET_IP>
```

This checks all TCP ports:

```text
1 → 65535
```

The purpose is to avoid missing services running on non-standard ports.

---

## 3. Open Port Extraction

After the full scan, open TCP ports are extracted from the Nmap results.

Only discovered open ports are passed to the service detection stage.

---

## 4. Service Detection

Nmap then attempts to identify the service and version:

```bash
nmap -Pn -sV -p <OPEN_PORTS> <TARGET_IP>
```

Example output:

```text
22/tcp open ssh OpenSSH
80/tcp open http
443/tcp open https
```

---

## 5. Result Storage

Each target receives its own directory under:

```text
scans/
```

This keeps the results organized and makes the original Nmap evidence available for verification.

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
│   ├── 📂 <target-ip-1>/
│   │   ├── full-scan.nmap
│   │   ├── full-scan.gnmap
│   │   ├── full-scan.xml
│   │   └── service-detection.txt
│   │
│   ├── 📂 <target-ip-2>/
│   │   └── ...
│   │
│   └── 📂 ...
│
└── 📂 reports/
    ├── final-report.md
    └── raw-results.txt
```

### Directory Description

* **`targets.txt`** — Contains authorized target IP addresses.
* **`scan_all.sh`** — Main Bash automation script.
* **`scans/`** — Contains raw Nmap scan results for each target.
* **`reports/`** — Contains consolidated project reports and raw result documentation.
* **`README.md`** — Project documentation.

---

# 📊 Results

The project successfully scanned:

> **15 authorized IP addresses**

### Scan Configuration

| Parameter         | Value               |
| ----------------- | ------------------- |
| Targets           | **15**              |
| Protocol          | **TCP**             |
| Port Range        | **1–65535**         |
| Host Discovery    | Skipped using `-Pn` |
| Service Detection | Enabled using `-sV` |
| Automation        | Bash                |
| Scanner           | Nmap                |
| Result Formats    | Nmap / GNMAP / XML  |
| Status            | ✅ Completed         |

### Services Identified

The scans identified multiple types of services, including:

* SSH
* HTTP
* HTTPS
* DNS
* Database-related services
* Application/API services
* Other services running on non-standard ports

Most targets exposed SSH through **TCP/22**, while some targets exposed additional web, DNS, database, and application services.

> The detailed raw results for every target are available inside the `scans/` directory.

---

# 🔎 Example Result

A typical Nmap service-detection result looks like:

```text
PORT     STATE SERVICE VERSION
22/tcp   open  ssh     OpenSSH
80/tcp   open  http
443/tcp  open  https
```

The exact results obtained during the project are preserved in the raw scan files.

---

# 🖼️ Screenshots

Screenshots can be added here to demonstrate the actual execution and results.

### Nmap Scan Execution

Place your screenshot inside:

```text
screenshots/
```

Then add:

```markdown
![Nmap Scan Execution](screenshots/nmap-scan.png)
```

### Scan Results

```markdown
![Nmap Scan Results](screenshots/nmap-results.png)
```

### Project Report

```markdown
![Project Report](screenshots/final-report.png)
```

> Replace the filenames above with the actual screenshot filenames in your repository.

---

# 📄 Raw Scan Evidence

The project preserves the original Nmap scan outputs.

### Available formats

```text
.nmap
.gnmap
.xml
```

### Why these files are included

These files provide evidence of the actual scanning process and allow the results to be independently reviewed.

The consolidated raw results are also available at:

```text
reports/raw-results.txt
```

The final analysis/report is available at:

```text
reports/final-report.md
```

---

# 🚀 Installation

## Prerequisites

The project requires:

* Ubuntu/Linux
* Bash
* Nmap
* Git

### Install Nmap

```bash
sudo apt update
sudo apt install nmap -y
```

### Verify installation

```bash
nmap --version
```

### Verify Bash

```bash
bash --version
```

---

# ▶️ Usage

## 1. Clone the repository

```bash
git clone <YOUR-GITHUB-REPOSITORY-URL>
```

## 2. Enter the project

```bash
cd open-port-scan
```

## 3. Make the script executable

```bash
chmod +x scan_all.sh
```

## 4. Configure targets

Edit:

```bash
nano targets.txt
```

Add only IP addresses for which scanning authorization has been obtained.

## 5. Run the scanner

```bash
./scan_all.sh
```

The generated results will be stored inside:

```text
scans/
```

---

# 📦 Output Files

For each scanned target, Nmap can generate:

### `.nmap`

Normal human-readable Nmap output.

```text
full-scan.nmap
```

### `.gnmap`

Grepable output useful for automated processing.

```text
full-scan.gnmap
```

### `.xml`

Structured XML output useful for tools and further processing.

```text
full-scan.xml
```

### `service-detection.txt`

Contains service/version detection results where generated.

---

# 🔐 Security & Authorization

This project is designed for **authorized network reconnaissance**.

The scanning process should only be performed against:

* Systems owned by the tester
* University/lab infrastructure with permission
* Cloud servers explicitly authorized for testing
* Other systems where explicit authorization has been obtained

Port scanning should not be performed against random public systems without permission.

---

# ⚠️ Limitations

* Nmap may not identify every service correctly.
* Custom or uncommon services may appear as `unknown`.
* Firewalls can cause ports to appear as `filtered`.
* Service/version detection depends on the responses provided by the target.
* An open port does **not** automatically indicate a vulnerability.
* Results represent the network state at the time of scanning.

---

# 🔮 Future Improvements

The project can be extended with:

* 🔐 Automated vulnerability assessment
* 🛡️ CVE/service-version correlation
* 📊 Web-based monitoring dashboard
* 📈 Historical scan comparison
* 🔔 Automated security alerts
* ⏰ Scheduled recurring scans
* 🐳 Docker-based deployment
* ☁️ Cloud-based scanning infrastructure
* 📑 Automated PDF/HTML security reports
* 🔗 Integration with security monitoring/SIEM platforms

---

# 🎓 Learning Outcomes

This project provided practical experience in:

* Network reconnaissance
* TCP port scanning
* Service discovery
* Nmap
* Bash scripting
* Linux networking
* Automation
* Network exposure analysis
* Security documentation
* Git
* GitHub
* Technical reporting

---

# 📌 Project Status

| Component                | Status      |
| ------------------------ | ----------- |
| Target configuration     | ✅ Completed |
| Full TCP scanning        | ✅ Completed |
| Open port identification | ✅ Completed |
| Service detection        | ✅ Completed |
| Result collection        | ✅ Completed |
| Raw scan preservation    | ✅ Completed |
| Final report             | ✅ Completed |
| GitHub repository        | ✅ Completed |

### 🟢 Status: Completed

---

# 👨‍💻 Project Information

**Project:** Open Port Scan and Service Mapping

**Category:** Network Security / Network Reconnaissance

**Primary Tool:** Nmap

**Automation:** Bash

**Operating System:** Ubuntu / Linux

**Targets:** 15 Authorized IP Addresses

**Repository:** GitHub

---


