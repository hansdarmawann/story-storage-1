# Storage Story: Exploratory Analysis of Personal Media Storage Metadata
**by Hans Darmawan**
Language: Python
Analysis Type: Exploratory Data Analysis (EDA)


## Overview

This project presents an **Exploratory Data Analysis (EDA)** of anonymized personal media storage metadata. The objective is to understand **how personal media storage is consumed over time**, which media categories and formats contribute most to storage growth, and how these patterns evolve temporally.

The analysis is structured using the **Google Data Analytics Capstone framework**:
**Ask → Prepare → Process → Analyze → Share → Act**.
The project emphasizes analytical discipline, transparency, and reproducibility, avoiding unnecessary feature engineering beyond what is required for reliable exploratory insights.

---

## Repository Structure

```
storage-story-1/
│
├── datasets/
│   ├── files.csv                    # Raw dataset
│   └── files_clean_engineered.csv   # Processed dataset
│
├── notebooks/
│   └── notebook.ipynb               # Main EDA notebook
│
├── figures/                         # Generated visualizations
│
├── queries/
│   └── get_data.sql                 # Data extraction query
│
├── environments/
│   └── environment.yml              # Reproducible environment
│
└── README.md
```

---

## Project Context

As personal media accumulates over time, storage usage grows rapidly, making it increasingly difficult to plan, manage, and optimize long-term storage. This project uses file-level metadata to:

* Understand storage consumption patterns
* Identify dominant contributors to storage growth
* Reveal temporal trends and seasonality in file creation and storage usage

All personal or sensitive identifiers have been **anonymized or masked**, preserving privacy while maintaining analytical integrity.

---

## Business Task

**Primary Question**
How is personal media storage consumed over time, what patterns and trends exist across file categories, formats, and temporal dimensions, and how can these insights inform storage planning decisions?

**Key Objectives**

* Quantify storage usage by category, format, and time
* Compare file count dominance vs. storage size dominance
* Identify long-term growth trends and seasonality
* Provide a reliable analytical foundation for future optimization or forecasting work

---

## Stakeholders

* **Data Analysts / Data Scientists** – to understand dataset structure, limitations, and analytical opportunities
* **Business or Operational Decision-Makers** – to support storage capacity planning and prioritization
* **Project Reviewers / External Audiences** – to evaluate analytical rigor, clarity, and reproducibility

---

## Dataset Summary

* **Records:** 108,598 (each record represents one media file)
* **Granularity:** File-level metadata
* **Key Attributes:**

  * Hierarchical identifiers (albumRootId, albumId, imageId)
  * Media category and format
  * File size (bytes)
  * File creation date

### Data Quality Highlights

* 100% non-null values across all columns
* No duplicate records detected
* Dataset size ~6.6 MB, efficient for in-memory analysis
* Structurally complete and suitable for aggregate and temporal analysis

---

## Methodology

### 1. Ask

* Defined business questions and analytical scope
* Identified stakeholders and success criteria
* Ensured alignment between business objectives and EDA approach

### 2. Prepare

* Reviewed dataset structure, data types, and volume
* Assessed completeness and reliability
* Documented analytical implications of schema design

### 3. Process

* Verified absence of missing values and duplicates
* Created a working copy of the dataset to preserve raw data
* Converted file creation date to datetime format
* Engineered minimal temporal features (year, month, day of week)
* Normalized file size units (bytes → MB / GB)

### 4. Analyze

* Descriptive statistics across original and engineered features
* Category-level analysis by:

  * File count distribution
  * Total storage contribution
* Temporal analysis of:

  * File creation trends
  * Storage growth over time

Reusable EDA visualization functions were developed to ensure consistency and reproducibility across analyses.

---

## Key Analytical Insights (High-Level)

* Storage usage is not always aligned with file count dominance
* Certain formats or categories contribute disproportionately to total storage
* Long-term growth trends are observable at the yearly level
* Temporal aggregation reveals patterns useful for capacity planning

*(Detailed insights are documented within the notebook.)*

---

## Limitations & Assumptions

* The dataset represents a **single anonymized user**, limiting generalizability
* Analysis is based solely on **metadata**, not file content
* File creation date may not always reflect the original capture date
* Semantic correctness of categories and formats is assumed

These limitations should be considered when extending the analysis or applying insights to broader contexts.

---

## Reproducibility

* All transformations are documented and non-destructive
* Raw data is preserved separately from processed outputs
* Environment dependencies are captured in `environment.yml`
* Visual outputs are saved to disk for consistent reuse

---

## Next Steps

Potential extensions of this work include:

* Storage growth forecasting
* Cost modeling based on storage tiers
* Automated archival or lifecycle management rules
* Cross-user or multi-device comparative analysis