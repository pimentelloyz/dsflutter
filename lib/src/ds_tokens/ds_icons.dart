// ignore_for_file: non_constant_identifier_names

import 'package:flutter/widgets.dart';

class _DSIconsIconData extends IconData {
  const _DSIconsIconData(
    super.codePoint,
  ) : super(
          fontFamily: 'DSIcons',
          fontPackage: 'design_system',
        );
}

class _DSNumberIconData extends IconData {
  const _DSNumberIconData(
    super.codePoint,
  ) : super(
          fontFamily: 'DSNumberIcons',
          fontPackage: 'design_system',
        );
}

/// [DSIcons]
///
/// [DSIcons] is a collection of icons used in the Drakma Design System.
/// [DSIcons] has be generated from the Figma using the [FlutterIcon](https://www.fluttericon.com/)
///
/// For new icons, access the [FlutterIcon](https://www.fluttericon.com/) and generate a new icon using the config file.
class DSIcons {
  const DSIcons._();

  static ActionIcons get action => const ActionIcons();
  static ArrowIcons get arrow => const ArrowIcons();
  static AttentionIcons get attention => const AttentionIcons();
  static BasicIcons get basic => const BasicIcons();
  static BrandIcons get brand => const BrandIcons();
  static CashIcons get cash => const CashIcons();
  static ChartIcons get chart => const ChartIcons();
  static CommunicationIcons get communication => const CommunicationIcons();
  static DocumentIcons get document => const DocumentIcons();
  static ExperimentalIcons get experimental => const ExperimentalIcons();
  static FavoriteIcons get favorite => const FavoriteIcons();
  static MenuIcons get menu => const MenuIcons();
  static ServicesIcons get services => const ServicesIcons();
  static UsersIcons get users => const UsersIcons();
  static VideoIcons get video => const VideoIcons();
  static NumberIcons get number => const NumberIcons();
}

class ActionIcons {
  const ActionIcons();

  IconData get add_big => const _DSIconsIconData(0xe800);
  IconData get add => const _DSIconsIconData(0xe801);
  IconData get calculator => const _DSIconsIconData(0xe802);
  IconData get close_fullscreen => const _DSIconsIconData(0xe803);
  IconData get copy => const _DSIconsIconData(0xe804);
  IconData get edit => const _DSIconsIconData(0xe805);
  IconData get fingerprint => const _DSIconsIconData(0xe806);
  IconData get fullscreen => const _DSIconsIconData(0xe807);
  IconData get lock => const _DSIconsIconData(0xe808);
  IconData get hide => const _DSIconsIconData(0xe809);
  IconData get minus_circle => const _DSIconsIconData(0xe80a);
  IconData get percentage => const _DSIconsIconData(0xe80b);
  IconData get plus_circle => const _DSIconsIconData(0xe80c);
  IconData get qr_code => const _DSIconsIconData(0xe80d);
  IconData get remove_big => const _DSIconsIconData(0xe80e);
  IconData get remove => const _DSIconsIconData(0xe80f);
  IconData get search => const _DSIconsIconData(0xe810);
  IconData get settings => const _DSIconsIconData(0xe811);
  IconData get share => const _DSIconsIconData(0xe812);
  IconData get show => const _DSIconsIconData(0xe813);
  IconData get slider => const _DSIconsIconData(0xe814);
  IconData get split => const _DSIconsIconData(0xe815);

  List<IconData> get values => [
        add_big,
        add,
        calculator,
        close_fullscreen,
        copy,
        edit,
        fingerprint,
        fullscreen,
        lock,
        hide,
        minus_circle,
        percentage,
        plus_circle,
        qr_code,
        remove_big,
        remove,
        search,
        settings,
        share,
        show,
        slider,
        split
      ];
}

class ArrowIcons {
  const ArrowIcons();

