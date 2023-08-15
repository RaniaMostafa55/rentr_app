import 'package:renta_app/controller/imports.dart';

class ItemDetails extends StatefulWidget {
  final int productId;
  const ItemDetails({super.key, required this.productId});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  List<bool> pressed = [false, false, false, false, false];
  int currentIndex = 0;
  List itemImages = [
    "https://images.pexels.com/photos/6214478/pexels-photo-6214478.jpeg?auto=compress&cs=tinysrgb&w=1600",
  ];

  @override
  Widget build(BuildContext context) {
    bLoC.getProductReview(context: context, productId: widget.productId);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(children: [
              shadowContainer(
                context: context,
                height: MediaQuery.of(context).size.height * 0.52,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              Column(
                children: [
                  SafeArea(
                    child: GlobalAppBar(
                      title: "item_details",
                      hasActions: true,
                      iconAction: [
                        IconButton(
                            onPressed: () {
                              rateDialog(
                                  rated: "item",
                                  isItem: true,
                                  pressed: pressed,
                                  productId: bLoC.getProductModel!.data!.id!,
                                  context: context);
                            },
                            icon: Icon(
                              Icons.star_rate,
                              color: yellowColor,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                      itemCount: (bLoC.getProductModel!.data!.images == [""])
                          ? 1
                          : bLoC.getProductModel!.data!.images!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.2),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image(
                              fit: BoxFit.cover,
                              image: (bLoC.getProductModel!.data!.image == "")
                                  ? const NetworkImage(
                                      'https://images.pexels.com/photos/6214478/pexels-photo-6214478.jpeg?auto=compress&cs=tinysrgb&w=1600')
                                  : NetworkImage(bLoC
                                      .getProductModel!.data!.images![index])),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  GlobalIndicatorsWidget(
                      activeColor: mainColor,
                      length: (bLoC.getProductModel!.data!.images == [""])
                          ? 1
                          : bLoC.getProductModel!.data!.images!.length,
                      cIndex: currentIndex),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(
                    bLoC.getProductModel!.data!.name!,
                    style: const TextStyle(
                        color: greyColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.018,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SAR ${bLoC.getProductModel!.data!.price!}",
                        style: const TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      Container(
                        width: 1,
                        height: 26,
                        color: greyColor.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      Icon(
                        Icons.star_rate,
                        color: yellowColor,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      StreamBuilder(
                          stream: bLoC.productReview,
                          initialData: bLoC.getProductReviewModel,
                          builder: (context, snapshot) {
                            return Text(
                              (snapshot.data!.data!.totalReviews == 0)
                                  ? "0"
                                  : ((snapshot.data!.data!.totalReviews!) /
                                          (snapshot
                                              .data!.data!.reviews!.length))
                                      .toString(),
                              style: TextStyle(
                                  color: yellowColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            );
                          }),
                    ],
                  )
                ],
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titlee(text: "description", size: 16),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.012,
                  ),
                  Text(
                    bLoC.getProductModel!.data!.description!,
                    style: const TextStyle(color: greyColor, fontSize: 16),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.026,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titlee(text: "owner_details", size: 16),
                      textButtonn(
                          text: "comm_with_owner",
                          onPressed: () {
                            Utils.whatsAppOpen(
                                phoneNumber:
                                    // "+201117199897"
                                    bLoC.anotherUserModel.data!.phone!);
                          },
                          color: secColor,
                          isNotUnderlined: true)
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.012,
                  ),
                  shadowContainer(
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15.0, left: 10, right: 10),
                      child: Column(
                        children: [
                          data(
                            context,
                            title: "name",
                            info: bLoC.anotherUserModel.data!.name!,
                          ),
                          data(
                            context,
                            title: "phone_number",
                            info: bLoC.anotherUserModel.data!.phone!,
                          ),
                          // data(
                          //   title: "district",
                          //   info: "Giza",
                          // ),
                          data(context,
                              title: "location",
                              info: "view_location",
                              isButton: true, onPressed: () {
                            Utils.openGoogleMaps(
                                latitude: bLoC.getProductModel!.data!.latitude!,
                                longitude:
                                    bLoC.getProductModel!.data!.longitude!);
                          }),
                          data(context,
                              title: "User Account",
                              info: "Press here",
                              isButton: true, onPressed: () {
                            isUserAccount = false;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfileView(),
                                ));
                          }),
                          // data(
                          //   context,
                          //   title: "available_period",
                          //   info:
                          //       "${bLoC.getProductModel!.data!.startDate!} : ${bLoC.getProductModel!.data!.endDate!}",
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.026,
                  ),
                  titlee(text: "Reviews", size: 16),
                  StreamBuilder(
                      stream: bLoC.productReview,
                      initialData: bLoC.getProductReviewModel,
                      builder: (context, snapshot) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: shadowContainer(
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ListTile(
                                    title: Text(
                                      bLoC.getProductReviewModel.data!
                                          .reviews![index].review!,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: greyColor, fontSize: 16),
                                    ),
                                    leading: shadowContainer(
                                        context: context,
                                        width: 50,
                                        height: 40,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Center(
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star_rate,
                                              color: yellowColor,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                            ),
                                            Text(
                                              bLoC.getProductReviewModel.data!
                                                  .reviews![index].rating!
                                                  .toString(),
                                              style: TextStyle(
                                                  color: yellowColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        )))),
                              ),
                            ),
                          ),
                          itemCount:
                              bLoC.getProductReviewModel.data!.reviews!.length,
                        );
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  matButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BookRequest(),
                            ));
                      },
                      text: "make_request",
                      context: context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
