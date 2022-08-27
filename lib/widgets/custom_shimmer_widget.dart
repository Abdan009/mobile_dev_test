part of 'widgets.dart';

class CustomShimmerWidget extends StatelessWidget {
  const CustomShimmerWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: child,
    );
  }
}

class LoadingCardPromotions extends StatelessWidget {
  const LoadingCardPromotions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        2,
        (index) => CustomShimmerWidget(
          child: Container(
            height: 100,
            width: Get.width,
            margin: EdgeInsets.only(bottom: 10, top: (index == 0) ? 20 : 0),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