  IconData get chevron_down => const _DSIconsIconData(0xe816);
  IconData get chevron_right => const _DSIconsIconData(0xe817);
  IconData get chevron_small_down => const _DSIconsIconData(0xe818);
  IconData get chevron_small_left => const _DSIconsIconData(0xe819);
  IconData get chevron_small_right => const _DSIconsIconData(0xe81a);
  IconData get chevron_left => const _DSIconsIconData(0xe81b);
  IconData get chevron_small_up => const _DSIconsIconData(0xe81c);
  IconData get chevron_up => const _DSIconsIconData(0xe81d);
  IconData get long_down => const _DSIconsIconData(0xe81e);
  IconData get long_left => const _DSIconsIconData(0xe81f);
  IconData get long_right => const _DSIconsIconData(0xe820);
  IconData get long_small_down => const _DSIconsIconData(0xe821);
  IconData get long_small_left => const _DSIconsIconData(0xe822);
  IconData get long_small_right => const _DSIconsIconData(0xe823);
  IconData get long_small_up => const _DSIconsIconData(0xe824);
  IconData get long_up => const _DSIconsIconData(0xe825);

  List<IconData> get values => [
        chevron_down,
        chevron_right,
        chevron_small_down,
        chevron_small_left,
        chevron_small_right,
        chevron_left,
        chevron_small_up,
        chevron_up,
        long_down,
        long_left,
        long_right,
        long_small_down,
        long_small_left,
        long_small_right,
        long_small_up,
        long_up
      ];
}

class AttentionIcons {
  const AttentionIcons();

  IconData get circle_error => const _DSIconsIconData(0xe826);
  IconData get info => const _DSIconsIconData(0xe827);
  IconData get warning => const _DSIconsIconData(0xe828);

  List<IconData> get values => [circle_error, info, warning];
}

class BasicIcons {
  const BasicIcons();

  IconData get block => const _DSIconsIconData(0xe829);
  IconData get calendar_cash => const _DSIconsIconData(0xe82a);
  IconData get calendar_check => const _DSIconsIconData(0xe82b);
  IconData get calendar => const _DSIconsIconData(0xe82c);
  IconData get camera => const _DSIconsIconData(0xe82d);
  IconData get check_big => const _DSIconsIconData(0xe82e);
  IconData get check => const _DSIconsIconData(0xe82f);
  IconData get circle_check => const _DSIconsIconData(0xe830);
  IconData get download => const _DSIconsIconData(0xe831);
  IconData get home => const _DSIconsIconData(0xe832);
  IconData get link => const _DSIconsIconData(0xe833);
  IconData get location => const _DSIconsIconData(0xe834);
  IconData get logout => const _DSIconsIconData(0xe835);
  IconData get mail => const _DSIconsIconData(0xe836);
  IconData get upload => const _DSIconsIconData(0xe837);

  List<IconData> get values => [
        block,
        calendar_cash,
        calendar_check,
        calendar,
        camera,
        check_big,
        check,
        circle_check,
        download,
        home,
        link,
        location,
        logout,
        mail,
        upload
      ];
}

class BrandIcons {
  const BrandIcons();

  IconData get facebook => const _DSIconsIconData(0xe838);
  IconData get instagram => const _DSIconsIconData(0xe839);
  IconData get linkedin => const _DSIconsIconData(0xe83a);
  IconData get twitter => const _DSIconsIconData(0xe83b);
  IconData get whatsapp => const _DSIconsIconData(0xe83c);
  IconData get youtube => const _DSIconsIconData(0xe83d);

  List<IconData> get values =>
      [facebook, instagram, linkedin, twitter, whatsapp, youtube];
}

class CashIcons {
  const CashIcons();

  IconData get auto_debit => const _DSIconsIconData(0xe83e);
  IconData get cashback => const _DSIconsIconData(0xe83f);
  IconData get code_bar => const _DSIconsIconData(0xe840);
  IconData get credit_card => const _DSIconsIconData(0xe841);
  IconData get extra_money => const _DSIconsIconData(0xe842);
  IconData get invoice => const _DSIconsIconData(0xe843);
  IconData get money_alt => const _DSIconsIconData(0xe844);
  IconData get money => const _DSIconsIconData(0xe845);
  IconData get payment_reversal => const _DSIconsIconData(0xe846);
  IconData get payment_received => const _DSIconsIconData(0xe847);
  IconData get portability => const _DSIconsIconData(0xe848);
  IconData get price_tag => const _DSIconsIconData(0xe849);
  IconData get transfer => const _DSIconsIconData(0xe84a);
  IconData get virtual_card => const _DSIconsIconData(0xe84b);
  IconData get withdraw_money => const _DSIconsIconData(0xe84c);

