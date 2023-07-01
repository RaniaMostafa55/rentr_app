import 'package:renta_app/controller/imports.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List<bool> pressed = [false, false, false, false, false];

  // bool isProfileUser = true;

  Timer? timer1;

  @override
  Widget build(BuildContext context) {
    // if (isUserAccount) {
    //   timer1 = Timer.periodic(const Duration(milliseconds: 3),
    //       (Timer t) => bLoC.getUserReview(context: context));
    // } else {
    //   timer1 = Timer.periodic(
    //       const Duration(milliseconds: 3),
    //       (Timer t) => bLoC.getAnotherUserReview(
    //           context: context, userId: bLoC.anotherUserModel.data!.id!));
    // }

    final pro = Provider.of<MyProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              shadowContainer(
                context: context,
                height: MediaQuery.of(context).size.height * 0.42,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              Column(
                children: [
                  GlobalAppBar(
                    title: "profile",
                    hasActions: (isUserAccount == false) ? true : false,
                    iconAction: [
                      IconButton(
                          onPressed: () {
                            rateDialog(
                                rated: "user",
                                pressed: pressed,
                                userId: bLoC.anotherUserModel.data!.id,
                                context: context);
                          },
                          icon: Icon(
                            Icons.star_rate,
                            color: yellowColor,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Stack(
                      clipBehavior: Clip.none,
                      // alignment: Alignment.bottomRight,
                      children: [
                        userImage(
                          context: context,
                          image: (isUserAccount)
                              ? (bLoC.userModel.data!.image!.isEmpty)
                                  ? const NetworkImage(
                                      "https://images.pexels.com/photos/6214478/pexels-photo-6214478.jpeg?auto=compress&cs=tinysrgb&w=1600")
                                  : NetworkImage(bLoC.userModel.data!.image!)
                              : (bLoC.anotherUserModel.data!.image!.isEmpty)
                                  ? const NetworkImage(
                                      "https://images.pexels.com/photos/6214478/pexels-photo-6214478.jpeg?auto=compress&cs=tinysrgb&w=1600")
                                  : NetworkImage(
                                      bLoC.anotherUserModel.data!.image!),
                        ),
                        (isUserAccount)
                            ? Positioned(
                                right: -10,
                                bottom: -10,
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (builder) => bottomSheet(
                                        context: context,
                                        onGalleryPressed: bLoC.getFromGallery,
                                        onCameraPressed: pro.getFromCamera,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 10,
                                              offset: const Offset(0, 2),
                                              color: greyColor.withOpacity(0.2))
                                        ]),
                                    child: const Icon(
                                      Icons.edit,
                                      color: secColor,
                                      size: 17,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox()
                      ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  StreamBuilder(
                      initialData: bLoC.userModel,
                      stream: bLoC.user,
                      builder: (context, snapshot) {
                        return Text(
                          (isUserAccount)
                              ? snapshot.data!.data!.name!
                              : bLoC.anotherUserModel.data!.name!,
                          style: const TextStyle(
                              color: mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 110.0),
                    child: Divider(
                      color: greyColor.withOpacity(0.5),
                    ),
                  ),
                  const LocaleText(
                    "rating",
                    style: TextStyle(
                        color: greyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.001,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (isUserAccount)
                          ? StreamBuilder(
                              initialData: bLoC.getUserReviewModel,
                              stream: bLoC.userReview,
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.data!.data!.totalReviews!.toString(),
                                  style: TextStyle(
                                      color: yellowColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                );
                              })
                          : StreamBuilder(
                              initialData: bLoC.getAnotherUserReviewModel,
                              stream: bLoC.anotherUserReview,
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.data!.data!.totalReviews!.toString(),
                                  style: TextStyle(
                                      color: yellowColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                );
                              }),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Icon(
                        Icons.star_rate,
                        color: yellowColor,
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     // Column(
                  //     //   children: [
                  //     //     const LocaleText(
                  //     //       "total_deals",
                  //     //       style: TextStyle(
                  //     //           color: greyColor,
                  //     //           fontWeight: FontWeight.w500,
                  //     //           fontSize: 17),
                  //     //     ),
                  //     //     SizedBox(
                  //     //       height: MediaQuery.of(context).size.height * 0.001,
                  //     //     ),
                  //     //     const Text(
                  //     //       "6",
                  //     //       style: TextStyle(
                  //     //           color: secColor,
                  //     //           fontWeight: FontWeight.bold,
                  //     //           fontSize: 20),
                  //     //     )
                  //     //   ],
                  //     // ),
                  //     SizedBox(
                  //       width: MediaQuery.of(context).size.width * 0.04,
                  //     ),
                  //     Container(
                  //       width: 1,
                  //       height: MediaQuery.of(context).size.height * 0.06,
                  //       color: greyColor.withOpacity(0.5),
                  //     ),
                  //     SizedBox(
                  //       width: MediaQuery.of(context).size.width * 0.04,
                  //     ),
                  //     Column(
                  //       children: [],
                  //     )
                  //   ],
                  // )
                ],
              ),
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.001,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  shadowContainer(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 10, right: 10),
                        child: StreamBuilder(
                            initialData: bLoC.userModel,
                            stream: bLoC.user,
                            builder: (context, snapshot) {
                              return Column(
                                children: [
                                  data(
                                      title: "username",
                                      info: (isUserAccount)
                                          ? snapshot.data!.data!.name!
                                          : bLoC.anotherUserModel.data!.name!),
                                  data(
                                      title: "email_address",
                                      info: (isUserAccount)
                                          ? snapshot.data!.data!.email!
                                          : bLoC.anotherUserModel.data!.email!),
                                  data(
                                      title: "phone_number",
                                      info: (isUserAccount)
                                          ? snapshot.data!.data!.phone!
                                          : bLoC.anotherUserModel.data!.phone!),
                                  data(
                                      title: "address",
                                      info: "view_location",
                                      isButton: true,
                                      onPressed: () {
                                        Utils.openGoogleMaps(
                                            latitude: (isUserAccount)
                                                ? snapshot.data!.data!.latitude!
                                                : bLoC.anotherUserModel.data!
                                                    .latitude!,
                                            longitude: (isUserAccount)
                                                ? snapshot
                                                    .data!.data!.longitude!
                                                : bLoC.anotherUserModel.data!
                                                    .longitude!);
                                      }),
                                  data(
                                      title: "join_date",
                                      info: (isUserAccount)
                                          ? snapshot.data!.data!.createdAt!
                                          : bLoC.anotherUserModel.data!
                                              .createdAt!)
                                ],
                              );
                            }),
                      )),
                  (isUserAccount)
                      ? Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            // Divider(
                            //   color: greyColor.withOpacity(0.5),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                titlee(text: "settings", size: 16),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),

                            InkWell(
                              onTap: () {
                                notSignedUpYet = false;
                                bLoC.getUserData();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ChangeUserData(),
                                    ));
                              },
                              child: shadowContainer(
                                  borderRadius: BorderRadius.circular(10),
                                  child: const Padding(
                                    padding: EdgeInsets.all(18.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        LocaleText(
                                          "change_user_data",
                                          style: TextStyle(
                                              fontSize: 16, color: greyColor),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 18,
                                          color: secColor,
                                        )
                                      ],
                                    ),
                                  )),
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isResetPass = false;
                                  isChangePass = true;
                                  print(isResetPass);
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ChangePassView(),
                                    ));
                              },
                              child: shadowContainer(
                                  borderRadius: BorderRadius.circular(10),
                                  child: const Padding(
                                    padding: EdgeInsets.all(18.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        LocaleText(
                                          "change_password",
                                          style: TextStyle(
                                              fontSize: 16, color: greyColor),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 18,
                                          color: secColor,
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            InkWell(
                              onTap: () {
                                // LocaleNotifier.of(context)!.change('ar');
                                showDialog(
                                  context: context,
                                  builder: (context) => StatefulBuilder(
                                    builder: (context, setState) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      title: Center(
                                        child: titlee(
                                            text: "select_language", size: 18),
                                      ),
                                      content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              children: [
                                                Checkbox(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                  ),
                                                  checkColor: secColor,
                                                  activeColor: textFieldColor
                                                      .withOpacity(0.8),
                                                  value: CacheHelper.getBool(
                                                      key: "isEnglish",
                                                      choice: true),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      CacheHelper.putBool(
                                                          key: "isEnglish",
                                                          value: value!);
                                                      pro.changeLanguage(
                                                          isEng: CacheHelper
                                                              .getBool(
                                                                  key:
                                                                      "isEnglish",
                                                                  choice:
                                                                      true));
                                                      // CacheHelper.putBool(
                                                      //     key: "isArabic",
                                                      //     value: !value);
                                                      LocaleNotifier.of(
                                                              context)!
                                                          .change('en');
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Text(
                                                  "English",
                                                  style: TextStyle(
                                                      color: mainColor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                            Row(
                                              children: [
                                                Checkbox(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                  ),
                                                  checkColor: secColor,
                                                  activeColor: textFieldColor
                                                      .withOpacity(0.8),
                                                  value: !CacheHelper.getBool(
                                                      key: "isEnglish",
                                                      choice: true),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      CacheHelper.putBool(
                                                          key: "isEnglish",
                                                          value: !value!);
                                                      pro.changeLanguage(
                                                          isEng: CacheHelper
                                                              .getBool(
                                                                  key:
                                                                      "isEnglish",
                                                                  choice:
                                                                      true));
                                                      LocaleNotifier.of(
                                                              context)!
                                                          .change('ar');
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Text(
                                                  "العربية",
                                                  style: TextStyle(
                                                      color: mainColor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            )
                                          ]),
                                    ),
                                  ),
                                );
                              },
                              child: shadowContainer(
                                  borderRadius: BorderRadius.circular(10),
                                  child: const Padding(
                                    padding: EdgeInsets.all(18.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        LocaleText(
                                          "change_language",
                                          style: TextStyle(
                                              fontSize: 16, color: greyColor),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 18,
                                          color: secColor,
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
