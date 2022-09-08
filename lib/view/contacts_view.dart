import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../model_view/contacts_view_model.dart';
import '../utils/constants.dart';
import '../widgets/contact_list_tile.dart';
import '../widgets/custom_app_bar.dart';

class ContactsView extends StatefulWidget {
  const ContactsView({Key? key}) : super(key: key);
  @override
  State<ContactsView> createState() => ContactsViewState();
}

class ContactsViewState extends ContactsModelView {
  @override
  Widget build(BuildContext context) {
    try {
      if (users.isNotEmpty) {
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            body: Padding(
              padding: const ProjectPaddings.medium(),
              child: Column(
                children: [
                  Padding(
                    padding: const ProjectPaddings.bottom(),
                    child: CustomAppBar(src: users[0].imageUrl!),
                  ),
                  _searchBar(),
                  Expanded(
                    flex: 2,
                    child: _horizontalList(),
                  ),
                  Expanded(
                    flex: 9,
                    child: AzListView(
                      indexHintBuilder: (context, hint) =>
                          _indexHintBuilder(hint),
                      indexBarOptions: _indexBarOptions(),
                      data: firstNames,
                      itemCount: firstNames.length,
                      itemBuilder: (context, index) {
                        final item = firstNames[index];
                        final tag = item.getSuspensionTag();
                        final offStage = !item.isShowSuspension;
                        final fullName =
                            "${item.firstName} ${users[index].lastName}";
                        final photoUrl = users[index].imageUrl;
                        final contactNo = users[index].contactNumber;
                        final formattedTel =
                            '(${contactNo!.substring(0, 3)}) ${contactNo.substring(3, 6)}-${contactNo.substring(6, 9)}';
                        return Column(
                          children: [
                            Offstage(
                              offstage: offStage,
                              child: buildHeader(tag),
                            ),
                            ContactListTile(
                                photoUrl: photoUrl,
                                formattedTel: formattedTel,
                                fullName: fullName),
                            const Divider(
                              thickness: 1,
                              endIndent: 30,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return const Center(child: CircularProgressIndicator());
    } on Exception {
      return const Center(child: CircularProgressIndicator());
    }
  }

  IndexBarOptions _indexBarOptions() {
    return const IndexBarOptions(
      needRebuild: true,
      selectTextStyle: TextStyle(
        color: ProjectColors.kWhite,
        fontWeight: FontWeight.bold,
      ),
      selectItemDecoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ProjectColors.kBlue,
      ),
      indexHintAlignment: Alignment.centerRight,
      indexHintOffset: Offset(-20, 0),
    );
  }

  Container _indexHintBuilder(String hint) {
    return Container(
      alignment: Alignment.center,
      width: ProjectContainerSizes.normal,
      height: ProjectContainerSizes.normal,
      decoration:
          const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
      child: Text(
        hint,
        style: const TextStyle(
            color: ProjectColors.kWhite, fontSize: ProjectFontSizes.large),
      ),
    );
  }

  Widget buildHeader(String tag) {
    return Container(
      height: ProjectContainerSizes.low,
      margin: const ProjectPaddings.right(),
      padding: const ProjectPaddings.left(),
      color: ProjectColors.kGreyShadeLow,
      alignment: Alignment.centerLeft,
      child: Text(
        tag,
        softWrap: false,
        style: const TextStyle(
            fontSize: ProjectFontSizes.medium, fontWeight: FontWeight.bold),
      ),
    );
  }

  ListView _horizontalList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const ProjectPaddings.verticalBox(),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: ProjectContainerSizes.high,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(users[index].imageUrl ?? ''),
                        fit: BoxFit.fill),
                    color: Colors.grey.shade500,
                    borderRadius: ProjectBorderRadius.itemCircular(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _searchBar() {
    return TextField(
      decoration: InputDecoration(
        labelText: ProjectTexts.searchText,
        labelStyle: ProjectTextStyles.mediumTextStyle,
        prefixIcon: const Icon(
          Iconsax.search_normal,
          size: ProjectIconSizes.normal,
        ),
        isDense: true,
        contentPadding: const ProjectPaddings.one(),
        border: OutlineInputBorder(
            borderRadius: ProjectBorderRadius.itemCircular()),
      ),
    );
  }
}
