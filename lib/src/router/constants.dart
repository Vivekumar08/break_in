const String root = '/';
const String loginWithMail = '/loginWithMail';
const String loginWithPhone = '/loginWithPhone';
const String otpWithPhone = '$loginWithPhone/otpWithPhone';
const String forgotPassword = '$loginWithMail/forgotPassword';
const String otpWithMail = '$forgotPassword/otpWithMail';
const String newPassword = '$forgotPassword/newPassword';
const String passwdChanged = '$loginWithMail/passwdChanged';
const String registerWithPhone = '$loginWithPhone/registerWithPhone';
const String registerWithOtp = '$registerWithPhone/registerWithOtp';
const String registerWithMail = '$loginWithMail/registerWithMail';

// Location
const String location = '/location';

// salutation
const String salutation = '/salutation';

// Home Route
const String home = '/home';
const String categories = '$home/categories';
const String search = '$home/search';

// Pages Route
const String foodPlace = '$home/foodPlace';
const String menu = '$foodPlace/menu';
const String rate = '$menu/rate';

// Settings Route
const String profile = '$home/profile';
const String myProfile = '$profile/myProfile';
const String favourite = '$profile/favourite';
const String help = '$profile/help';
const String feedback = '$profile/feedback';
const String settings = '$profile/settings';
const String aboutUs = '$profile/aboutUs';
const String suggestPlace = '$profile/suggestPlace';
