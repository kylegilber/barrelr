# barrelr
[![RStudio][rstudio-badge]][rstudio-url]
[![R][r-badge]][r-url]
[![LinkedIn][linkedin-badge]][linkedin-url]
[![MIT][mit-badge]][mit-url]

## About

#### barrelr is an R package for college baseball analytics.

This package includes the `is_barrel` function, which classifies batted-balls as barrels or not
based on their exit velocity and launch angle. 

A **barrel** is a batted-ball with a combination of exit velocity and launch angle that produces
an Expected Batting Average (xBA) of at least 0.500 and an Expected Slugging Percentage (xSLG) 
of 1.500 or greater. Barrels are a Statcast metric used to identify batted-balls with high 
offensive value.

> [!NOTE]
> `is_barrel` is trained on college baseball data. Consequently, its barrel classifications may not
align with [MLB][mlb-url] definitions or results.

## Installation

#### Install barrelr from GitHub using [`pak`](https://github.com/r-lib/pak#arrow_down-installation):

``` r
if (!requireNamespace('pak', quietly = TRUE)){
  install.packages('pak')
}
pak::pak("kylegilber/barrelr")
```

## Usage

### Basic Example
You can directly pass exit velocity and launch angle to `is_barrel` for quick checks.

``` r
library(barrelr)

is_barrel(ev = 108.4, la = 39)
```

### DataFrame Example
You can use `is_barrel` to create an indicator variable when working with datasets.

``` r
library(barrelr)
library(dplyr)

df <- data.frame(
  PlayResult = c("Out", "HomeRun", "Single"),
  ExitSpeed = c(94.3, 102.1, 100.7),
  Angle = c(33, 29, 15)
)

df <- df %>% 
  mutate(Barrel = is_barrel(ExitSpeed, Angle))
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details.

<!-- link definitions -->
[rstudio-badge]: https://img.shields.io/badge/RStudio-75AADB?style=for-the-badge&logo=RStudio&logoColor=white
[rstudio-url]: https://posit.co/downloads
[r-badge]: https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white
[r-url]: https://www.r-project.org/
[linkedin-badge]: https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
[linkedin-url]: https://www.linkedin.com/in/kylegilbertpsu/
[mlb-url]: https://www.mlb.com/glossary/statcast/barrel
[mit-badge]: https://img.shields.io/badge/MIT-green?style=for-the-badge
[mit-url]: https://opensource.org/licenses/MIT
