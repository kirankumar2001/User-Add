import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_api_app/controller/todo_controller.dart';
import 'package:web_api_app/view/pages/home/widgets/custom_appbar.dart';
import 'package:web_api_app/view/pages/home/widgets/custom_text_field.dart';
import 'package:web_api_app/view/utils/color.dart';
import 'package:web_api_app/view/utils/text_styles.dart';

class BottomSheetEdit extends StatelessWidget {
  String? id;
  String? name;
  String? address;

  BottomSheetEdit({super.key, this.id, this.name, this.address});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          title: id == null ? 'Add List' : 'Edit List',
        ),
        backgroundColor: Clr.black,
        body: Consumer<TodoController>(builder: (context, ctrl, child) {
          return Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  controller: ctrl.name,
                  hintText: 'Name',
                  hintStyle: TxtStyles.textPFonts,
                  validator: (p0) {
                    if (p0 == null || p0 == '') {
                      return 'Please enter name';
                    } else {
                      return null;
                    }
                  },
                ),
                CustomTextFormField(
                  lines: 5,
                  controller: ctrl.address,
                  hintText: 'Address',
                  hintStyle: TxtStyles.textPFonts,
                  validator: (p0) {
                    if (p0 == null || p0 == '') {
                      return 'Please enter address';
                    } else {
                      return null;
                    }
                  },
                )
              ],
            ),
          );
        }),
        bottomNavigationBar:
            Consumer<TodoController>(builder: (context, ctrl, child) {
          return BottomAppBar(
            height: 60,
            padding: EdgeInsets.all(6),
            color: Clr.darkgreen,
            child: Center(
              child: ctrl.addLoad == true
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          color: Clr.white,
                          strokeWidth: 5,
                        ),
                      ),
                    )
                  : MaterialButton(
                      height: 60,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (id == null) {
                            ctrl.addList(context);
                          } else {
                            ctrl.editList(context, id!);
                          }
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check,
                            color: Clr.white,
                            size: 27,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Done',
                            style: TxtStyles.textWFonts1,
                          ),
                        ],
                      ),
                    ),
            ),
          );
        }));
  }
}
