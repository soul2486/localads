import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:localads/utilis/constant.dart';
import 'package:localads/widgets/custom_button.dart';
import 'package:localads/widgets/input_field.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class AddAds extends StatefulWidget {
  const AddAds({Key? key}) : super(key: key);

  @override
  State<AddAds> createState() => _AddAdsState();
}

class _AddAdsState extends State<AddAds> {
  TextEditingController adsTitle = TextEditingController();
  TextEditingController adsDescription = TextEditingController();
  TextEditingController adsPrice = TextEditingController();
  TextEditingController adsCategories = TextEditingController();
  TextEditingController adsLocalisation = TextEditingController();
  final List<String> _ma = [
    "1",
    "test1",
    "2",
    "test2",
    "3",
    "test3",
    "4",
    "test4",
    "1",
    "test1",
    "2",
    "test2",
    "3",
    "test3",
    "4",
    "test4",
  ];
  @override
  Widget build(BuildContext context) {
    String label;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Text("Publier Une Annonce"),
        ),
        backgroundColor: secondaryColor,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // InkWell(
                //     onTap: () => selectImage(),
                //     child: image == null
                //         ? CircleAvatar(
                //             backgroundColor: secondaryColorOpacity,
                //             radius: 75,
                //             child: Icon(
                //               Icons.account_circle,
                //               size: 80,
                //               color: Colors.white,
                //             ),
                //           )
                //         : CircleAvatar(
                //             backgroundImage: FileImage(image!),
                //             radius: 50,
                //           )),
                Input_field(
                  // icon: Icons.account_circle,
                  inputType: TextInputType.name,
                  controller: adsTitle,
                  hintext: " Titre",
                ),
                Input_field(
                  maxline: 2,
                  // icon: Icons.email_rounded,
                  inputType: TextInputType.name,
                  controller: adsDescription,
                  hintext: "Description",
                ),
                Input_field(
                  suffix: "FCFA",
                  // icon: Icons.account_balance_outlined,
                  inputType: TextInputType.number,
                  controller: adsPrice,
                  hintext: "Prix",
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: MultiSelectDialogField(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: Color.fromARGB(255, 221, 220, 220))
                        // color: Color.fromARGB(255, 202, 201, 201),
                        // borderRadius: BorderRadius.circular(10),
                        // border: Border(
                        //   bottom: BorderSide(
                        //       style: BorderStyle.solid, color: Colors.black),
                        // ),
                        ),
                    // separateSelectedItems: true,
                    searchable: true,
                    // searchHint: "search",
                    dialogHeight: 200,
                    buttonText: Text(
                      "Categories",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    items: _ma
                        .map((value) => MultiSelectItem(value, "Electronic"))
                        .toList(),

                    // items: _ma
                    //     .map((
                    //       e,
                    //     ) =>
                    //         MultiSelectItem(e, "test"))
                    //     .toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: (values) {
                      // _ma = values;
                    },
                  ),
                ),
                // Input_field(
                //   // suffix: "FCFA",
                //   inputType: TextInputType.name,
                //   controller: adsCategories,
                //   hintext: "Categories",
                // ),
                // DropdownButton(items: DropdownMenuItem(child: ), onChanged: (value) {

                // },),
                Input_field(
                  // suffix: "FCFA",
                  inputType: TextInputType.name,
                  controller: adsLocalisation,
                  hintext: "Localisation",
                ),
                SizedBox(
                  height: 30,
                ),
                customButton(
                  onclick: () {
                    // storeData();
                  },
                  elementChild: Text("Publier"),
                  colorBack: secondaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
