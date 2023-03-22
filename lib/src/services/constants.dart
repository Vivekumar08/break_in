import '../style/snack_bar.dart';

String baseUrl = 'https://breakin-backend.onrender.com/user';
String fileInfo = 'https://breakin-backend.onrender.com/fileinfo';

Duration authTimeout = const Duration(seconds: 5);
Duration otpTimeout = const Duration(seconds: 10);
Duration settingsTimeout = const Duration(seconds: 5);

void noInternet() => showSnackBar('No Internet');
void timeOut() => showSnackBar('Timeout');
