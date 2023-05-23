Finora abbiamo creato un'app basata su delle API "semplificate".

L'idea di questa feature è di poter offrire all'utente una sorta di "autocomplete" sul luogo di ricerca.

Puoi immaginare che se un utente inserisce "FireZNe" dentro una casella di testo (typo) noi non abbiamo modo di **validare** il suo input. Alle API passiamo quel valore, e queste (probabilmente) ci restituiranno un bel error.

La richiesta - per farti prendere pratica - è quella di agganciare questa specifica API con le metodologie imparate ieri:
>  https://app.swaggerhub.com/apis-docs/WeatherAPI.com/WeatherAPI/1.0.2-oas3-oas3.1-oas3.1/#/APIs/search-autocomplete-weather

Per disambiguità: la API è `/search.json`.

Essendo che non siamo sincroni (non siamo in call) nella trasmissione di questi requisiti, forse ti conviene prima vedere le API e scrivere tutto il data layer prima di pensare al domain layer.

Un paio di suggerimenti:
  1. Stiamo per fare una ricerca, ergo i risultati sono più di uno...
  2. La query è - di nuovo - una semplice stringa (non occorre fare cose incasinate o oggetti)

In più, se vuoi immergerti in un'attività di refactoring, nota come gli oggetti che restituisce quest'API sono di fatto un oggetto `Location`, meglio descritto. Se vuoi prendere ispirazione, io questo oggetto `Location` lo creerei e lo terrei in questa feature specificatamente.

Infine, ricordati che questi esercizi servono in primis a te per imparare. Sforzati di scrivere a manina tutti questi metodi, di usare le shortcuts, di usare gli snippets, di cercare online se hai errori in compilazione (bisogna imparare anche quello). E non esitare a chiedere aiuto.

Cancella questo file quando non ti serve più.