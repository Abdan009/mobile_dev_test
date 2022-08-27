part of 'widgets.dart';

class CustomBottomSheetWidget extends StatelessWidget {
  const CustomBottomSheetWidget({
    Key? key,
    required this.child,
    this.maxHeight
  }) : super(key: key);
  final Widget child;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxHeight,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.close),
            ),
          ),
          
          child,
        ],
      ),
    );
  }
}
