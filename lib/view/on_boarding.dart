import 'package:renta_app/controller/imports.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    super.initState();
    CacheHelper.putBool(key: "isFirstTime", value: false);
  }

  @override
  Widget build(BuildContext context) {
    PageController? pageController = PageController();
    RxInt cIndex = 0.obs;
    List<OnBoardingModel> onBoardingModel = <OnBoardingModel>[
      OnBoardingModel(
        title: "a_hard_working_community",
        description: "onboarding1text",
        image: 'assets/images/on board1.png',
      ),
      OnBoardingModel(
        title: 'find_the_nearest',
        description: "onboarding2text",
        image: 'assets/images/on board2.png',
      ),
      OnBoardingModel(
        title: 'detect_the_Period',
        description: "onboarding3text",
        image: 'assets/images/on board3.png',
      ),
    ];
    return Scaffold(
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) => cIndex.value = value,
                physics: const BouncingScrollPhysics(),
                itemCount: onBoardingModel.length,
                controller: pageController,
                itemBuilder: (context, index) => Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        // height: MediaQuery.of(context).size.height * 0.6,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ]),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Center(
                              child: Image(
                                  image: AssetImage(
                                      onBoardingModel[index].image!)),
                            ),
                            (cIndex.value != 2)
                                ? Positioned(
                                    top: MediaQuery.of(context).size.height *
                                        0.025,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        textButtonn(
                                            color: mainColor,
                                            onPressed: () {
                                              pageController.animateToPage(
                                                2,
                                                duration: const Duration(
                                                    milliseconds: 350),
                                                curve: Curves.easeInOut,
                                              );
                                            },
                                            text: "skip",
                                            isNotUnderlined: true),
                                      ],
                                    ),
                                  )
                                : SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              titlee(
                                  text: onBoardingModel[index].title!,
                                  size: 22,
                                  color: mainColor,
                                  weight: FontWeight.w600),
                              const SizedBox(height: 10),
                              LocaleText(
                                onBoardingModel[index].description!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GlobalIndicatorsWidget(
                          length: 3,
                          cIndex: cIndex.value,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedCrossFade(
                    firstChild: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: matButton(
                        context: context,
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginView(),
                              ));
                        },
                        text: "get_started",
                      ),
                    ),
                    secondChild: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.055,
                          child: matButton(
                            context: context,
                            onPressed: () {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 350),
                                curve: Curves.easeInOut,
                              );
                            },
                            text: "next",
                          ),
                        ),
                      ],
                    ),
                    crossFadeState: (cIndex.value == 2)
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 200),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  final num height;

  MyClipper({this.height = 1});
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.4);
    path.quadraticBezierTo(
        size.width / 2, size.height / height, 0, size.height / height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
