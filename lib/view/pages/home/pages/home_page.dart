import 'package:flutter/material.dart';
import 'package:web_api_app/controller/todo_controller.dart';
import 'package:web_api_app/view/pages/home/widgets/bottom_sheet_edit.dart';
import 'package:web_api_app/view/pages/home/widgets/custom_appbar.dart';
import 'package:web_api_app/view/pages/home/widgets/custom_container.dart';
import 'package:web_api_app/view/utils/color.dart';
import 'package:provider/provider.dart';
import 'package:web_api_app/view/utils/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Clr.black,
      appBar: CustomAppbar(
        title: 'Todo List',
        centerTitle: true,
      ),
      body: Consumer<TodoController>(builder: (context, contrl, child) {
        return contrl.isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                color: Clr.white,
                strokeWidth: 8,
              ))
            : contrl.isLoading == true
                ? Center(
                    child: Text(
                      'No Data Found',
                      style: TxtStyles.titleWFonts,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: List.generate(contrl.todos.length, (index) {
                        return CustomContainer(
                          index: index,
                        );
                      }),
                    ),
                  );
      }),
      floatingActionButton:
          Consumer<TodoController>(builder: (context, cntrl, child) {
        return FloatingActionButton.extended(
          backgroundColor: Clr.mainColor,
          onPressed: () {
            cntrl.name.clear();
            cntrl.address.clear();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomSheetEdit(),
                ));
          },
          label: Text('Add', style: TxtStyles.textWFonts1),
          icon: Icon(
            Icons.add,
            color: Clr.white,
            size: 25,
          ),
        );
      }),
    );
  }
}
