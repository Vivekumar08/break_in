import '../style/snack_bar.dart';

String baseUrl = 'https://breakin-backend.onrender.com/user';

Duration authTimeout = const Duration(seconds: 5);
Duration otpTimeout = const Duration(seconds: 10);

void noInternet() => showSnackBar('No Internet');
void timeOut() => showSnackBar('Timeout');
