import 'package:flutter/material.dart';
import 'package:web_api_app/view/pages/home/pages/home_page.dart';
import 'package:web_api_app/view/utils/color.dart';
import 'package:web_api_app/view/utils/text_styles.dart';
import 'package:provider/provider.dart';

import '../../../controller/todo_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      splashFuc();
       Provider.of<TodoController>(context, listen: false).fetchData();
    });

    // TODO: implement initState
    super.initState();
  }

  splashFuc() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Clr.mainColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Icon(
                  Icons.note_alt_outlined,
                  size: 100,
                  color: Clr.white,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Welcome to Note App',
                style: TxtStyles.titleWFonts,
              )
            ],
          ),
        ),
      ),
    );
  }
}
