import 'package:renta_app/controller/imports.dart';

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  Timer? timer;

  // @override
  // void initState() {
  //   super.initState();
  //   timer = Timer.periodic(
  //       const Duration(milliseconds: 3), (Timer t) => bLoC.getRequests());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        title: "requests",
        isDoubleBack: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: bLoC.getRequestsModel.requestsData!.length,
            itemBuilder: (context, index) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: requestCard(
                  context: context,
                  id: bLoC.getRequestsModel.requestsData![index].id!,
                  renterImage: bLoC
                      .getRequestsModel.requestsData![index].renterData!.image!,
                  renterName: bLoC
                      .getRequestsModel.requestsData![index].renterData!.name!,
                  productName: bLoC
                      .getRequestsModel.requestsData![index].productData!.name!,
                  startDate:
                      bLoC.getRequestsModel.requestsData![index].startDate!,
                  endDate: bLoC.getRequestsModel.requestsData![index].endDate!),
            ),
          )

          // StreamBuilder(
          //     initialData: bLoC.getRequestsModel,
          //     stream: bLoC.request,
          //     builder: (context, bLoC.getRequestsModel) {
          //       return
          //     }),
          ),
    );
  }
}
