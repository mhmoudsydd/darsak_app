import 'package:darsak/core/extension/num_extension.dart';
import 'package:flutter/material.dart';

enum SnackType { success, warning, error }
enum SnackPosition { top, bottom }

void customSnackBar(
  BuildContext context, {
  required String message,
  SnackType type = SnackType.success,
  SnackPosition position = SnackPosition.top,
  Duration displayDuration = const Duration(seconds: 3),
  Duration animationDuration = const Duration(milliseconds: 300),
  bool forceRtl = false, // ✅ Optional: Force RTL regardless of locale
}) {
  final overlayState = Overlay.of(context);
  
  // ✅ Auto-detect RTL based on locale or force it
  final isRtl = forceRtl || Localizations.localeOf(context).languageCode == 'ar';

  Color backgroundColor;
  switch (type) {
    case SnackType.success: backgroundColor = Colors.green; break;
    case SnackType.warning: backgroundColor = Colors.orange; break;
    case SnackType.error: backgroundColor = Colors.red; break;
  }

  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: position == SnackPosition.top ? 0 : null,
      bottom: position == SnackPosition.bottom ? 0 : null,
      left: 0, right: 0,
      child: Directionality( // ✅ Wrap with Directionality for RTL support
        textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
        child: TopSnackBarWidget(
          message: message,
          backgroundColor: backgroundColor,
          onDismiss: () {},
          displayDuration: displayDuration,
          animationDuration: animationDuration,
          position: position,
          isRtl: isRtl, // ✅ Pass RTL flag to widget
        ),
      ),
    ),
  );

  overlayState.insert(overlayEntry);
}

class TopSnackBarWidget extends StatefulWidget {
  final String message;
  final Color backgroundColor;
  final VoidCallback onDismiss;
  final Duration displayDuration;
  final Duration animationDuration;
  final SnackPosition position;
  final bool isRtl; // ✅ New parameter

  const TopSnackBarWidget({
    super.key,
    required this.message,
    required this.backgroundColor,
    required this.onDismiss,
    required this.displayDuration,
    required this.animationDuration,
    required this.position,
    required this.isRtl,
  });

  @override
  State<TopSnackBarWidget> createState() => _TopSnackBarWidgetState();
}

class _TopSnackBarWidgetState extends State<TopSnackBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    // ✅ Vertical animation (unchanged - works for RTL/LTR)
    _slideAnimation = Tween<Offset>(
      begin: widget.position == SnackPosition.bottom
          ? const Offset(0, 1)
          : const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
    Future.delayed(widget.displayDuration, () {
      _controller.reverse().then((_) => widget.onDismiss());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Material(
        color: widget.backgroundColor,
        child: SafeArea(
          child: Container(
            // ✅ Use EdgeInsetsDirectional for RTL-aware padding
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 16, 
              horizontal: 24,
            ),
            child: Column(
              // ✅ crossAxisAlignment.start auto-adapts to RTL when wrapped in Directionality
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.message,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Harmattan'),
                  // ✅ Let Flutter auto-detect direction based on content, or force RTL
                  textDirection: widget.isRtl ? TextDirection.rtl : null,
                  textAlign: widget.isRtl ? TextAlign.right : TextAlign.left,
                ),
                20.sbh,
              ],
            ),
          ),
        ),
      ),
    );
  }
}