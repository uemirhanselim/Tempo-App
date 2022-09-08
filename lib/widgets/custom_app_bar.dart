import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.src,
    this.onTap,
    this.isDetailPage = false,
  }) : super(key: key);
  final String? src;
  final void Function()? onTap;
  final bool isDetailPage;

  @override
  Widget build(BuildContext context) {
    try {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _DynamicAppBarButton(
              onTap: onTap, isDetailPage: isDetailPage, src: src),
          isDetailPage ? const SizedBox.shrink() : _appBarTitle(),
          _staticAppBarButton(),
        ],
      );
    } on Exception {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Container _staticAppBarButton() {
    return Container(
      height: ProjectContainerSizes.lowMedium,
      width: ProjectContainerSizes.lowMedium,
      decoration: BoxDecoration(
        color: ProjectColors.kBlue,
        borderRadius: ProjectBorderRadius.itemCircular(),
      ),
      child: const Icon(
        Icons.edit,
        color: ProjectColors.kWhite,
      ),
    );
  }

  Text _appBarTitle() {
    return const Text(
      ProjectTexts.appBarTitle,
      style: TextStyle(
          color: Colors.black,
          fontSize: ProjectFontSizes.medium,
          fontWeight: FontWeight.bold),
    );
  }
}

class _DynamicAppBarButton extends StatelessWidget {
  const _DynamicAppBarButton({
    Key? key,
    required this.onTap,
    required this.isDetailPage,
    required this.src,
  }) : super(key: key);

  final void Function()? onTap;
  final bool isDetailPage;
  final String? src;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: ProjectContainerSizes.lowMedium,
        width: ProjectContainerSizes.lowMedium,
        decoration: BoxDecoration(
          border: isDetailPage
              ? Border.all(
                  width: ProjectContainerSizes.one, color: ProjectColors.kBlack)
              : null,
          image: isDetailPage
              ? null
              : DecorationImage(
                  image: NetworkImage(src ?? ''), fit: BoxFit.fill),
          color: Colors.white,
          borderRadius: ProjectBorderRadius.itemCircular(),
        ),
        child: isDetailPage
            ? const Icon(
                Icons.arrow_back_ios_new_sharp,
              )
            : null,
      ),
    );
  }
}
