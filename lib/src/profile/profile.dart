import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../router/constants.dart';
import '../style/fonts.dart';
import '../style/palette.dart';
import '../utils/images.dart';
import '../utils/symbols.dart';

// TODO: back button
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  Widget _buildMore(String text, BuildContext context, String route) =>
      ListTile(
        title:
            Text(text, style: Fonts.buttonText.copyWith(color: Palette.text)),
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 0,
        dense: true,
        trailing: const Icon(
          Icons.chevron_right,
          size: 32,
        ),
        shape: text != "Our Team"
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: Palette.greyNormal))
            : null,
        onTap: () => context.go(route),
      );

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Vikshat',
                          style: Fonts.subHeading
                              .copyWith(color: Palette.text, fontSize: 16.0)),
                      const SizedBox(height: 8.0),
                      Text('vikshat@gmail.com',
                          style: Fonts.medTextBlack.copyWith(fontSize: 12.0)),
                      Text('+91 9876543210',
                          style: Fonts.medTextBlack.copyWith(fontSize: 12.0)),
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
                  ),
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Palette.background,
                    child: Images.feeding,
                  )
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Text('More',
                style: Fonts.subHeading
                    .copyWith(color: Palette.text, fontSize: 16.0)),
            const SizedBox(height: 8.0),
            // TODO: My favourite route
            _buildMore("My Favourite", context, home),
            _buildMore("Suggest a Place", context, suggestPlace),
            _buildMore("Settings", context, settings),
            _buildMore("Feedback", context, feedback),
            _buildMore("About Us", context, aboutUs),
            _buildMore("Help", context, help),
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
