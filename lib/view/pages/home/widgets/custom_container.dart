import 'package:flutter/material.dart';
import 'package:web_api_app/controller/todo_controller.dart';
import 'package:web_api_app/view/pages/home/widgets/bottom_sheet_edit.dart';
import 'package:web_api_app/view/pages/home/widgets/custom_text_field.dart';
import 'package:web_api_app/view/utils/color.dart';
import 'package:web_api_app/view/utils/text_styles.dart';
import 'package:provider/provider.dart';

class CustomContainer extends StatelessWidget {
  int index;
  CustomContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Clr.darkmainColor,
                Clr.mainColor,
                Clr.lightmainColor,
              ]),
          //color: Clr.containerColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Clr.shadowColor,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ]),
      child: Consumer<TodoController>(builder: (context, contrller, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contrller.todos[index].name,
                      style: TxtStyles.textWFonts,
                    ),
                    Text(
                      contrller.todos[index].address,
                      style: TxtStyles.subtextPFonts,
                    ),
                  ],
                )),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Clr.darkgreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      onPressed: () {
                        contrller.name.text = contrller.todos[index].name;
                        contrller.address.text = contrller.todos[index].address;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomSheetEdit(
                                id: contrller.todos[index].userId.toString(),
                                name: contrller.todos[index].name,
                                address: contrller.todos[index].address,
                              ),
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            color: Clr.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Edit',
                            style: TxtStyles.textWFonts,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Clr.darkred,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      onPressed: () {
                        openDeleteBottom(
                            context, contrller.todos[index].userId.toString());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Clr.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Delete',
                            style: TxtStyles.textWFonts,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        );
      }),
    );
  }

  openDeleteBottom(BuildContext context, String id) {
    showModalBottomSheet(
      context: context,
      // isScrollControlled: true,
      backgroundColor: Clr.black,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              Text(
                'Delete Todo',
                style: TxtStyles.textWFonts1,
              ),
              SizedBox(height: 10),
              Consumer<TodoController>(builder: (context, value, child) {
                return value.addLoad == true
                    ? Center(
                        child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: Clr.white,
                              strokeWidth: 7,
                            )),
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MaterialButton(
                                color: Clr.mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 50,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.close,
                                      color: Clr.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Cancel',
                                      style: TxtStyles.textWFonts,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MaterialButton(
                                color: Clr.darkred,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 50,
                                onPressed: () {
                                  value.deleteList(context, id);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.check,
                                      color: Clr.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Confirm',
                                      style: TxtStyles.textWFonts,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
              }),
              SizedBox(
                height: 10,
              )
            ],
          ),
        );
      },
    );
  }
}
