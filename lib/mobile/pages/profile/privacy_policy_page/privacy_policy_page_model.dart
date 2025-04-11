import '/flutter_flow/flutter_flow_util.dart';
import 'privacy_policy_page_widget.dart' show PrivacyPolicyPageWidget;
import 'package:flutter/material.dart';

class PrivacyPolicyPageModel extends FlutterFlowModel<PrivacyPolicyPageWidget> {
  ///  Local state fields for this page.

  List<String> privacy = [
    'Сбор и использование информации: Мы собираем определенную информацию, когда вы используете наше приложение. Эта информация может включать в себя персональные данные, такие как ваше имя, адрес электронной почты и финансовую информацию. Мы собираем эту информацию только в тех случаях, когда она явно предоставлена нами пользователем и требуется для предоставления наших услуг.',
    'Использование информации: Мы используем собранную информацию для предоставления, поддержки, улучшения и персонализации нашего приложения. Мы можем использовать вашу личную информацию для связи с вами, чтобы предоставить вам информацию и обновления о нашем приложении, а также для целей маркетинга и исследования.',
    'Раскрытие информации третьим сторонам: Мы не продаем, не обмениваем и не передаем вашу личную информацию третьим сторонам без вашего согласия, за исключением случаев, когда это требуется законом или когда мы считаем, что такие действия необходимы для соблюдения закона, обеспечения нашей политики или защиты прав, собственности или безопасности.'
  ];
  void addToPrivacy(String item) => privacy.add(item);
  void removeFromPrivacy(String item) => privacy.remove(item);
  void removeAtIndexFromPrivacy(int index) => privacy.removeAt(index);
  void insertAtIndexInPrivacy(int index, String item) =>
      privacy.insert(index, item);
  void updatePrivacyAtIndex(int index, Function(String) updateFn) =>
      privacy[index] = updateFn(privacy[index]);

  List<String> terms = [
    'Принятие условий: При использовании нашего приложения, вы соглашаетесь с нашими условиями использования. Если вы не согласны с этими условиями, пожалуйста, прекратите использование приложения.',
    'Ограничения использования: Вы обязуетесь использовать наше приложение только в соответствии с действующими законами и нормами поведения. Вам запрещено использовать приложение для незаконных или вредоносных целей, включая, но не ограничиваясь, попытками взлома системы или получения несанкционированного доступа к данным других пользователей.',
    'Интеллектуальная собственность: Вся интеллектуальная собственность, связанная с нашим приложением, включая, но не ограничиваясь, лого, дизайн, тексты и коды, является собственностью нашей компании или ее лицензионных правообладателей. Вам запрещено копировать, модифицировать или распространять любые материалы, связанные с нашим приложением, без нашего предварительного разрешения.'
  ];
  void addToTerms(String item) => terms.add(item);
  void removeFromTerms(String item) => terms.remove(item);
  void removeAtIndexFromTerms(int index) => terms.removeAt(index);
  void insertAtIndexInTerms(int index, String item) =>
      terms.insert(index, item);
  void updateTermsAtIndex(int index, Function(String) updateFn) =>
      terms[index] = updateFn(terms[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
