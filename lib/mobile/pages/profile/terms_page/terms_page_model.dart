import '/flutter_flow/flutter_flow_util.dart';
import 'terms_page_widget.dart' show TermsPageWidget;
import 'package:flutter/material.dart';

class TermsPageModel extends FlutterFlowModel<TermsPageWidget> {
  ///  Local state fields for this page.

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
