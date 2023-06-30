import 'package:renta_app/controller/imports.dart';

List<String> itemsPics = [
  "assets/images/cam1.png",
  "assets/images/TV.png",
  "assets/images/microwave.png",
  "assets/images/laptop.png",
  "assets/images/cam1.png",
];

List<String> itemNames = [
  "camera",
  "tv",
  "microwave",
  "laptop",
  "camera",
];

List<String> itemPrices = [
  "SAR 50",
  "SAR 100",
  "SAR 70",
  "SAR 45",
  "SAR 37",
];

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  List region = ["giza", "giza", "giza", "cairo", "cairo"];
  List price = ["SAR 50", "SAR 70", "SAR 40", "SAR 40", "SAR 50"];
  List isTapped = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List tabsNames = [
    'Electronics',
    'Plumbing Tools',
    'Stationery',
    'Household Items',
    'Trip Tools',
    'Private Items',
    'Car Accessories',
    'Games',
    'Occasion Supplies'
  ];
  int? categoryId;

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<MyProvider>(context);
    return Scaffold(
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: ListView(
          children: [
            shadowContainer(
              borderRadius: BorderRadius.circular(0),
              child: StreamBuilder(
                  initialData: bLoC.userModel,
                  stream: bLoC.user,
                  builder: (context, snapshot) {
                    return UserAccountsDrawerHeader(
                      decoration: const BoxDecoration(color: Colors.white),
                      accountName: Text(
                        // bLoC.userModel.data!.name!,
                        snapshot.data!.data!.name!,
                        style: const TextStyle(color: greyColor, fontSize: 17),
                      ),
                      accountEmail: Text(bLoC.userModel.data!.email!,
                          style: const TextStyle(
                              color: greyColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500)),
                      currentAccountPicture: userImage(
                          context: context,
                          image: NetworkImage(bLoC.userModel.data!.image!)),
                    );
                  }),
            ),
            drawerTile(
                title: "profile",
                leading: Icons.person_outlined,
                onTap: () {
                  isUserAccount = true;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileView(),
                      ));
                }),
            drawerTile(
                title: "requests",
                leading: Icons.request_page_outlined,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Requests(),
                      ));
                }),
            drawerTile(
                title: "about_app",
                leading: Icons.info_outline,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutAppView(),
                      ));
                }),
            drawerTile(
                title: "logout",
                leading: Icons.logout,
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ));
                }),
          ],
        ),
      ),
      appBar: GlobalAppBar(
        hasActions: true,
        isLogo: true,
        isHome: true,
        iconAction: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FAQs(),
                    ));
              },
              icon: Image(
                image: const AssetImage("assets/images/faq_icon.png"),
                width: MediaQuery.of(context).size.width * 0.045,
                color: secColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CarouselSlider(
                items: const [
                  Image(
                    image: AssetImage("assets/images/slider1.png"),
                  ),
                  Image(
                    image: AssetImage("assets/images/slider2.png"),
                  ),
                  Image(
                    image: AssetImage("assets/images/slider3.png"),
                  )
                ],
                options: CarouselOptions(
                    autoPlay: true,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    height: 180)),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0, right: 12, left: 12),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchView(),
                            ));
                      },
                      child: shadowContainer(
                          borderRadius: BorderRadius.circular(10),
                          child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.search,
                                  color: secColor,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                LocaleText(
                                  "search",
                                  style: TextStyle(
                                      color: greyColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    shadowContainer(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            height: 44,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  9,
                                  (index) => InkWell(
                                    onTap: () async {
                                      await bLoC.getProductsByCategory(
                                          context: context,
                                          categoryId: (index + 1).toString());
                                      setState(() {
                                        // tapIndex = index;
                                        for (int i = 0; i < 9; i++) {
                                          if (i == index) {
                                            isTapped[i] = true;
                                          } else {
                                            isTapped[i] = false;
                                          }
                                        }
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.022,
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.005,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          (pro.isEnglish == true)
                                              ? Text(
                                                  bLoC
                                                      .getCategoriesModel!
                                                      .productsData![index]
                                                      .nameEnglish!,
                                                  style: TextStyle(
                                                      color: (isTapped[index] ==
                                                              true)
                                                          ? Colors.black
                                                          : greyColor,
                                                      fontWeight:
                                                          (isTapped[index] ==
                                                                  true)
                                                              ? FontWeight.w600
                                                              : FontWeight
                                                                  .w400),
                                                )
                                              : Text(
                                                  bLoC
                                                      .getCategoriesModel!
                                                      .productsData![index]
                                                      .nameArabic!,
                                                  style: TextStyle(
                                                      color: (isTapped[index] ==
                                                              true)
                                                          ? Colors.black
                                                          : greyColor,
                                                      fontWeight:
                                                          (isTapped[index] ==
                                                                  true)
                                                              ? FontWeight.w600
                                                              : FontWeight
                                                                  .w400),
                                                ),
                                          isTapped[index] == true
                                              ? Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.002,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.18,
                                                  color: secColor,
                                                )
                                              : const SizedBox()
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Expanded(child: tabContent(context: context))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: addButton(context: context),
    );
  }
}

Widget homeItem(
    {context,
    required String pic,
//required int rate,
    required String name,
    required int price,
    required int userId,
    required int productId}) {
  return InkWell(
    onTap: () async {
      await bLoC.getProductReview(productId: productId, context: context);
      await bLoC.getProduct(productId: productId.toString(), context: context);
      await bLoC.getUserDataa(userId: userId);
      await bLoC.getAnotherUserReview(
          context: context, userId: bLoC.anotherUserModel.data!.id!);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetails(
              productId: productId,
            ),
          ));
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image(
            image: NetworkImage(pic),
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                    color: greyColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "SAR $price",
                style: const TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
              // Row(
              //   children: [
              //     Text(
              //       "5",
              //       style: TextStyle(
              //           color: yellowColor,
              //           fontWeight: FontWeight.w600,
              //           fontSize: 18),
              //     ),
              //     SizedBox(
              //       width: MediaQuery.of(context).size.width * 0.01,
              //     ),
              //     Icon(
              //       Icons.star_rate,
              //       color: yellowColor,
              //     )
              //   ],
              // )
            ],
          ),
        ),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.005,
        // ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Container(
            height: 1,
            color: greyColor.withOpacity(0.12),
          ),
        ),
      ],
    ),
  );
}

