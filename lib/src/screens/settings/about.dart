import 'package:flutter/material.dart';
import '../../components/routing_list.dart';
import '../../router/constants.dart';
import '../../style/fonts.dart';

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("About Us", style: Fonts.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            RoutingList(title: "Our Story", route: ourStory),
            RoutingList(title: "Our Values", route: ourValue),
            RoutingList(title: "Our Mission", route: ourMission),
            RoutingList(title: "Our Team", route: ourTeam),
          ],
        ),
      ),
    );
  }
}

class OurStory extends StatelessWidget {
  const OurStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("Our Story", style: Fonts.appBarTitle),
      ),
    );
  }
}

class OurValue extends StatelessWidget {
  const OurValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("Our Value", style: Fonts.appBarTitle),
      ),
    );
  }
}

class OurMission extends StatelessWidget {
  const OurMission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("Our Mission", style: Fonts.appBarTitle),
      ),
    );
  }
}

class OurTeam extends StatelessWidget {
  const OurTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("Our Team", style: Fonts.appBarTitle),
      ),
    );
  }
}
