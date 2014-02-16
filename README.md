Readme
==========

Her oppdaterer vi sprint backlog. 

Når dere skal endre status på oppgavene endrer dere **< font color = 'red'>** til **< font color = 'green'>** og legger til et timestamp. Kanskje også bruke caps lock? Lettere å se. I Markdownpad har man en egen knapp for å generere timestamp (oppe til høyre, ser ut som en liten klokke.

< font color = 'green'>STARTET 2/16/2014 6:34:49 PM </font>

Fargen synes ikke på github, så når dere vil sjekke statusene kan det være en idè å synkronisere Dokumenter repositorien (om det behøves) og så åpne denne filen i Markdownpad, så synes det mye bedre.

Om dere vil at noen skal se gjennom arbeidet deres kan dere sette fargen til 'blue' og status til "trenger review". Tror vi får årleit oversikt da. 

### Om versjonsnummerering ###

Kun **working copies** skal committes. Dvs at dere har implementert en ny funksjon - selv om det har bugs. 

Husk å skrive en beskrivelse eller en forståelig summary. 

Om dere har lyst til å bruke versjonsnummer: bruk formatet X.Y.Z , som tilsvarer major.minor.patch.

* Major endres når vi har gjort en betydelig forandring, mest sannsynlig kommer vi ikke til å endre dette tallet.
* Minor endres når en ny, mellomstor, funksjon er implementert - eller når et sett av nye, små, funksjoner er implementert.
* Patch endres når vi endrer programmet men ikke implementerer noe nytt, brukes som regel til bugfixes.

1.0.0, 1.0.1, 1.1.1, 1.1.2, 1.2.0, 1.2.1, 1.2.2, 1.2.3, 1.3.0 osv.


Om flere personer skal jobbe på samme fil må vi lage **branches** og så merge dem sammen.