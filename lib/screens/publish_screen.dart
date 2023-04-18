import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:localads/models/annonce.dart';
import 'package:localads/services/annonce_service.dart';
import 'package:localads/utilis/constant.dart';
import 'package:localads/utilis/get_image.dart';
import 'package:localads/utilis/helpers.dart';
import 'package:localads/widgets/custom_button.dart';
import 'package:localads/widgets/input_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class AddAds extends StatefulWidget {
  const AddAds({Key? key}) : super(key: key);

  @override
  State<AddAds> createState() => _AddAdsState();
}

class _AddAdsState extends State<AddAds> {
  TextEditingController adsTitle = TextEditingController();
  TextEditingController adsDescription = TextEditingController();
  TextEditingController adsPrice = TextEditingController();
  List adsCategories = [];
  File? image;
  List<File> images = [];
  bool isloading = false;
  TextEditingController adsLocalisation = TextEditingController();
  final List<String> _ma = [
    "Telephone",
    "ElectroMenager",
    "Gastronomie",
    "Vestimentaire",
    "Sante",
    "Ordinateur",
    "Tablette",
    "Immobilier",
  ];
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    String label;
    return Scaffold(
      appBar: AppBar(
        // bottom: ,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Text("Publier Une Annonce"),
        ),
        backgroundColor: secondaryColor,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      body: SafeArea(
        // bottom: mounted,
        // maintainBottomViewPadding: true,
        child: isloading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: secondaryColor,
                ),
              )
            : Center(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 8),
                        child: MultiSelectDialogField(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          items: _ma
                              .map((value) => MultiSelectItem(value, value))
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
                            adsCategories = values;
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
                        height: 15,
                      ),
                      Wrap(
                        // crossAxisAlignment: WrapCrossAlignment.start,
                        // alignment: WrapAlignment.start,
                        children: [
                          for (int i = 0; i < images.length; i++)
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(.4)),
                              margin: EdgeInsets.only(bottom: 15, right: 8),
                              height: 100,
                              width: 100,
                              child: Stack(
                                children: [
                                  Image.file(
                                    images[i],
                                    width: 120,
                                    alignment: Alignment.center,
                                    fit: BoxFit.cover,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: IconButton(
                                        onPressed: () {
                                          images.removeAt(i);
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.remove_circle,
                                          size: 20,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          Container(
                            height: 100,
                            width: 100,
                            child: InkWell(
                              onTap: () async {
                                final data = await showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return GetImage();
                                  },
                                );
                                setState(() {
                                  images.add(data);
                                });
                              },
                              child: Icon(
                                Icons.add_a_photo,
                                size: 50,
                                color: secondaryColor,
                              ),

                              // : CircleAvatar(
                              //     backgroundImage: FileImage(image!),
                              //     radius: 50,
                              //   ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      customButton(
                        onclick: () async {
                          isloading = true;
                          setState(() {});
                          List<String> urlImage = [];
                          for (int i = 0; i < images.length; i++) {
                            String path = images[i].path.split('/').last;
                            urlImage.add(
                              await ap.storeFileToStorage(
                                  "annonces/$path", images[i]),
                            );
                          }
                          Annonce annonce = new Annonce(
                              titre: adsTitle.text,
                              description: adsDescription.text,
                              categorie: adsCategories,
                              imageURL: urlImage,
                              date: Timestamp.now().toString(),
                              userId: "");
                          AnnonceService annonceService = new AnnonceService();
                          annonceService.publierAnnonce(annonce);
                          setState(() {
                            isloading = false;
                          });
                          Navigator.of(context).pop();
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
