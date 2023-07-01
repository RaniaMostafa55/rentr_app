import 'package:renta_app/controller/imports.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? isLogo;
  final bool? hasActions;
  final List<Widget>? iconAction;
  final Color? titleColor;
  final bool? isHome;
  const GlobalAppBar({
    Key? key,
    this.title,
    this.hasActions = false,
    this.iconAction,
    this.titleColor,
    this.isHome = false,
    this.isLogo = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: AppBar(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0.0,
            backgroundColor: textFieldColor.withOpacity(0.20),
            title: (!isLogo!)
                ? titlee(text: title!, color: mainColor, size: 18)
                : Image(
                    image: const AssetImage("assets/images/logo.png"),
                    width: MediaQuery.of(context).size.width * 0.085,
                  ),
            centerTitle: true,
            leading: (isHome == true)
                ? null
                : IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: secColor,
                    )),
            actions: (hasActions!) ? iconAction! : null,
          )),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
