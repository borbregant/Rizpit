# IZPIT: Statistika in goljuf

## Navodila za uporabo funkcij

* `statistika` : Izpiše osnovne statistike izpita in jih izvozi v oblikah txt (za kvantile in splošen povzetek) in pdf (hitri grafični prikazi). Izvozi ju v mapi, kjer je funkcija shranjena (...\Rizpit\R)
* `urejanjetabel` : Po imenu in priimku združi tabele in jih pripravi na obdevalo s `statistika`. Sprejme parametra skupnotock=TRUE, ki če je izbran namesto skupnega števila točk v tabelo vpiše procent. Opcija zapisi=TRUE pa tabelo zapise v obliki dataframe-a. Izvoz poteka v mapi, kjer je funkcija shranjena.
* `ocena` : Izpiše oceno (v obliki besede) za posamezno osebo na podlagi izpita in skupnega števila točk.
* `goljuf` : S pomočjo sedežnega reda primerja razdalje med točkami nalog in izpiše podobne osebe. Rezultate izvozi v konzoli in grafičnem delu konzole.
* `branje.izpita` : S pomočjo OCR orodij funkcija skenira priložen izpit (nujno v določeni [obliki](https://github.com/borbregant/izpitgimnazija)). Nato izpiše ime kandidata in doseženo število točk pri posamezni nalogi.

## Avtorji
  - **Bor Bregant** \[aut, cre\].
