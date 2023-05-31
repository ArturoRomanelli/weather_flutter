class LocationPermissionDeniedException implements Exception {
  @override
  String toString() =>
      "LocationPermissionDeniedException: Non è stato autorizzato l'accesso alla posizione.";
}

class LocationPermissionDeniedForeverException implements Exception {
  @override
  String toString() =>
      "LocationPermissionDeniedForeverException: L'accesso alla posizione è stato negato permanentemente. Per cambiare la tua decisione, modifica le impostazioni del tuo dispositivo";
}
