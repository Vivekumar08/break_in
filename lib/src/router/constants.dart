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

// TODO: Configure root
const String detectingLocation = '/detectingLocation';
const String detectedLocation = '/detectedLocation';
const String manualLocation = '/manualLocation';
const String salutation = '/salutation';

// Home Route
const String home = '/home';
const String categories = '$home/categories';

// About Route
const String profile = '/profile';
const String myProfile = '$profile/myProfile';
const String help = '$profile/help';
const String feedback = '$profile/feedback';
const String settings = '$profile/settings';
const String aboutUs = '$profile/aboutUs';
const String ourStory = '$aboutUs/ourStory';
const String ourValue = '$aboutUs/ourValue';
const String ourMission = '$aboutUs/ourMission';
const String ourTeam = '$aboutUs/ourTeam';
const String suggestPlace = '$profile/suggestPlace';
const String detectionNewLocation = '$myProfile/detectionNewLocation';
const String detectNewLocation = '$myProfile/detectedNewLocation';
