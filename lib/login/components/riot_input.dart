import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RiotInput extends StatefulWidget {
  final String labelText;
  final InputType inputType;
  final TextEditingController? controller;
  const RiotInput(
      {super.key,
      required this.labelText,
      this.controller,
      this.inputType = InputType.text});

  @override
  State<RiotInput> createState() => _RiotInputState();
}

class _RiotInputState extends State<RiotInput>
    with SingleTickerProviderStateMixin {
  final FocusNode focusNode = FocusNode();
  final int _millisecondsAnimationDelay = 100;
  late AnimationController _animationController;
  late Animation<double?> topAnimation = Tween<double?>(begin: 18, end: 1)
      .animate(CurvedAnimation(
          parent: _animationController, curve: Curves.decelerate));
  late Animation<double> leftAnimation = Tween<double>(begin: 10, end: 5)
      .animate(CurvedAnimation(
          parent: _animationController, curve: Curves.decelerate));
  late Animation<double> borderSize = Tween<double>(begin: 0, end: 1.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.decelerate));

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: _millisecondsAnimationDelay));
    focusNode.addListener(checkFocus);
    super.initState();
  }

  @override
  void dispose() {
    focusNode.removeListener(checkFocus);
    _animationController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  Future<void> checkFocus() async {
    if (focusNode.hasFocus) {
      await _animationController.animateTo(1);
      setState(() {});
    } else {
      if (_controller.text.isEmpty) {
        await _animationController.animateTo(0);
      }
      setState(() {});
    }
  }

  late final TextEditingController _controller =
      widget.controller ?? TextEditingController();

  Color get _currentBorderColor =>
      focusNode.hasFocus ? Colors.black : Colors.transparent;
  Color get _currentBackgroundColor =>
      focusNode.hasFocus ? Colors.white : const Color(0xFFededed);

  InputDecoration inputDecoration = const InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 9, vertical: 11),
      border: UnderlineInputBorder(borderSide: BorderSide.none));

  bool obscureText = true;

  String get currentShowedSVG => obscureText
      ? "assets/svgs/password_hidden.svg"
      : "assets/svgs/password_showed.svg";

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return AnimatedContainer(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
                border: Border.all(
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: _currentBorderColor,
                    width: borderSize.value),
                color: _currentBackgroundColor,
                borderRadius: BorderRadius.circular(3)),
            duration: Duration(milliseconds: _millisecondsAnimationDelay),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextField(
                    controller: _controller,
                    obscureText:
                        obscureText && widget.inputType == InputType.password,
                    focusNode: focusNode,
                    decoration: inputDecoration,
                    style: GoogleFonts.lexendDeca(fontWeight: FontWeight.w600),
                    cursorColor: Colors.black,
                    cursorWidth: 1,
                    cursorHeight: 20,
                  ),
                ),
                AnimatedPositioned(
                  left: leftAnimation.value,
                  top: topAnimation.value,
                  duration: Duration(milliseconds: _millisecondsAnimationDelay),
                  child: IgnorePointer(
                    child: Text(widget.labelText,
                        style: GoogleFonts.lexendDeca(
                            fontWeight: FontWeight.w800,
                            fontSize: 9,
                            color: const Color(0xFF6f6f6f))),
                  ),
                ),
                Positioned(
                  right: 10,
                  child: Visibility(
                    visible: widget.inputType == InputType.password &&
                        focusNode.hasFocus,
                    child: TextFieldTapRegion(
                      child: InkWell(
                        onFocusChange: (value) => focusNode.requestFocus(),
                        onTap: toggleObscureText,
                        child: SizedBox(
                          width: 18,
                          child: SvgPicture.asset(currentShowedSVG),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

enum InputType { text, password }