  List<IconData> get values => [
        auto_debit,
        cashback,
        code_bar,
        credit_card,
        extra_money,
        invoice,
        money_alt,
        money,
        payment_reversal,
        payment_received,
        portability,
        price_tag,
        transfer,
        virtual_card,
        withdraw_money
      ];
}

class ChartIcons {
  const ChartIcons();

  IconData get bar_chart => const _DSIconsIconData(0xe84d);
  IconData get pie_chart => const _DSIconsIconData(0xe84e);
  IconData get trending_down => const _DSIconsIconData(0xe84f);
  IconData get trending_up => const _DSIconsIconData(0xe850);

  List<IconData> get values =>
      [bar_chart, pie_chart, trending_down, trending_up];
}

class CommunicationIcons {
  const CommunicationIcons();

  IconData get add_comment => const _DSIconsIconData(0xe851);
  IconData get coment => const _DSIconsIconData(0xe852);
  IconData get contact_support => const _DSIconsIconData(0xe853);
  IconData get help => const _DSIconsIconData(0xe854);
  IconData get send => const _DSIconsIconData(0xe855);

  List<IconData> get values =>
      [add_comment, coment, contact_support, help, send];
}

class DocumentIcons {
  const DocumentIcons();

  IconData get identity => const _DSIconsIconData(0xe856);
  IconData get invoice_check => const _DSIconsIconData(0xe857);
  IconData get invoice => const _DSIconsIconData(0xe858);
  IconData get list => const _DSIconsIconData(0xe859);
  IconData get text => const _DSIconsIconData(0xe85a);

  List<IconData> get values => [identity, invoice_check, invoice, list, text];
}

class ExperimentalIcons {
  const ExperimentalIcons();

  IconData get airplane => const _DSIconsIconData(0xe85b);
  IconData get attendance => const _DSIconsIconData(0xe85c);
  IconData get bank => const _DSIconsIconData(0xe85d);
  IconData get book => const _DSIconsIconData(0xe85e);
  IconData get bus => const _DSIconsIconData(0xe85f);
  IconData get business => const _DSIconsIconData(0xe860);
  IconData get car => const _DSIconsIconData(0xe861);
  IconData get clock_back => const _DSIconsIconData(0xe862);
  IconData get clock => const _DSIconsIconData(0xe863);
  IconData get clothes => const _DSIconsIconData(0xe864);
  IconData get coffee => const _DSIconsIconData(0xe865);
  IconData get doctor => const _DSIconsIconData(0xe866);
  IconData get drugstore => const _DSIconsIconData(0xe867);
  IconData get fast_food => const _DSIconsIconData(0xe868);
  IconData get flash_off => const _DSIconsIconData(0xe869);
  IconData get food => const _DSIconsIconData(0xe86a);
  IconData get game => const _DSIconsIconData(0xe86b);
  IconData get gas_station => const _DSIconsIconData(0xe86c);
  IconData get gym => const _DSIconsIconData(0xe86d);
  IconData get hotel => const _DSIconsIconData(0xe86e);
  IconData get image => const _DSIconsIconData(0xe86f);
  IconData get notification => const _DSIconsIconData(0xe870);
  IconData get package => const _DSIconsIconData(0xe871);
  IconData get pet => const _DSIconsIconData(0xe872);
  IconData get phone => const _DSIconsIconData(0xe873);
  IconData get placeholder => const _DSIconsIconData(0xe874);
  IconData get pork => const _DSIconsIconData(0xe875);
  IconData get present => const _DSIconsIconData(0xe876);
  IconData get report => const _DSIconsIconData(0xe877);
  IconData get security => const _DSIconsIconData(0xe878);
  IconData get services => const _DSIconsIconData(0xe879);
  IconData get shapes => const _DSIconsIconData(0xe87a);
  IconData get signature => const _DSIconsIconData(0xe87b);
  IconData get store => const _DSIconsIconData(0xe87c);
  IconData get supermarket => const _DSIconsIconData(0xe87d);
  IconData get teeth => const _DSIconsIconData(0xe87e);
  IconData get telecommunication => const _DSIconsIconData(0xe87f);
  IconData get television => const _DSIconsIconData(0xe880);
  IconData get ticket => const _DSIconsIconData(0xe881);
  IconData get toll => const _DSIconsIconData(0xe882);
  IconData get tray => const _DSIconsIconData(0xe883);
  IconData get work => const _DSIconsIconData(0xe884);

