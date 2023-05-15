### Introductie

Het doel van deze opdracht is een pack simulator voor Pokémon kaarten te ontwikkelen. In deze applicatie hebben we de basis alvast gelegd. Het ophalen en inzien van kaarten is geregeld en in de store zijn Basic en Premium kaartenpakketten te koop. Jij maakt het mogelijk om deze pakketten te kopen en op een feestelijke manier te openen.

### Start

- Clone deze app
- Run `rails db:create` en `rails db:migrate`
- Run `rails db:seed` om Basic en Premium kaartenpakketten in te laden en te starten met 1200 coins
- Run `Import::ProcessorJob.perform_now` om 100 Pokémon kaarten in te laden

### Acceptatiecriteria

De volgende criteria zijn losse features en kunnen opeenvolgend worden geïmplementeerd. Probeer eerst een feature af te ronden, voordat met de volgende feature gestart wordt.

1. Maak het mogelijk om een kaartenpakket in de store te kopen en te openen
    - De kosten van het pakket worden verrekend met jouw coin total
    - Het is mogelijk om aangeschafte pakketten in te zien
2. Maak het mogelijk om de aangeschafte pakketten te openen
    - Na het openen worden 10 willekeurige Pokémon kaarten toegevoegd aan jouw collectie
3. Maak het mogelijk om verschillende type kaartenpakketten te openen met wisselende odds voor het krijgen van veelvoorkomende tot zeldzame Pokémon kaarten
    - De volgende condities gelden voor een Basic pakket:
        - Minimaal twee Pokemon zijn Uncommon of hoger
        - De volgende odds worden toegepast:
            - Common: 50%
            - Uncommon: 30%
            - Rare: 14%
            - Secret Rare: 5%
            - Ultra Rare: 1%
    - De volgende condities gelden voor een Premium pakket:
        - Minimaal vijf Pokemon Uncommon of hoger
        - Minimaal twee Pokemon Rare of hoger
        - De volgende odds worden toegepast:
            - Common: 20%
            - Uncommon: 45%
            - Rare: 25%
            - Secret Rare: 8%
            - Ultra Rare: 2%

### Bonus

- Gebruik Turbo Frames of Streams (Hotwire) voor een vlotte gebruikerservaring
    - Muntensaldo wordt realtime bijgewerkt
    - Verzin een feestelijke manier om pakketten te openen
- Maak het mogelijk om pakketten en de bijbehorende odds te beheren
- Voeg extra filteropties toe voor Pokémon kaarten
