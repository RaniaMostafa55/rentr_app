import 'package:renta_app/controller/imports.dart';

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        const Duration(milliseconds: 3), (Timer t) => bLoC.getRequests());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        title: "requests",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: StreamBuilder(
            initialData: bLoC.getRequestsModel,
            stream: bLoC.request,
            builder: (context, snapshot) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.requestsData!.length,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                  child: requestCard(
                      context: context,
                      id: snapshot.data!.requestsData![index].id!,
                      renterImage: snapshot
                          .data!.requestsData![index].renterData!.image!,
                      renterName:
                          snapshot.data!.requestsData![index].renterData!.name!,
                      productName: snapshot
                          .data!.requestsData![index].productData!.name!,
                      startDate: snapshot.data!.requestsData![index].startDate!,
                      endDate: snapshot.data!.requestsData![index].endDate!),
                ),
              );
            }),
      ),
    );
  }
}
