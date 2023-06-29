import 'package:renta_app/controller/imports.dart';

class GlobalIndicatorsWidget extends StatelessWidget {
  final int? cIndex;
  final int? length;
  final Color? activeColor;
  const GlobalIndicatorsWidget(
      {Key? key, this.cIndex, this.length, this.activeColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length!,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.all(2),
          width: (cIndex == index) ? 20 : 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: (cIndex == index)
                ? //Get.theme.primaryColor
                activeColor ?? secColor
                : greyColor.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
