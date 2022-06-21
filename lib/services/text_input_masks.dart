import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TheTextInputMask{
  static MaskTextInputFormatter phoneMaskFormatter = MaskTextInputFormatter(
    mask: "## ### ## ##",
    type: MaskAutoCompletionType.lazy,
  );
    static MaskTextInputFormatter addCardNumberFormatter = MaskTextInputFormatter(
    mask: "#### #### #### ####",
    type: MaskAutoCompletionType.lazy,
  );
    static MaskTextInputFormatter addCardDateFormatter = MaskTextInputFormatter(
    mask: "##/##",
    type: MaskAutoCompletionType.lazy,
  );
}