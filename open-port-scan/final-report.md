# Open Port Scan and Service Mapping – Results Report

## 1. Objective

The objective of this project was to scan **multiple authorized IP addresses** and identify:

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
| 1  | Target 1   | 22, 54321                                              | SSH, MariaDB                                           | **Completed** |
| 2  |Target 2    | 22, 53, 4646, 8301, 8500, 8502, 8503, 8600, 9000, 9001 | SSH, DNS, HTTP, Consul/MinIO-related services          | **Completed** |
| 3  | Target 3   | 22                                                     | SSH                                                    | **Completed** |
| 4  | Target 4   | 22                                                     | SSH                                                    | **Completed** |
| 5  |Target 5    | 22                                                     | SSH                                                    | **Completed** |
| 6  |Target 6    | 22, 53, 80, 443, 7212, 7213, 9111, 9112, 9180          | SSH, DNS, HTTP/HTTPS, PostgreSQL, Redis, HTTP services | **Completed** |
| 7  | Target 7   | 22, 53, 80, 443, 7212, 7213, 9111, 9112, 9180          | SSH, DNS, HTTP/HTTPS, PostgreSQL, Redis, HTTP services | **Completed** |
| 8  | Target 8   | 22                                                     | SSH                                                    | **Completed** |
| 9  | Target 9   | 22                                                     | SSH                                                    | **Completed** |
| 10 | Target 10  | 22                                                     | SSH                                                    | **Completed** |
| 11 |Target 11   | 22                                                     | SSH                                                    | **Completed** |
| 12 |Target 12   | 22, 80, 443, 8443                                      | SSH, HTTP/HTTPS                                        | **Completed** |
| 13 |Target 13   | 22                                                     | SSH                                                    | **Completed** |
| 14 | Target 14  | 22                                                     | SSH                                                    | **Completed** |
| 15 | Target 15  | 22, 443                                                | SSH, HTTPS                                             | **Completed** |

---


### Port Exposure Overview

* **15/15** IPs expose SSH on port **22**.
* **4** IPs expose HTTPS on port **443**.
* **3** IPs expose HTTP on port **80**.
* **3** IPs expose DNS/TCP on port **53**.
* **2** IPs expose PostgreSQL on port **7212**.
* **2** IPs expose Redis on port **9111**.
* **1** IP exposes MariaDB on port **54321**.

---



## 6. Important Findings

1. **SSH (port 22)** was the most commonly exposed service and was found on all 15 targets.
2. **Target 2** had the largest number of open ports, including Consul/HTTP-related and other application services.
3. **Target 6** and **Target 7** exposed multiple services, including web services, PostgreSQL, Redis, and other application services.
4. **Target 1** exposed MariaDB on port **54321**, which should be reviewed to confirm whether external access is required.
5. **Target 12** exposed SSH, HTTP, HTTPS, and port **8443**.
6. Several application ports could not be confidently identified and should be reviewed to determine their purpose.

---

## 7. Security Observation

The scan provides a **network service inventory and attack-surface overview**.

The following systems had the highest exposed service surface and should receive higher review priority:

1. **Target 2**
2. **Target 6**
3. **Target 7**

Database, Redis, management, and application services exposed directly to the network should be reviewed to ensure that only required services are publicly accessible.

An **open port does not by itself indicate a vulnerability**. Further security testing would be required to determine whether an exposed service is vulnerable or incorrectly configured.

---

## 8. Conclusion

The project successfully identified the **open TCP ports and associated services for all 15 authorized IP addresses**.

The results show that **SSH is the most commonly exposed service**, while a smaller number of systems expose web, database, Redis, storage, and infrastructure-related services.

The generated results provide a useful **network service inventory and attack-surface overview** that can support further security assessment and firewall review.


