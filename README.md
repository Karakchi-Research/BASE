# **BASE: Byte-level Analytics and Statistical Engine**

### *Copyright (c) 2026, Rye Stahle-Smith*

---

## 📌 Project Overview

This repository contains the source code, hardware-description projects, HLS implementations, and generated deployment artifacts for **BASE (Byte-level Analytics and Statistical Engine)**, a reusable FPGA-based streaming preprocessing accelerator for byte-level statistical analysis. BASE integrates **single-pass histogram generation, entropy estimation, variance computation, and byte-transition analysis** directly into the FPGA communication path, allowing preprocessing to overlap with data movement through the **AXI DMA** interface and reducing host-side computation.

The repository includes implementations targeting the **AMD/Xilinx Zynq-7000 PYNQ-Z1**, **Zynq UltraScale+ ZCU104**, and **Alveo U55C** accelerator card. The Zynq designs were developed using **Vivado HLS + Vivado 2018.3**, while the U55C implementation uses **Vitis HLS + Vitis + XRT 2025.1**. Experimental evaluation demonstrates up to a **5.04× preprocessing speedup** and **4.23× end-to-end speedup** on the ZCU104, with additional evaluation on the U55C demonstrating the portability of the architecture across FPGA platforms.

---

## ⚙️ Features

- 📊 **Byte-level Statistical Analysis**
  - 📈 **Histogram Engine**: A BRAM-based histogram maintains 256 counters, one for each possible byte value. Each incoming byte increments its corresponding counter without interrupting the streaming pipeline.
  - 📐 **Streaming Statistics Engine**: Running accumulators implemented using FPGA DSP resources compute the first and second statistical moments, enabling estimation of the stream mean and variance.
  - 🔢 **Entropy Engine**: Entropy is estimated using a lookup-table approximation, eliminating expensive floating-point logarithmic operations while maintaining high throughput.
  - 🔄 **Transition Engine**: A lightweight comparator monitors transitions between consecutive bytes, providing structural information that complements the histogram-based statistics.

- 🧩 **Multi-platform FPGA support**
  - **PYNQ-Z1 / Zynq-7000**
  - **ZCU104 / Zynq UltraScale+**
  - **Alveo U55C**

- 🛠️ **Platform-specific FPGA development flows**
  - PYNQ-Z1 and ZCU104: **Vivado HLS + Vivado 2018.3**
  - Alveo U55C: **Vitis HLS + Vitis + XRT 2025.1**

- 💾 **Generated deployment artifacts**
  - `.bit` and `.hwh` files for the Zynq platforms
  - `.xclbin` file for the Alveo U55C

---

## 📂 Repository Structure

```text
BASE/
├── README.md
├── Alveo/
│   ├── Bitstreams/
│   │   └── bse.xclbin
│   ├── HLS/
│   │   ├── byte_statistics_engine.cpp
│   │   └── byte_statistics_engine_tb.cpp
│   └── Vitis (v++)/
│       ├── byte_statistics_engine.xo
│       └── connectivity.cfg
└── Zynq/
    ├── HLS/
    │   ├── byte_statistics_engine.cpp
    │   └── byte_statistics_engine_tb.cpp
    ├── Vivado/
    │   ├── bladei_bse_pynq_z1/
    │   │   └── <complete Vivado project>
    │   └── bladei_bse_zcu104/
    │       └── <complete Vivado project>
    └── Bitstreams/
        ├── PYNQ-Z1/
        │   ├── bse_wrapper.bit
        │   └── bse.hwh
        └── ZCU104/
            ├── bse_wrapper.bit
            └── bse.hwh
```

> **Note:** The `Vivado/` directories currently contain the full Vivado projects for the PYNQ-Z1 and ZCU104 targets. The exact generated-project contents are intentionally omitted from the high-level tree above to keep the repository structure readable. These projects may later be replaced with Tcl-based project-generation scripts.

---

## 🧠 HLS Implementation

The core byte-statistics engine is implemented in C++ for High-Level Synthesis (HLS).

The repository includes:

- `byte_statistics_engine.cpp` — HLS implementation of the byte statistics engine
- `byte_statistics_engine_tb.cpp` — Testbench used to exercise the HLS design

The same core source organization is maintained for the Zynq and Alveo implementations, with the surrounding build and deployment flow differing according to the target platform.

---

## 🖥️ Setup Instructions

### PYNQ-Z1

The PYNQ-Z1 implementation targets the **Zynq-7000** platform.

The design was developed using:

- **Vivado HLS 2018.3**
- **Vivado 2018.3**

#### Generating the Bitstream

For reference, the repository includes the complete Vivado project under:

```text
Zynq/Vivado/bladei_bse_pynq_z1/
```

A generated deployment pair is also provided:

```text
Zynq/Bitstreams/PYNQ-Z1/
├── bse_wrapper.bit
└── bse.hwh
```

### ZCU104

The ZCU104 implementation targets the **Zynq UltraScale+** platform.

The design was developed using:

- **Vivado HLS 2018.3**
- **Vivado 2018.3**

#### Generating the Bitstream

For reference, the complete Vivado project is located under:

```text
Zynq/Vivado/bladei_bse_zcu104/
```

The generated deployment artifacts are:

```text
Zynq/Bitstreams/ZCU104/
├── bse_wrapper.bit
└── bse.hwh
```

The `.bit` file contains the FPGA configuration bitstream, while the `.hwh` file provides the accompanying hardware metadata used by the PYNQ software environment.

### Alveo U55C

The Alveo implementation targets the **AMD/Xilinx Alveo U55C** accelerator platform.

