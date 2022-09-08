import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../view/contact_detail_view.dart';

class ContactListTile extends StatelessWidget {
  const ContactListTile({
    Key? key,
    required this.photoUrl,
    required this.formattedTel,
    required this.fullName,
  }) : super(key: key);

  final String? photoUrl;
  final String formattedTel;
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: ProjectContainerSizes.normal,
        width: ProjectContainerSizes.normal,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(photoUrl ?? ''), fit: BoxFit.fill),
          color: Colors.grey.shade500,
          borderRadius: ProjectBorderRadius.itemCircular(),
        ),
      ),
      subtitle: Text(formattedTel, style: ProjectTextStyles.smallTextStyle),
      title: Text(fullName,
          style: ProjectTextStyles.mediumTextStyle
              .copyWith(fontSize: ProjectFontSizes.underMedium)),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ContactDetailView(
                      fullName: fullName,
                      phoneNo: formattedTel,
                      photoUrl: photoUrl,
                    )));
      },
    );
  }
}
