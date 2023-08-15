import 'package:renta_app/controller/imports.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  bool isClicked = false;
  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // List region = ["giza", "giza", "giza", "cairo", "cairo"];
    // List price = ["SAR 50", "SAR 70", "SAR 40", "SAR 40", "SAR 50"];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: globalTextField(
                    controller: searchController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.name,
                    label: "search",
                    suffix: Icons.search,
                    onChanged: (String value) async {
                      await bLoC.searchProducts(
                          context: context, searchText: value);
                      if (searchController.text.isEmpty) {
                        setState(() {
                          isClicked = false;
                        });
                      } else {
                        setState(() {
                          isClicked = true;
                        });
                      }

                      // if (formKey.currentState!.validate()) {
                      //   formKey.currentState!.save();

                      // }
                    }),
              ),
              (isClicked)
                  ? Expanded(
                      child: ListView.builder(
                        itemCount:
                            bLoC.searchProductModel!.productsData!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: InkWell(
                              onTap: () async {
                                await bLoC.getProductReview(
                                    productId: bLoC.searchProductModel!
                                        .productsData![index].itemData!.id!,
                                    context: context);
                                await bLoC.getProduct(
                                    productId: bLoC.searchProductModel!
                                        .productsData![index].itemData!.id!
                                        .toString(),
                                    context: context);
                                await bLoC.getUserDataa(
                                    userId: bLoC.searchProductModel!
                                        .productsData![index].itemData!.userId);
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ItemDetails(
                                        productId: bLoC.searchProductModel!
                                            .productsData![index].itemData!.id!,
                                      ),
                                    ));
                              },
                              child: shadowContainer(
                                borderRadius: BorderRadius.circular(10),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    title: Text(
                                      bLoC.searchProductModel!
                                          .productsData![index].itemData!.name!,
                                      style: const TextStyle(
                                          color: greyColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    // subtitle: LocaleText(
                                    //   region[index],
                                    //   style: const TextStyle(
                                    //       color: mainColor,
                                    //       fontWeight: FontWeight.w600,
                                    //       fontSize: 15),
                                    // ),
                                    trailing: Text(
                                      'SAR ${bLoC.searchProductModel!.productsData![index].itemData!.price!}',
                                      style: const TextStyle(
                                          color: secColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    ),
                                    leading: Container(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.16,
                                          fit: BoxFit.cover,
                                          image: (bLoC
                                                      .searchProductModel!
                                                      .productsData![index]
                                                      .itemData!
                                                      .image ==
                                                  "")
                                              ? const NetworkImage(
                                                  "https://images.pexels.com/photos/6214478/pexels-photo-6214478.jpeg?auto=compress&cs=tinysrgb&w=1600")
                                              : NetworkImage(bLoC
                                                  .searchProductModel!
                                                  .productsData![index]
                                                  .itemData!
                                                  .image!)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
      // floatingActionButton: addButton(context: context)
    );
  }
}
