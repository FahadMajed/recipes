import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';
import '../../ui.dart';

class ReachScaffold extends StatelessWidget {
  final String? title;
  final PreferredSizeWidget? customAppBar;

  ///takes a list of possible asyncs calls
  final bool? isLoading;
  final CrossAxisAlignment alignment;
  final EdgeInsets outerPadding;
  final EdgeInsets innerPadding;
  final BottomButton? button;
  final List<Widget> body;
  final bool isScrollable;
  final String h4;
  final String h5;
  final String h6;
  final bool hasDivider;
  final Widget? beforeBody;
  final GlobalKey<FormState>? formKey;
  final bool withWhiteContainer;
  final List<Widget> innerChildren;
  final String imageFile;

  final bool withAppBar;
  final bool withSafeArea;
  final bool resizeToAvoidBottomInset;
  final MainAxisAlignment mainAxisAlignment;
  final Color? scaffoldBackgroundColor;
  ReachScaffold({
    Key? key,
    this.title,
    this.customAppBar,
    this.isLoading,
    this.imageFile = "",
    this.alignment = CrossAxisAlignment.start,
    this.outerPadding = padding8,
    this.innerPadding = padding8,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.button,
    required this.body,
    this.isScrollable = false,
    this.h4 = "",
    this.h5 = "",
    this.h6 = "",
    this.hasDivider = true,
    this.withWhiteContainer = true,
    this.formKey,
    this.beforeBody,
    this.innerChildren = const [],
    this.withAppBar = true,
    this.withSafeArea = false,
    this.resizeToAvoidBottomInset = true,
    this.scaffoldBackgroundColor,
  }) : super(key: key);

  final bodyFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return buildScaffold(context);
  }

  ModalProgressHUD buildScaffold(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading != null ? isLoading! : false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(bodyFocusNode),
        child: Scaffold(
          backgroundColor: scaffoldBackgroundColor ?? backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          appBar: withAppBar
              ? (customAppBar ??
                  AppBar(
                    title: Text(
                      title?.tr ?? "reach".tr,
                    ),
                  ))
              : null,
          body: Form(
            key: formKey,
            child: withSafeArea
                ? SafeArea(
                    bottom: button != null ? false : true, child: buildBody())
                : buildBody(),
          ),
          bottomNavigationBar:
              isScrollable == false || resizeToAvoidBottomInset == false
                  ? button
                  : null,
        ),
      ),
    );
  }

  Widget buildBody() {
    return Stack(
      children: [
        if (imageFile.isNotEmpty)
          Positioned.fill(
            child: Image.asset(
              "assets/images/$imageFile",
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomLeft,
            ),
          ),
        isScrollable
            ? LayoutSingleChild(
                [
                  if (beforeBody != null) beforeBody!,
                  container(),
                  expandedContainer,
                  if (resizeToAvoidBottomInset && button != null) button!
                ],
              )
            : Column(
                mainAxisAlignment: mainAxisAlignment,
                children: [if (beforeBody != null) beforeBody!, container()],
              ),
      ],
    );
  }

  Widget container() {
    if (withWhiteContainer) {
      return WhiteContainer(
        body: [
          if (h5.isNotEmpty || h6.isNotEmpty)
            Heading(
              h4: h4,
              h5: h5,
              h6: h6,
              hasDivider: hasDivider,
            ),
          ...body,
          if (innerChildren.isNotEmpty) DarkBlueContainer(innerChildren),
        ],
        alignment: alignment,
        outerPadding: outerPadding,
        innerPadding: innerPadding,
      );
    } else {
      return Flexible(
        flex: 1,
        child: Padding(
          padding: outerPadding,
          child: Container(
            height: 88.h,
            padding: innerPadding,
            child: isScrollable
                ? SingleChildScrollView(
                    child: column(),
                  )
                : column(),
          ),
        ),
      );
    }
  }

  Column column() {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        if (h6.isNotEmpty)
          Heading(
            h4: h4,
            h5: h5,
            h6: h6,
            hasDivider: hasDivider,
          ),
        ...body,
        if (innerChildren.isNotEmpty) DarkBlueContainer(innerChildren),
      ],
    );
  }
}
