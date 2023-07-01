import 'package:renta_app/controller/imports.dart';

TextEditingController locationController = TextEditingController();
int? categoryId;

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  List<File>? imageFile = [];
  List? pickedFilesNames = [];
  void _getFromGallery({required TextEditingController controller}) async {
    List<XFile>? pickedFile =
        await ImagePicker().pickMultiImage(maxHeight: 1080, maxWidth: 1080);
    setState(() {
      for (var i = 0; i < pickedFile.length; i++) {
        imageFile!.add(File(pickedFile[i].path));
        pickedFilesNames!.add(pickedFile[i].name);
      }
      controller.text = pickedFilesNames.toString();
      // controller.text = pickedFile.name;
    });
  }

  late DateTime? start;
  late DateTime? end;
  DateTime date = DateTime.now();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imagesController = TextEditingController();
  TextEditingController itemLatitudeAddressController = TextEditingController();
  TextEditingController itemLongitudeAddressController =
      TextEditingController();
  String? value;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: const GlobalAppBar(
        title: "add_item",
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Image(image: AssetImage("assets/images/add items.png")),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            note(
                text: "please_fill_the_required_data_to_add_your_item",
                opacity: 0.5),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    globalTextField(
                      label: "item_name",
                      controller: itemNameController,
                      prefix: Icons.label_outline_sharp,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter the product name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    globalTextField(
                      label: "description",
                      controller: descriptionController,
                      maxLines: 5,
                      prefix: Icons.type_specimen_outlined,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter the product description";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    globalTextField(
                      label: "price",
                      controller: priceController,
                      prefix: Icons.attach_money_outlined,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter the product price";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    globalTextField(
                      label: "address",
                      controller: locationController,
                      readOnly: true,
                      prefix: Icons.location_on_outlined,
                      onTap: () {
                        notSignedUpYet = true;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddLocation(
                                controller: locationController,
                                latitudeController:
                                    itemLatitudeAddressController,
                                longitudeController:
                                    itemLongitudeAddressController,
                              ),
                            ));
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter the product address";
                        } else {
                          return null;
                        }
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    globalTextField(
                        controller: startDate,
                        readOnly: true,
                        label: "booking_start_date",
                        prefix: Icons.calendar_month_outlined,
                        onTap: () async {
                          DateTime? start = await showDatePicker(
                              builder: (context, child) => Theme(
                                  data: ThemeData(
                                    colorScheme: const ColorScheme.light(
                                      primary: mainColor,
                                    ),
                                  ),
                                  child: child ?? const Text("")),
                              context: context,
                              initialDate: date,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2030));
                          if (start != null) {
                            startDate.text = DateFormat.yMMMEd().format(start);
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter booking start date";
                          } else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.next),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    globalTextField(
                        controller: endDate,
                        readOnly: true,
                        label: "booking_end_date",
                        prefix: Icons.calendar_month_outlined,
                        onTap: () async {
                          DateTime? end = await showDatePicker(
                              builder: (context, child) => Theme(
                                  data: ThemeData(
                                      colorScheme: const ColorScheme.light(
                                    primary: mainColor,
                                  )),
                                  child: child ?? const Text("")),
                              context: context,
                              initialDate: date,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2030));
                          if (end != null) {
                            endDate.text = DateFormat.yMMMEd().format(end);
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter booking end date";
                          } else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.next),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    globalTextField(
                        controller: imagesController,
                        readOnly: true,
                        label: "attach_item_pic",
                        prefix: Icons.attachment_outlined,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet(
                                  context: context,
                                  isAddingItem: true,
                                  onGalleryPressed: () {
                                    _getFromGallery(
                                        controller: imagesController);
                                  },
                                )),
                          );
                        },
                        validator: (value) {
                          if (imageFile!.length > 3) {
                            imageFile!.clear();
                            pickedFilesNames!.clear();
                            return "You can add 3 images maximum";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 7),
                      decoration: BoxDecoration(
                          color: textFieldColor.withOpacity(0.20),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: const LocaleText("select_category"),
                          value: value,
                          borderRadius: BorderRadius.circular(10),
                          isExpanded: true,
                          iconEnabledColor: secColor,
                          iconSize: 36,
                          items: (pro.isEnglish)
                              ? englishCategories
                                  .map((e) => buildMenuItem(e))
                                  .toList()
                              : arabicCategories
                                  .map((e) => buildMenuItem(e))
                                  .toList(),
                          onChanged: (value) => setState(() {
                            this.value = value;
                            identifyCategoryId(value!);
                            // print(categoryId);
                          }),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    matButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            bLoC.addProduct(
                              name: itemNameController.text,
                              description: descriptionController.text,
                              categoryId: (categoryId == null)
                                  ? "1"
                                  : categoryId.toString(),
                              price: priceController.text,
                              latitude: itemLatitudeAddressController.text,
                              longitude: itemLongitudeAddressController.text,
                              startDate: startDate.text,
                              endDate: endDate.text,
                              context: context,
                              imageFileList: imageFile!,
                            );
                          }
                          // bloC.addProduct();
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const HomeView(),
                          //     ));
                        },
                        text: "add",
                        context: context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
      ),
    );
int identifyCategoryId(String value) {
  if (value == arabicCategories[0] || value == englishCategories[0]) {
    categoryId = bLoC.getCategoriesModel!.productsData![0].id;
  } else if (value == arabicCategories[1] || value == englishCategories[1]) {
    categoryId = bLoC.getCategoriesModel!.productsData![1].id;
  } else if (value == arabicCategories[2] || value == englishCategories[2]) {
    categoryId = bLoC.getCategoriesModel!.productsData![2].id;
  } else if (value == arabicCategories[3] || value == englishCategories[3]) {
    categoryId = bLoC.getCategoriesModel!.productsData![3].id;
  } else if (value == arabicCategories[4] || value == englishCategories[4]) {
    categoryId = bLoC.getCategoriesModel!.productsData![4].id;
  } else if (value == arabicCategories[5] || value == englishCategories[5]) {
    categoryId = bLoC.getCategoriesModel!.productsData![5].id;
  } else if (value == arabicCategories[6] || value == englishCategories[6]) {
    categoryId = bLoC.getCategoriesModel!.productsData![6].id;
  } else if (value == arabicCategories[7] || value == englishCategories[7]) {
    categoryId = bLoC.getCategoriesModel!.productsData![7].id;
  } else if (value == arabicCategories[8] || value == englishCategories[8]) {
    categoryId = bLoC.getCategoriesModel!.productsData![8].id;
  }
  return categoryId!;
}