  List<IconData> get values => [
        airplane,
        attendance,
        bank,
        book,
        bus,
        business,
        car,
        clock_back,
        clock,
        clothes,
        coffee,
        doctor,
        drugstore,
        fast_food,
        flash_off,
        food,
        game,
        gas_station,
        gym,
        hotel,
        image,
        notification,
        package,
        pet,
        phone,
        placeholder,
        pork,
        present,
        report,
        security,
        services,
        shapes,
        signature,
        store,
        supermarket,
        teeth,
        telecommunication,
        television,
        ticket,
        toll,
        tray,
        work
      ];
}

class FavoriteIcons {
  const FavoriteIcons();

  IconData get bookmark_on => const _DSIconsIconData(0xe885);
  IconData get bookmark_tag_on => const _DSIconsIconData(0xe886);
  IconData get bookmark_tag => const _DSIconsIconData(0xe887);
  IconData get bookmark => const _DSIconsIconData(0xe888);
  IconData get heart_on_1 => const _DSIconsIconData(0xe889);
  IconData get heart_on => const _DSIconsIconData(0xe88a);
  IconData get heart => const _DSIconsIconData(0xe88b);
  IconData get star => const _DSIconsIconData(0xe88c);

  List<IconData> get values => [
        bookmark_on,
        bookmark_tag_on,
        bookmark_tag,
        bookmark,
        heart_on_1,
        heart_on,
        heart,
        star
      ];
}

class MenuIcons {
  const MenuIcons();

  IconData get close_small => const _DSIconsIconData(0xe88d);
  IconData get close => const _DSIconsIconData(0xe88e);
  IconData get duo => const _DSIconsIconData(0xe88f);
  IconData get hamburger => const _DSIconsIconData(0xe890);

  List<IconData> get values => [close_small, close, duo, hamburger];
}

class ServicesIcons {
  const ServicesIcons();

  IconData get fgts => const _DSIconsIconData(0xe891);
  IconData get livelo => const _DSIconsIconData(0xe892);
  IconData get open_banking => const _DSIconsIconData(0xe893);
  IconData get pix => const _DSIconsIconData(0xe894);

  List<IconData> get values => [fgts, livelo, open_banking, pix];
}

class UsersIcons {
  const UsersIcons();

  IconData get user_minus => const _DSIconsIconData(0xe895);
  IconData get user_plus => const _DSIconsIconData(0xe896);
  IconData get user => const _DSIconsIconData(0xe897);

  List<IconData> get values => [user_minus, user_plus, user];
}

class VideoIcons {
  const VideoIcons();

  IconData get cam => const _DSIconsIconData(0xe898);
  IconData get mic_off => const _DSIconsIconData(0xe899);
  IconData get mic => const _DSIconsIconData(0xe89a);
  IconData get play => const _DSIconsIconData(0xe89b);
  IconData get previous => const _DSIconsIconData(0xe89c);
  IconData get skip_next => const _DSIconsIconData(0xe8a0);
  IconData get speed => const _DSIconsIconData(0xe89d);
  IconData get volume_off => const _DSIconsIconData(0xe89e);
  IconData get volume => const _DSIconsIconData(0xe89f);

  List<IconData> get values =>
      [cam, mic_off, mic, play, previous, skip_next, speed, volume_off, volume];
}

class NumberIcons {
  const NumberIcons();

  IconData get one => const _DSNumberIconData(0xe904);
  IconData get two => const _DSNumberIconData(0xe908);
  IconData get three => const _DSNumberIconData(0xe907);
  IconData get four => const _DSNumberIconData(0xe902);
  IconData get five => const _DSNumberIconData(0xe901);
  IconData get six => const _DSNumberIconData(0xe906);
  IconData get seven => const _DSNumberIconData(0xe905);
  IconData get eight => const _DSNumberIconData(0xe900);
  IconData get nine => const _DSNumberIconData(0xe903);
  IconData get zero => const _DSNumberIconData(0xe909);

  List<IconData> get values => [
        one,
        two,
        three,
        four,
        five,
        six,
        seven,
        eight,
        nine,
        zero,
      ];
}
