import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../components/routing_list.dart';
import '../../providers/providers.dart';
import '../../router/constants.dart';
import '../../services/constants.dart';
import '../../style/fonts.dart';
import '../../style/palette.dart';
import '../../style/snack_bar.dart';
import '../../utils/symbols.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("My Profile", style: Fonts.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Palette.background,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<UserProvider>(builder: (context, provider, _) {
                    final user = provider.user;
                    return user == null
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user.fullName,
                                  style: Fonts.subHeading.copyWith(
                                      color: Palette.text, fontSize: 16.0)),
                              const SizedBox(height: 8.0),
                              Text(user.email ?? 'Email',
                                  style: Fonts.medTextBlack
                                      .copyWith(fontSize: 12.0)),
                              Text(user.phoneNo ?? 'Phone No.',
                                  style: Fonts.medTextBlack
                                      .copyWith(fontSize: 12.0)),
                              const Spacer(),
                              GestureDetector(
                                onTap: () => context.go(myProfile),
                                child: Row(
                                  children: [
                                    Symbols.edit,
                                    const SizedBox(width: 8.0),
                                    Text('Edit Profile',
                                        style: Fonts.medTextBlack
                                            .copyWith(fontSize: 12.0)),
                                    const Icon(Icons.arrow_forward, size: 12.0),
                                  ],
                                ),
                              )
                            ],
                          );
                  }),
                  const ProfilePic(),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Text('More',
                style: Fonts.subHeading
                    .copyWith(color: Palette.text, fontSize: 16.0)),
            const SizedBox(height: 8.0),
            const RoutingList(title: "My Favourite", route: favourite),
            const RoutingList(title: "Suggest a Place", route: suggestPlace),
            const RoutingList(title: "Settings", route: settings),
            const RoutingList(title: "Feedback", route: feedback),
            const RoutingList(title: "About Us", route: aboutUs),
            const RoutingList(title: "Help", route: help),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Version 1.0.0',
                style: Fonts.appBarTitle
                    .copyWith(color: Palette.secondary, fontSize: 14.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key});

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  final ImagePicker _picker = ImagePicker();
  String? imageUrl;

  @override
  void didChangeDependencies() {
    final provider = Provider.of<UserProvider>(context);
    if (provider.user != null && provider.user!.profilePic != null) {
      imageUrl = '$fileInfo/${provider.user!.profilePic!}';
      setState(() {});
    }
    super.didChangeDependencies();
  }

  void uploadImage(UserProvider provider, {bool gallery = false}) async {
    XFile? file = await _picker
        .pickImage(
            source: gallery ? ImageSource.gallery : ImageSource.camera,
            imageQuality: 50)
        .whenComplete(() => context.pop());
    if (file != null) {
      if (await file.length() > 1000000) {
        showSnackBar('File should be less than 1 mb');
        return;
      }
      provider.uploadProfilePic(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () => provider.state.updating()
          ? showSnackBar('Profile Pic is getting uploaded...')
          : showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async => uploadImage(provider),
                        child: const ListTile(
                            leading: Icon(Icons.camera), title: Text('Camera')),
                      ),
                      InkWell(
                        onTap: () async => uploadImage(provider, gallery: true),
                        child: const ListTile(
                            leading: Icon(Icons.image), title: Text('Gallery')),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      child: CircleAvatar(
        radius: 40.0,
        backgroundColor: Palette.background,
        backgroundImage: imageUrl == null
            ? Symbols.profile.image
            : CachedNetworkImageProvider(imageUrl!),
      ),
    );
  }
}
