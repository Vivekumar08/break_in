import 'package:flutter/material.dart';
import '../models/menu.dart';
import '../style/fonts.dart';
import '../style/palette.dart';

typedef ItemFilterCallback = bool Function(String category, MenuItem item);

class Accordion extends StatefulWidget {
  const Accordion({
    super.key,
    required this.header,
    this.expandedheader,
    this.body,
    this.initialValue,
    this.expansionCallback,
  });

  final Widget header;
  final Widget? expandedheader;
  final Widget? body;
  final bool? initialValue;
  final void Function(bool)? expansionCallback;

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  late bool isExpanded;

  @override
  void initState() {
    isExpanded = widget.initialValue ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => setState(() {
            isExpanded = !isExpanded;
            widget.expansionCallback?.call(isExpanded);
          }),
          child: widget.expandedheader == null
              ? widget.header
              : (isExpanded ? widget.expandedheader : widget.header),
        ),
        isExpanded ? widget.body ?? Container() : Container(),
      ],
    );
  }
}

class MenuAccordion extends StatefulWidget {
  const MenuAccordion({Key? key, required this.menu, this.itemFilter})
      : super(key: key);

  final MenuCategory menu;
  final ItemFilterCallback? itemFilter;

  @override
  State<MenuAccordion> createState() => _MenuAccordionState();
}

class _MenuAccordionState extends State<MenuAccordion> {
  void expansionCallback(int index, bool isExpanded) => setState(() {
        widget.menu.isExpanded = !widget.menu.isExpanded;
      });

  @override
  // TODO: Implement accordion in menu accordion
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AccordionHeader(
            title: widget.menu.name,
            isExpanded: widget.menu.isExpanded,
            onPressed: () => expansionCallback(0, widget.menu.isExpanded)),
        widget.menu.isExpanded
            ? Column(
                children: [
                  for (MenuItem item in widget.menu.items!)
                    _AccordionBody(item: item, itemFilter: widget.itemFilter)
                ],
              )
            : Container()
      ],
    );
  }
}

class _AccordionHeader extends StatelessWidget {
  const _AccordionHeader(
      {Key? key,
      required this.title,
      required this.isExpanded,
      required this.onPressed})
      : super(key: key);

  final String title;
  final bool isExpanded;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: Fonts.buttonText.copyWith(color: Palette.text)),
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.zero,
      dense: true,
      trailing: Icon(
          isExpanded
              ? Icons.keyboard_arrow_up_outlined
              : Icons.keyboard_arrow_down_outlined,
          color: Palette.iconsCol),
      shape: isExpanded
          ? null
          : UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.24)),
            ),
      onTap: onPressed,
    );
  }
}

class _AccordionBody extends StatelessWidget {
  const _AccordionBody({Key? key, required this.item, this.itemFilter})
      : super(key: key);

  final MenuItem item;
  final ItemFilterCallback? itemFilter;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name,
          style: Fonts.textButton.copyWith(color: Palette.text, height: 1.11)),
      subtitle: Text(item.details,
          style: Fonts.simTextBlack.copyWith(letterSpacing: 0)),
      leading: item.isVeg
          ? Stack(
              alignment: Alignment.center,
              children: const [
                Icon(Icons.crop_square_sharp, color: Colors.green, size: 30),
                Icon(Icons.circle, color: Colors.green, size: 12),
              ],
            )
          : Stack(
              alignment: Alignment.center,
              children: const [
                Icon(Icons.crop_square_sharp, color: Colors.red, size: 36),
                Icon(Icons.circle, color: Colors.red, size: 14),
              ],
            ),
      trailing: Text('Rs. ${item.price}',
          style: Fonts.otpText.copyWith(fontSize: 16.0)),
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.zero,
      shape: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black.withOpacity(0.24)),
      ),
      dense: true,
    );
  }
}
