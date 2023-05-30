# New feature: current location

Si vuole avere una sorta di "posizione iniziale", da ottenere tramite apposito servizio, con la quale inizializzare poi il controller fatto da altre parti.

## Attenzione, concettualmente è diverso

Un conto è la posizione corrente dell'utente, che prendiamo una volta sola (e tanti saluti).
Un conto è la posizione _scelta_ dall'utente, che prendiamo tramite search bar.
L'ideale è che quest'ultima dipenda dalla prima _in fase di inizializzazione_.

## TODOs / Consigli

1. Spostare qui tutte le classi e le logiche relative alla "current location". Direi di centralizzare quella logica qui dentro
2. Mantenere nella feature `search` tutto ciò che ha a che fare con la `search`
3. Scrivere il servizio che ti permette di prendere la posizione attuale dell'utente tramite il pacchetto Geolocator. Usa la documentazione e lasciati ispirare dall'autocomplete + questo snippet qua sotto. Non serve il layer data per questa feature.

```dart
 // Test if location services are enabled.
final serviceEnabled = await Geolocator.isLocationServiceEnabled();
if (!serviceEnabled) throw const LocationServiceDisabledException();  // TODO create errors

var permission = await Geolocator.checkPermission();
if (permission == LocationPermission.denied) {
  permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied) throw LocationPermissionDeniedException();
}

if (permission == LocationPermission.deniedForever) {
  // Permissions are denied forever, handle this appropriately.
  throw LocationPermissionDeniedForeverException();
}

return Geolocator.getCurrentPosition();
```

4. Scrivere qui uno state che contiene la posizione iniziale (duh) sfruttando proprio il servizio appena creato.
5. Il resto dell'app dovrebbe rimanere invariata, in teoria.