Widget tabContent({context}) {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            titlee(text: "most_chosen", size: 18, color: mainColor),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        ListView.builder(
          itemCount: bLoC.getProductsByCategoryModel!.productsData!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: homeItem(
                    context: context,
                    userId: bLoC.getProductsByCategoryModel!
                        .productsData![index].userId!,
                    productId: bLoC
                        .getProductsByCategoryModel!.productsData![index].id!,
                    pic: (bLoC.getProductsByCategoryModel!.productsData![index]
                                .image ==
                            "")
                        ? "https://images.pexels.com/photos/6214478/pexels-photo-6214478.jpeg?auto=compress&cs=tinysrgb&w=1600"
                        : bLoC.getProductsByCategoryModel!.productsData![index]
                            .image!,
                    name: bLoC
                        .getProductsByCategoryModel!.productsData![index].name!,
                    price: bLoC.getProductsByCategoryModel!.productsData![index]
                        .price!));
          },
        ),
      ],
    ),
  );

  //  else if (index == 1) {
  //   return const Text("oneeeeeeeeeeeeeee");
  // } else if (index == 2) {
  //   return const Text("twooooooooooooo");
  // } else if (index == 3) {
  //   return const Text("threeeeeeeeeeeee");
  // } else if (index == 4) {
  //   return const Text("fourrrrrrrrrrrrrrr");
  // } else if (index == 5) {
  //   return const Text("fiveeeeeeeeeeeeeee");
  // } else if (index == 6) {
  //   return const Text("sixxxxxxxxxxxxxxxx");
  // } else if (index == 7) {
  //   return const Text("sevennnnnnnnnnnnnn");
  // } else {
  //   return const Text("nineeeeeeeeeeeeee");
  // }
}
