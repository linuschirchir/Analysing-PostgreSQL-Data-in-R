# Analysing PostgreSQL Data in R

This repository contains code and instructions for connecting to a PostgreSQL database and performing data analysis using R, as explained in the article by [Linus Chirchir]( https://linuschirchir.medium.com/analysing-postgresql-data-in-r-7ea2b2565ba7).

## Table of Contents
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Connecting to PostgreSQL](#connecting-to-postgresql)
- [Querying and Analysing Data](#querying-and-analysing-data)
- [Customisation](#customisation)
- [License](#license)

## Introduction

This project demonstrates how to connect to a PostgreSQL database from R and perform data analysis using popular R packages like `DBI`, `RPostgres`, and `dplyr`. The repository includes example scripts that guide you through querying data and conducting basic analysis, making it a useful resource for data scientists and analysts who work with PostgreSQL.

## Prerequisites

Before you begin, ensure you have the following installed:

- R (version 3.6 or later)
- RStudio (optional, but recommended for ease of use)
- PostgreSQL database (local or remote)
- Necessary R packages: `DBI`, `RPostgres`, `dplyr`

## Installation

First, install the required R packages:

```r
install.packages(c("DBI", "RPostgres", "dplyr"))
```

Fork the repository:
   - Go to the repository page on GitHub: https://github.com/linuschirchir/Analysing-PostgreSQL-Data-in-R.git
   - Click "Fork" in the top-right corner to copy the repository to your GitHub account.

Clone your forked repository to your local machine:
   ```bash
   git clone https://github.com/<your-GitHub-username>/Analysing-PostgreSQL-Data-in-R.git
   cd Analysing-PostgreSQL-Data-in-R
   ```

## Connecting to PostgreSQL

The main script for connecting to the PostgreSQL database is included in the `connect_to_db.R` file. You can run this script in your R environment:

```r
source("connect_to_db.R")
```

This script sets up a connection to your PostgreSQL database, allowing you to execute SQL queries directly from R.

## Querying and Analysing Data

Once connected, you can use the `query_and_analyse.R` script to retrieve and analyse data. This script demonstrates how to:

- Write and execute SQL queries in R
- Manipulate and analyse the retrieved data using `dplyr`
- Visualise results with basic plotting functions

Run the script as follows:

```r
source("query_and_analyse.R")
```

## Customisation

Feel free to customise the scripts to suit your needs:

- SQL Queries: Modify the SQL queries in the scripts to retrieve different data or perform more complex operations.
- Analysis Techniques: Add or change the analysis techniques using other R packages or custom functions.
- Visualisations: Incorporate more advanced visualisations using packages like `ggplot2` or `plotly`.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Happy analysing!
