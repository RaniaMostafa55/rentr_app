import 'package:renta_app/controller/imports.dart';

class BookRequest extends StatefulWidget {
  const BookRequest({super.key});

  @override
  State<BookRequest> createState() => _BookRequestState();
}

class _BookRequestState extends State<BookRequest> {
  late DateTime? start;
  late DateTime? end;
  DateTime date = DateTime.now();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(title: "book_req"),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image(
                    image: const AssetImage("assets/images/book req.png"),
                    width: MediaQuery.of(context).size.width * 0.35,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  note(
                      text:
                          "please_fill_the_required_data_to_complete_your_request",
                      opacity: 0.5),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  globalTextField(
                    textInputAction: TextInputAction.next,
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
                              )),
                              child: child ?? const Text("")),
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030));
                      if (start != null) {
                        startDate.text = DateFormat.yMd().format(start);
                      }
                      print(startDate.text);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter booking start date";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  globalTextField(
                    textInputAction: TextInputAction.next,
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
                        endDate.text = DateFormat.yMd().format(end);
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter booking end date";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  globalTextField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    label: "notes",
                    prefix: Icons.note_add_outlined,
                  ),
                  const SizedBox(height: 20),
                  matButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          bLoC.addRequest(
                              startDate: startDate.text,
                              endDate: endDate.text,
                              productId: bLoC.getProductModel!.data!.id!,
                              context: context);
                        }
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const HomeView(),
                        //     ));
                      },
                      text: "book_now",
                      context: context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
