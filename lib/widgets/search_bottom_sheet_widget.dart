part of 'widgets.dart';

class SearchServiceWidget extends StatefulWidget {
  const SearchServiceWidget({
    Key? key,
    required this.listValue,
    required this.result,
  }) : super(key: key);
  final List<String> listValue;
  final Function(String) result;

  @override
  State<SearchServiceWidget> createState() => _SearchServiceWidgetState();
}

class _SearchServiceWidgetState extends State<SearchServiceWidget> {
  List<String> resultSearch = [];

  @override
  void initState() {
    super.initState();
    resultSearch = widget.listValue;
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetWidget(
      maxHeight: heightLayout(context) * 0.6,
      child: Expanded(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SearchCustomWidget(
              controller: null,
              onSubmitted: (value) {
                setState(() {
                  if (value.trim() != '') {
                    resultSearch = widget.listValue
                        .where(
                          (element) => element.toLowerCase().contains(
                                value.toLowerCase(),
                              ),
                        )
                        .toList();
                  } else {
                    resultSearch = widget.listValue;
                  }
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child:(widget.listValue.isNotEmpty)? ListView(
                shrinkWrap: true,
                children: List.generate(
                  resultSearch.length,
                  (index) => ListTile(
                    onTap: () {
                      widget.result(resultSearch[index]);
                      Get.back();
                    },
                    selected: true,
                    title: Text(
                      resultSearch[index],
                      style: blackTextFontTitle,
                    ),
                    // contentPadding: EdgeIn,
                  ),
                ),
              ): Center(
                child: loading(3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
