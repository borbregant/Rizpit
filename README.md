# Mini paket za izpite

Developer verzija dostopna na:
[github](https://github.com/borbregant/Rizpit):

``` r
# install.packages("remotes")
remotes::install_github("borbregant/Rizpit")
```
* [![RStudio](http://mybinder.org/badge.svg)](http://mybinder.org/v2/gh/borbregant/Rizpit/master?urlpath=rstudio) RStudio

Funkcije v paketu:
* `statistika` : Izpiše osnovne statistike izpita
* `urejanjetabel` : Po imenu in priimku združi tabele in jih pripravi na obdelavo s `statistika`
* `ocena` : Izpiše oceno za posamezno osebo
* `goljuf` : S pomočjo sedežnega reda primerja razdalje med točkami nalog in izpiše podobne osebe (možne goljufe).
* `branje.izpita` : S pomočjo OCR orodij funkcija skenira priložen izpit (nujno v določeni [obliki](https://github.com/borbregant/izpitgimnazija)). Nato izpiše ime kandidata in doseženo število točk pri posamezni nalogi.

## Avtorji
  - **Bor Bregant** \[aut, cre\].
