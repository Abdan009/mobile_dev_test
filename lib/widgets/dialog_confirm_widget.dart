part of 'widgets.dart';

class ShowDialongComfirm extends StatelessWidget {
  const ShowDialongComfirm({
    Key? key,
    this.customWidgetText,
    this.textMessage,
    this.comfirmOkColor,
    required this.onConfirmOk,
  }) : super(key: key);
  final Widget? customWidgetText;
  final String? textMessage;
  final Color? comfirmOkColor;
  final Function() onConfirmOk;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          width: Get.width,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(10)),
          child: Material(
            child: Column(
              children: [
                customWidgetText ??
                    Text(
                      textMessage ?? "no message",
                      style: blackTextFont,
                    ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        "Tidak",
                        style: blackTextFontTitleBold.copyWith(
                          color: const Color(0xFF666666),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    GestureDetector(
                      onTap: onConfirmOk,
                      child: Text(
                        "Ya",
                        style: blackTextFontTitleBold.copyWith(
                          color: comfirmOkColor ?? mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ShowDialongDefaultCustom extends StatelessWidget {
  const ShowDialongDefaultCustom({
    Key? key,
    this.child,
  }) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          width: Get.width,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        ),
      ],
    );
  }
}


class ShowLoadingDialog extends StatelessWidget {
  const ShowLoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowDialongDefaultCustom(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            loading(1),
            const SizedBox(
              height: 10,
            ),
             Material(child: Text("Loading", style: blackTextFont,))
          ],
        ),
      );
  }
}