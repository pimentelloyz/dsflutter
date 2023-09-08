import 'package:flutter/material.dart';

import '../../ds_theme/ds_theme.dart';
import '../../ds_theme_data/ds_theme_data.dart';
import '../../ds_tokens/ds_border_radius_tokens.dart';
import '../../ds_tokens/ds_icons.dart';
import '../../ds_tokens/ds_spacing_inset_tokens.dart';
import '../ds_tokens_widgets/ds_border_widget.dart';
import '../ds_tokens_widgets/ds_spacing_inset_widget.dart';
import 'ds_icon_widget.dart';

enum DSAvatarSize { sm, md, lg }

class DSAvatar extends StatelessWidget {
  final DSAvatarSize size;
  final ImageProvider? imageProvider;
  final bool onColor;
  final bool showBadge;

  const DSAvatar({
    Key? key,
    required this.size,
    this.imageProvider,
    this.onColor = false,
    this.showBadge = false,
  }) : super(key: key);

  const DSAvatar.sm({
    Key? key,
    this.imageProvider,
    this.onColor = false,
    this.showBadge = false,
  })  : size = DSAvatarSize.sm,
        super(key: key);

  const DSAvatar.md({
    Key? key,
    this.imageProvider,
    this.onColor = false,
    this.showBadge = false,
  })  : size = DSAvatarSize.md,
        super(key: key);

  const DSAvatar.lg({
    Key? key,
    this.imageProvider,
    this.onColor = false,
    this.showBadge = false,
  })  : size = DSAvatarSize.lg,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final DSThemeData dsTheme = DSTheme.of(context);

    late final DSSpacingInsetToken dsSpacingInsetToken;
    late final double diameter;
    late final Color backgroundColor;
    late final Color iconColor;
    late final DSIconSize dsIconType;
    final DSBorderRadiusToken dsBorderRadiusToken =
        dsTheme.borderRadius.circular;
    late final Widget badge;
    late final Widget child;
    late final double positionBadgeTop;
    late final double positionBadgeRight;
    const double sizeBadge = 8.0;

    switch (size) {
      case DSAvatarSize.sm:
        dsSpacingInsetToken = dsTheme.spacingInsets.quarck;
        dsIconType = DSIconSize.sm;
        diameter = 24.0;
        positionBadgeTop = 0.0;
        positionBadgeRight = 0.0;
        break;
      case DSAvatarSize.md:
        dsSpacingInsetToken = dsTheme.spacingInsets.nano;
        dsIconType = DSIconSize.md;
        diameter = 40.0;
        positionBadgeTop = 2.0;
        positionBadgeRight = 2.0;
        break;
      case DSAvatarSize.lg:
        dsSpacingInsetToken = dsTheme.spacingInsets.xs;
        dsIconType = DSIconSize.lg;
        diameter = 64.0;
        positionBadgeTop = 5.0;
        positionBadgeRight = 7.0;
        break;
    }

    if (onColor) {
      backgroundColor = dsTheme.colors.neutral.light;
      iconColor = dsTheme.colors.brand.primary.pure;
    } else {
      backgroundColor = dsTheme.colors.brand.primary.pure;
      iconColor = dsTheme.colors.neutral.light;
    }

    if (imageProvider != null) {
      child = Image(
        image: imageProvider!,
        width: diameter,
        height: diameter,
        fit: BoxFit.cover,
      );
    } else {
      child = Container(
        width: diameter,
        height: diameter,
        color: backgroundColor,
        child: DSSpacingInset(
          spacingInsetToken: dsSpacingInsetToken,
          child: DSIcon(
            icon: DSIcons.users.user,
            color: iconColor,
            size: dsIconType,
          ),
        ),
      );
    }

    badge = Positioned(
      top: positionBadgeTop,
      right: positionBadgeRight,
      child: DSBorder(
        borderRadiusToken: dsTheme.borderRadius.circular,
        child: Container(
          color: dsTheme.colors.feedback.informative.pure,
          height: sizeBadge,
          width: sizeBadge,
        ),
      ),
    );

    return Stack(
      children: [
        DSBorder(
          borderRadiusToken: dsBorderRadiusToken,
          child: child,
        ),
        if (showBadge) badge
      ],
    );
  }
}
