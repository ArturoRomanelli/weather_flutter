Probabilmente dovrai implementare qualche eccezione custom :-D

Prendi ispirazione da questo snippet, che non c'entra niente, ma ti mostra come puoi implementare una `Exception`.

```dart
import 'package:shared_preferences/shared_preferences.dart';

/// Thrown when no element is found at [key] when using [SharedPreferences].
class LocalStorageGetException implements Exception {
  const LocalStorageGetException(this.key);
  final String key;

  @override
  String toString() =>
      'LocalStorageGetException: No local storage element found at $key';
}
```
