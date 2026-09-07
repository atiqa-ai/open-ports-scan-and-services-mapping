# Open Port Scan and Service Mapping – Results Report

## 1. Objective

The objective of this project was to scan **15 authorized IP addresses** and identify:

* Host availability
* Open TCP ports
* Services running on open ports
* Service/version information where detected

The scanning process was performed using **Nmap** and automated through a **Bash script**.

---

## 2. Tools and Technologies

| Tool / Technology    | Purpose                                          |
| -------------------- | ------------------------------------------------ |
| **Nmap 7.98**        | Port scanning and service detection              |
| **Bash Script**      | Automated scanning of multiple IP addresses      |
| **Linux/Ubuntu**     | Scanning environment                             |
| **TCP Connect Scan** | Detection of reachable TCP ports                 |
| **Nmap `-sV`**       | Service and version identification               |
| **Nmap `-Pn`**       | Scanning hosts without relying on ICMP discovery |

---

## 3. Scan Results

The 15 authorized IP addresses were scanned to identify reachable hosts, open TCP ports, and running services.

| #  | IP Address      | Open Ports                                             | Services Detected                                      | Status        |
| -- | --------------- | ------------------------------------------------------ | ------------------------------------------------------ | ------------- |
| 1  | 64.23.130.208   | 22, 54321                                              | SSH, MariaDB                                           | **Completed** |
| 2  | 157.230.47.60   | 22, 53, 4646, 8301, 8500, 8502, 8503, 8600, 9000, 9001 | SSH, DNS, HTTP, Consul/MinIO-related services          | **Completed** |
| 3  | 159.223.62.168  | 22                                                     | SSH                                                    | **Completed** |
| 4  | 139.59.245.244  | 22                                                     | SSH                                                    | **Completed** |
| 5  | 143.198.94.161  | 22                                                     | SSH                                                    | **Completed** |
| 6  | 188.166.250.175 | 22, 53, 80, 443, 7212, 7213, 9111, 9112, 9180          | SSH, DNS, HTTP/HTTPS, PostgreSQL, Redis, HTTP services | **Completed** |
| 7  | 139.59.117.80   | 22, 53, 80, 443, 7212, 7213, 9111, 9112, 9180          | SSH, DNS, HTTP/HTTPS, PostgreSQL, Redis, HTTP services | **Completed** |
| 8  | 134.209.107.38  | 22                                                     | SSH                                                    | **Completed** |
| 9  | 146.190.97.129  | 22                                                     | SSH                                                    | **Completed** |
| 10 | 128.199.134.178 | 22                                                     | SSH                                                    | **Completed** |
| 11 | 167.172.66.204  | 22                                                     | SSH                                                    | **Completed** |
| 12 | 139.59.113.219  | 22, 80, 443, 8443                                      | SSH, HTTP/HTTPS                                        | **Completed** |
| 13 | 159.89.196.66   | 22                                                     | SSH                                                    | **Completed** |
| 14 | 139.59.230.32   | 22                                                     | SSH                                                    | **Completed** |
| 15 | 139.59.99.241   | 22, 443                                                | SSH, HTTPS                                             | **Completed** |

---

## 4. Overall Port Summary

| Port / Service                     | IPs Exposing It                                               |        Count |
| ---------------------------------- | ------------------------------------------------------------- | -----------: |
| **22 – SSH**                       | All 15 IPs                                                    |       **15** |
| **443 – HTTPS**                    | 188.166.250.175, 139.59.117.80, 139.59.113.219, 139.59.99.241 |        **4** |
| **80 – HTTP**                      | 188.166.250.175, 139.59.117.80, 139.59.113.219                |        **3** |
| **53 – DNS/TCP**                   | 157.230.47.60, 188.166.250.175, 139.59.117.80                 |        **3** |
| **7212 – PostgreSQL**              | 188.166.250.175, 139.59.117.80                                |        **2** |
| **9111 – Redis**                   | 188.166.250.175, 139.59.117.80                                |        **2** |
| **54321 – MariaDB**                | 64.23.130.208                                                 |        **1** |
| **8443 – Alternative Web Service** | 139.59.113.219                                                |        **1** |
| **Other Application Ports**        | Mainly 157.230.47.60, 188.166.250.175, 139.59.117.80          | **Multiple** |

### Port Exposure Overview

* **15/15** IPs expose SSH on port **22**.
* **4** IPs expose HTTPS on port **443**.
* **3** IPs expose HTTP on port **80**.
* **3** IPs expose DNS/TCP on port **53**.
* **2** IPs expose PostgreSQL on port **7212**.
* **2** IPs expose Redis on port **9111**.
* **1** IP exposes MariaDB on port **54321**.

---

## 5. Exposure Assessment

Based on the number and type of publicly reachable services, the targets were grouped by exposure level.

| Exposure Level           | IP Addresses                                  | Count |
| ------------------------ | --------------------------------------------- | ----: |
| 🔴 **High Exposure**     | 157.230.47.60, 188.166.250.175, 139.59.117.80 | **3** |
| 🟠 **Moderate Exposure** | 139.59.113.219, 139.59.99.241                 | **2** |
| ⚠️ **Review Required**   | 64.23.130.208                                 | **1** |
| 🟢 **Limited Exposure**  | Remaining 9 IPs                               | **9** |

**Note:** This classification represents observed network service exposure. It does **not** confirm that a host or service is vulnerable.

---

## 6. Important Findings

1. **SSH (port 22)** was the most commonly exposed service and was found on all 15 targets.
2. **157.230.47.60** had the largest number of open ports, including Consul/HTTP-related and other application services.
3. **188.166.250.175** and **139.59.117.80** exposed multiple services, including web services, PostgreSQL, Redis, and other application services.
4. **64.23.130.208** exposed MariaDB on port **54321**, which should be reviewed to confirm whether external access is required.
5. **139.59.113.219** exposed SSH, HTTP, HTTPS, and port **8443**.
6. Several application ports could not be confidently identified and should be reviewed to determine their purpose.

---

## 7. Security Observation

The scan provides a **network service inventory and attack-surface overview**.

The following systems had the highest exposed service surface and should receive higher review priority:

1. **157.230.47.60**
2. **188.166.250.175**
3. **139.59.117.80**

Database, Redis, management, and application services exposed directly to the network should be reviewed to ensure that only required services are publicly accessible.

An **open port does not by itself indicate a vulnerability**. Further security testing would be required to determine whether an exposed service is vulnerable or incorrectly configured.

---

## 8. Conclusion

The project successfully identified the **open TCP ports and associated services for all 15 authorized IP addresses**.

The results show that **SSH is the most commonly exposed service**, while a smaller number of systems expose web, database, Redis, storage, and infrastructure-related services.

The generated results provide a useful **network service inventory and attack-surface overview** that can support further security assessment and firewall review.

**Overall Result: Scan Completed Successfully.**
