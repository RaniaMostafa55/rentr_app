import 'package:renta_app/controller/imports.dart';

Widget requestCard(
    {context,
    required int id,
    required String renterImage,
    required String renterName,
    required String productName,
    required String startDate,
    required String endDate}) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: textFieldColor.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ]),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          userImage(context: context, image: NetworkImage(renterImage)),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 250,
                child: Text(
                  "$renterName has sent a request to lease your $productName",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: greyColor, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "$startDate : $endDate",
                style: const TextStyle(
                    color: secColor, fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  matButton(
                      onPressed: () {
                        bLoC.acceptRequest(context: context, id: id);
                      },
                      text: "Accept",
                      fontSize: 14,
                      context: context,
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.035),
                  const SizedBox(
                    width: 6,
                  ),
                  matButton(
                      onPressed: () {
                        bLoC.refuseRequest(context: context, id: id);
                      },
                      text: "Decline",
                      fontSize: 14,
                      context: context,
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.035)
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}
