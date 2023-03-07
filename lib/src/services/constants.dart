import '../style/snack_bar.dart';

String baseUrl = 'https://breakin-backend.onrender.com';

Duration timeout = const Duration(seconds: 5);

void noInternet() => showSnackBar('No Internet');
void timeOut() => showSnackBar('Timeout');
