## Introductie

Dagelijks bezoeken duizenden klanten onze website en werken tientallen collega’s in onze Backend systemen. In deze systemen beheren we alle abonnementen en producten die we aanbieden op de website en worden binnenkomende bestellingen van A tot Z verwerkt.

Net als op de website hechten we waarde aan een vlotte gebruikerservaring in onze Backend systemen. De meeste van deze applicaties draaien op Rails 7.x en Ruby 3.x, waardoor Hotwire gebruikt kan worden voor meer interactiviteit. 

Het doel van deze opdracht is een pack simulator voor Pokémon kaarten te ontwikkelen. Het ophalen en opslaan van de kaarten is al geregeld. Jij maakt het mogelijk om Basic en Premium kaartenpakketten te kopen in de store en op een feestelijke manier te openen.

### Start
- Clone deze app
- Run `Import::Processor.run` om alle Pokémon kaarten in te laden
- Neem gerust even een bakje koffie

### Acceptatiecriteria
- Maak gebruik van Ruby 3.x en Rails 7.x
- Een gebruiker heeft een online portemonnee met munten om pakketten mee te kopen
- Een gebruiker kan munten toekennen aan de eigen portemonnee
- Een gebruiker kan in een winkelsectie Basic en Premium pakketten kopen met munten
- Elk pakket bestaat uit 10 kaarten en afhankelijk van het type pakket verschillen de odds voor het krijgen van veelvoorkomende tot zeldzame Pokémon kaarten
- Een Basic pakket kost 100 munten en heeft de volgende condities:
    - Minimaal twee Pokemon zijn Uncommon of hoger
    - In het algemeen worden de volgende odds toegepast:
        - Common: 50%
        - Uncommon: 30%
        - Rare: 14%
        - Secret Rare: 5%
        - Ultra Rare: 1%
- Een Premium pakket kost 300 munten en heeft de volgende condities:
    - Minimaal vijf Pokemon Uncommon of hoger
    - Minimaal twee Pokemon Rare of hoger
    - In het algemeen worden de volgende odds toegepast:
        - Common: 20%
        - Uncommon: 45%
        - Rare: 25%
        - Secret Rare: 8%
        - Ultra Rare: 2%
- Bij het openen van een pakket worden tien kaarten met achterzijde getoond, bij het klikken op een kaart wordt de voorzijde van de Pokémon kaart getoond

### Bonus
- Gebruik Turbo Frames of Streams (Hotwire) voor een vlotte gebruikerservaring
    - Bij een aankoop wordt het muntentotaal realtime bijgewerkt
- Maak een interface om alle Pokémon kaarten op te kunnen zoeken
    - Voeg filtermogelijkheden en paginatie toe
- Maak pakketten en de bijbehorende odds en voorwaarden beheerbaar
- Maak gebruik van een autorisatie tool om rechten toe te kennen aan gebruikers
    - Alleen gebruikers met admin rechten kunnen munten geven aan andere gebruikers