import 'package:contact_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/constants.dart';
import '../widgets/medium_rounded_button.dart';

class ContactDetailView extends StatelessWidget {
  const ContactDetailView(
      {Key? key,
      required this.fullName,
      required this.photoUrl,
      required this.phoneNo})
      : super(key: key);
  final String? fullName;
  final String? photoUrl;
  final String? phoneNo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const ProjectPaddings.medium(),
          child: Column(
            children: [
              CustomAppBar(
                  isDetailPage: true, onTap: () => Navigator.pop(context)),
              _ContactInfo(
                  photoUrl: photoUrl, fullName: fullName, phoneNo: phoneNo),
              _divider(),
              _CallHistory(phoneNo: phoneNo),
              const Padding(
                padding: ProjectPaddings.horizontal(),
                child: _BottomButtonRow(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _divider() {
    return Padding(
      padding: const ProjectPaddings.top(),
      child: Divider(
        thickness: 20,
        color: ProjectColors.kGreyShadeLow,
      ),
    );
  }
}

class _BottomButtonRow extends StatelessWidget {
  const _BottomButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _BottomButton(
          color: ProjectColors.kShareLocation,
          icon: Iconsax.location5,
          text: ProjectTexts.shareLocation,
        ),
        _BottomButton(
          color: ProjectColors.kQrCode,
          icon: Icons.qr_code,
          text: ProjectTexts.qrCode,
        ),
        const _BottomButton(
          color: ProjectColors.kShareContact,
          icon: Iconsax.send_2,
          text: ProjectTexts.shareContact,
        ),
      ],
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton(
      {Key? key,
      required Color? color,
      required IconData? icon,
      required String? text})
      : _color = color,
        _icon = icon,
        _text = text,
        super(key: key);
  final Color? _color;
  final String? _text;
  final IconData? _icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MediumRoundedButton(color: _color, icon: _icon),
        Padding(
          padding: const ProjectPaddings.top(),
          child: Text(_text ?? '',
              style: ProjectTextStyles.mediumTextStyle
                  .copyWith(fontSize: ProjectFontSizes.low)),
        )
      ],
    );
  }
}

class _CallHistory extends StatelessWidget {
  const _CallHistory({
    Key? key,
    required this.phoneNo,
  }) : super(key: key);

  final String? phoneNo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPaddings.bottomHigh(),
      child: Column(
        children: [
          _CallHistoryTile(phoneNo: phoneNo, title: ProjectTexts.iconMobile),
          _CallHistoryTile(phoneNo: phoneNo, title: ProjectTexts.iconHome),
          _CallHistoryTile(
              isVideoCall: true,
              phoneNo: phoneNo,
              title: ProjectTexts.iconHome),
        ],
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  const _ContactInfo({
    Key? key,
    required this.photoUrl,
    required this.fullName,
    required this.phoneNo,
  }) : super(key: key);

  final String? photoUrl;
  final String? fullName;
  final String? phoneNo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _photo(),
        const SizedBox(
          height: 10,
        ),
        _nameSurname(),
        const SizedBox(
          height: 8,
        ),
        _number(),
        _contactWayButtons(),
      ],
    );
  }

  Padding _contactWayButtons() {
    return Padding(
      padding: const ProjectPaddings.contactWayButton(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MediumRoundedButton(
              color: ProjectColors.kGreenMedium, icon: Iconsax.message),
          const MediumRoundedButton(
              color: ProjectColors.kBlue, icon: Icons.local_phone_outlined),
          MediumRoundedButton(
              color: ProjectColors.kRedMedium, icon: Iconsax.video),
          MediumRoundedButton(
              color: ProjectColors.kBlueGreyLow, icon: Icons.mail_outline),
        ],
      ),
    );
  }

  Text _number() {
    return Text(
      phoneNo ?? '',
      style: ProjectTextStyles.smallTextStyle,
    );
  }

  Text _nameSurname() {
    return Text(fullName ?? '', style: ProjectTextStyles.mediumTextStyle);
  }

  Padding _photo() {
    return Padding(
      padding: const ProjectPaddings.top(),
      child: Container(
        width: ProjectContainerSizes.high,
        height: ProjectContainerSizes.high,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(photoUrl ?? ''), fit: BoxFit.fill),
          color: ProjectColors.kGreyShadeMedium,
          borderRadius: ProjectBorderRadius.itemCircular(),
        ),
      ),
    );
  }
}

class _CallHistoryTile extends StatelessWidget {
  const _CallHistoryTile({
    Key? key,
    String? phoneNo,
    String? title,
    bool isVideoCall = false,
  })  : _phoneNo = phoneNo,
        _title = title,
        _isVideoCall = isVideoCall,
        super(key: key);

  final String? _phoneNo;
  final String? _title;
  final bool _isVideoCall;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_title ?? '',
          style: ProjectTextStyles.mediumTextStyle
              .copyWith(fontSize: ProjectFontSizes.underMedium)),
      subtitle: Text(_phoneNo ?? '', style: ProjectTextStyles.smallTextStyle),
      trailing: _isVideoCall
          ? const Icon(
              Iconsax.video,
              size: ProjectIconSizes.high,
            )
          : _voiceCallRow(),
    );
  }

  Row _voiceCallRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(
          Iconsax.message,
          size: ProjectIconSizes.high,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.local_phone_outlined,
            size: ProjectIconSizes.high,
          ),
        ),
      ],
    );
  }
}
