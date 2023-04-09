import '../style/snack_bar.dart';

String baseUrl = 'https://breakin-backend.onrender.com/user';
String dataUrl = 'https://breakin-backend.onrender.com/getData';
String fileInfo = 'https://breakin-backend.onrender.com/fileinfo';

Duration duration_5 = const Duration(seconds: 5);
Duration duration_10 = const Duration(seconds: 10);

void noInternet() => showSnackBar('No Internet');
void timeOut() => showSnackBar('Timeout');