The U55C design uses:

- **Vitis HLS 2025.1**
- **Vitis 2025.1**
- **XRT 2025.1**

#### Generating the Bitstream

The Vitis linker configuration and HLS kernel object is provided in:

```text
Alveo/Vitis (v++)/
├── connectivity.cfg
└── byte_statistics_engine.xo
```

For reference, the bitstream/container was generated with:

```bash
v++ -l -t hw \
    --platform xilinx_u55c_gen3x16_xdma_base_3 \
    --config connectivity.cfg \
    -o bse.xclbin \
    byte_statistics_engine.xo
```

This command links the compiled HLS kernel object (`byte_statistics_engine.xo`) against the U55C platform and the supplied Vitis connectivity configuration.

The resulting Xilinx binary container is:

```text
Alveo/Bitstreams/
└── bse.xclbin
```

The `.xclbin` file contains the compiled FPGA accelerator binary for the Alveo U55C, including the hardware configuration and kernel information required by the XRT runtime to load and execute the accelerator.

---

## 🚀 Bitstream Execution

The generated bitstreams are executed differently depending on the target FPGA platform and its corresponding software stack.

**Zynq Platforms (PYNQ-Z1 / ZCU104**): The Zynq bitstreams (`.bit`) are intended to be loaded and controlled using the PYNQ Python libraries. The accompanying `.hwh` hardware handoff file provides the hardware metadata required by PYNQ to expose the design's IP and interfaces to Python. A typical workflow is to load the overlay using PYNQ's Overlay class and then interact with the synthesized hardware through the exposed IP interfaces.
**Alveo Platforms (U55C)**: The Alveo bitstream/container (`.xclbin`) is intended to be loaded through PyXRT, the Python interface to the Xilinx Runtime (XRT). PyXRT provides the runtime APIs required to load the `.xclbin`, access the accelerator kernel, manage device memory, and execute the hardware kernel from the host application.

In short, PYNQ is used for the embedded Zynq designs, whereas PyXRT/XRT is used for the accelerator-oriented Alveo U55C design.

---

## 🔧 Toolchain Summary

| Target | HLS Tool | FPGA Design Tool | Runtime |
|---|---|---|---|
| **PYNQ-Z1** | Vivado HLS 2018.3 | Vivado 2018.3 | PYNQ |
| **ZCU104** | Vivado HLS 2018.3 | Vivado 2018.3 | PYNQ |
| **Alveo U55C** | Vitis HLS 2025.1 | Vitis 2025.1 | PyXRT (XRT 2025.1) |

---

## 🛠️ Future Work

- Expand the framework for more devices
- Add detailed performance and resource-utilization results for each supported FPGA platform
- Document examples of use-cases in various software pipelines (i.e. BLADEI)

---

## 🖊️ References

> - Caulfield, A. M., et al. (2016). A cloud-scale acceleration architecture. Proceedings of the 49th Annual IEEE/ACM International Symposium on Microarchitecture (MICRO), 1–13. IEEE.
> - Cronquist, D. C., Fisher, C., Figueroa, M., Franklin, P., & Ebeling, C. (1999). Architecture design of reconfigurable pipelined datapaths. Proceedings 20th Anniversary Conference on Advanced Research in VLSI, 23–40. IEEE.
> - Gonzalez-Guerrero, P., Butko, A., Michelogiannakis, G., & Shalf, J. (2021). AI-enabled analysis and control for enhancing data transition and movement. Position Papers for the ASCR Workshop on Reimagining Codesign, 1–7.
> - Kulatilleke, G. K., Layeghy, S., Baktashmotlagh, M., & Portmann, M. (2026). Mambanetburst: Direct byte-level network traffic classification without tokenization or pretraining. arXiv preprint arXiv:2605.11034.
> - Orojo, A., El-Mahmoud, E., Leal, E., & Rivas, P. (2025). Byteflow: A byte-level LLM for deep packet inspection and network intelligence. 2025 Annual Computer Security Applications Conference Workshops (ACSAC Workshops), 357–365. IEEE.
> - Roozmeh, L., Lavian, J., & Mahlke, S. A. (2018). Accelerating database systems using FPGAs: A survey. IEEE Micro, 38(4), 32–43.
> - Srivastava, A. S., & Mitra, R. K. (2025). High-performance statistical computing (HPSC) on heterogeneous pipelines. arXiv preprint arXiv:2508.04013.
> - Stahle-Smith, R., Antley, C., Bakos, J. D., & Karakchi, R. (2026). Hardware-accelerated line-rate bitstream screening for secure FPGA reconfiguration. arXiv preprint arXiv:2605.08984. Retrieved from https://arxiv.org/abs/2605.08984
> - Stahle-Smith, R., & Karakchi, R. (2025). Real-time ML-based defense against malicious payload in reconfigurable embedded systems. Proceedings of the International Conference for High Performance Computing, Networking, Storage and Analysis (SC25).
> - Stahle-Smith, R., et al. (2024). Supervised machine learning for real-time Hardware Trojan detection in FPGA bitstreams via byte frequency analysis. Journal of Cryptographic Engineering / MDPI Research.
> - Yang, Z., István, Z., Canini, M., & Fahmy, S. A. (2026). Application-level function pipelines on in-network FPGA accelerators. 2026 IFIP Networking Conference (IFIP Networking), 1–10. IEEE.
> - Zhang, T., Wang, S., Liu, J., Chen, X., & Zhou, Y. (2025). Accelerating recommender model ETL with a streaming FPGA-GPU dataflow. arXiv preprint arXiv:2501.12032.
