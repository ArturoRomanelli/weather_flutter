# Rivoluzioniamo quest'app.

Prendiamo questo design e "copiamolo":
  https://dribbble.com/shots/20675054-Mobile-Weather-app?utm_source=Clipboard_Shot&utm_campaign=desire-creative_agency&utm_content=Mobile%20%7C%20Weather%20app&utm_medium=Social_Share&utm_source=Clipboard_Shot&utm_campaign=desire-creative_agency&utm_content=Mobile%20%7C%20Weather%20app&utm_medium=Social_Share

In altre parole, otterremo un'unica pagina, con dentro _sia_ il meteo corrente, _sia_ le previsioni del tempo.

## Descrizione della pagina

Non faremo l'app IDENTICA rispetto a questo design, ma quasi.

Strutturiamo infatti la pagina come segue:
  1. La barra di ricerca deve rimanere _sempre_ in alto.
  2. Nell'App bar mettiamo un titolo contenente il nome della città, accentrato
  3. Il resto della pagina _rimanente_ è _tutto_ occupato dal meteo, e i contenuti vanno centrati rispetto allo spazio rimanente
  4. I contenuti di questa pagina sono:
    4.1. Data di oggi
    4.2. Meteo (testuale)
    4.3. Temperatura
    4.4. Un piccolo titolo "Il meteo di oggi"
    4.5. Una riga contenente queste informazioni:
      - l'intensità del **vento** in km/h
      - l'**umidità** in %
      - temperatura **percepita** in °C
    4.6. Tale riga deve mantenere i suoi elementi spaziati tra di loro in maniera uniforme
    4.7. In questa riga, ogni informazione è un componente fatto così:
      - un'icona rappresentante la caratteristica
      - l'informazione con sua unità di misura
      - un sottotitolo che rimarca il "cosa" (e.g. "vento")
    4.8. Le previsioni del tempo per i prossimi 7 gg, come indicato nel design
    4.9. Attenzione a questa feature:
      - È una lista scrollabile verso destra, non una semplice riga
      - Per ogni giorno di previsione prendiamo solo tre info di base: giorno, previsione, temperatura

### The hard part

Ti scrivo una serie di funzionalità da cambiare o implementare. Dalla più facile, alla più difficile.
Dubito tu riesca a fare tutto da solo, credo sia impossibile, e infatti non ti è richiesto.
È una sfida, per provare a scontrarti contro un muro, andando a risolvere un problema che non hai mai visto. Vediamo cosa succede.

A livello di funzionalità, dev'essere possibile fare queste azioni:
  1. Se clicco sulla barra di ricerca e scrivo qualcosa dentro, deve comparire, in fondo, un pulsante "Cerca"
  2. Sposta pure la "X" per cancellare il testo, non è bello averla vicino al pulsante di Ricerca, consiglio invece di metterla come prefisso al posto della 🔍 quando c'è del testo (speriamo sia chiaro)
  3. Quando l'utente clicca su "Cerca", va mostrato un `Dialog` (valuta tu se `AlertDialog`, `Dialog` o `Dialog.fullscreen`, è identico) tramite il metodo `showDialog`
  4. Nel Dialog, l'utente vede il risultato della API search e gli è permesso selezionare la sua location (al tap, la location viene selezionata e il dialog chiuso)
  5. Il dialog viene chiuso, la location viene aggiornata e di conseguenza si aggiorna anche il meteo corrente e la sua previsione

### A cosa serve questo esercizio

Innanzitutto, questo esercizio serve a prendere confidenza con la UI.
Cerca di ottenere una UI "bella"! Aiutati pure con il design che ti ho passato.
Puoi mantenere il colore blu standard di Flutter, quello che serve è sviluppare un senso di organicità di interfaccia.

Dopodiché, c'è una seria sfida sulle funzionalità da cambiare e da implementare (nuove). Dentro c'è tutto: un bottone da premere, uno stato effimero da implementare, lo stato "globale" da gestire (ad esempio, la location ora viene cambiata!) e uno showDialog da mostrare.

### Suggerimenti e Documentazione

Credo ti possano essere utile i seguenti link in risposta alle seguenti FAQ:

  - Dove posso leggere documentazione sugli hooks?
    https://pub.dev/packages/flutter_hooks
    https://docs-v2.riverpod.dev/docs/about_hooks

  - Come mostro un dialog in Flutter? Esempi?
    https://api.flutter.dev/flutter/material/showDialog.html

  - Come faccio a mostrare il risultato di un servizio asincrono dentro la UI?
    https://docs-v2.riverpod.dev/docs/providers/future_provider

  - Come faccio a cambiare imperativamente uno stato con Riverpod?
    https://docs-v2.riverpod.dev/docs/providers/notifier_provider

  - Come faccio a nascondere un Dialog una volta scelta la location?
    https://pub.dev/documentation/go_router/latest/go_router/GoRouter/pop.html
