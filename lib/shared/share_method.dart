part of 'shared.dart';

enum TypeSnackbar { success, error, info }

double widthLayout(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double heightLayout(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

void snackbarCustom(
    {required TypeSnackbar typeSnackbar,
    String? title,
    required String message}) {
  if (!Get.isSnackbarOpen) {
    Get.rawSnackbar(
      title: title,
      message: message,
      margin: const EdgeInsets.only(
        top: 10,
        left: defaultMargin,
        right: defaultMargin,
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: (typeSnackbar == TypeSnackbar.error)
          ? redColor
          : ((typeSnackbar == TypeSnackbar.info) ? Colors.amber : Colors.green),
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      borderRadius: 10,
    );
  }
}

Widget loading(double sized,
    {double diameter = 40, Color? color, double? value}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: diameter,
        width: diameter,
        child: CircularProgressIndicator(
          value: value,
          strokeWidth: sized,
          backgroundColor: color ?? mainColor,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.yellow),
        ),
      ),
    ],
  );
}

void dialogCustom({
  String? title,
  String titleLeftButton = "Ya",
  String titleRightButton = "Batal",
  String middleText = "ini mid",
  Future<bool> Function()? onWillPop,
  Widget? content,
  bool isConfirm = false,
  Function()? onLeftButton,
  Function()? onRigthButton,
  Color colorLeftButton = mainColor,
  Color colorRightButton = backgroundColor,
}) {
  Get.defaultDialog(
    title: title!,
    middleText: middleText,
    backgroundColor: backgroundColor,
    onWillPop: onWillPop,
    titlePadding: const EdgeInsets.only(
      top: 20,
    ),
    contentPadding: const EdgeInsets.only(
      right: 20,
      left: 20,
      bottom: 20,
      top: 20,
    ),
    content: (!isConfirm)
        ? content
        : Column(
            children: [
              Text(
                middleText,
                style: blackTextFont,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: const ButtonCustomWidget(
              //         title: titleLeftButton,
              //         color: colorLeftButton,
              //         onPressed: onLeftButton ?? () {},
              //       ),
              //     ),
              //     SizedBox(
              //       width: 20,
              //     ),
              //     Expanded(
              //       child: ButtonCustomWidget(
              //         title: titleRightButton,
              //         color: colorRightButton,
              //         onPressed: onRigthButton ??
              //             () {
              //               Get.back();
              //             },
              //       ),
              //     )
              //   ],
              // ),
            ],
          ),
  );
}

BoxShadow customShadow() => const BoxShadow(
      color: accentColor1,
      offset: Offset(1, -1),
      blurRadius: 10,
    );
