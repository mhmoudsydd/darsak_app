import 'package:flutter/material.dart';

class DropdownItem {
  final String labelEn;
  final String label;
  final IconData? icon;
  final Color? color;

  const DropdownItem({
    required this.labelEn,
    required this.label,
    this.icon, // ✅ Nullable, defaults to null
    this.color = const Color(0xFF4A90E2),
  });
}

class CustomDropdown extends StatefulWidget {
  final String? value;
  final List<DropdownItem> items;
  final String placeholder;
  final String? labelEn;
  final ValueChanged<String?> onChanged;
  // final ValueChanged<String?>?onChangedEn;
  final IconData? placeholderIcon;

  const CustomDropdown({
    super.key,
    this.value,
    required this.items,
    this.placeholder = 'اختر',
    required this.onChanged,
    //  this.onChangedEn,
    this.labelEn,
    this.placeholderIcon,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late final AnimationController _ctrl;
  late final Animation<double> _rotation;

  static const TextStyle _style = TextStyle(
    color: Colors.grey,
    fontFamily: 'Harmattan',
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const TextStyle _placeholderStyle = TextStyle(
    color: Color(0xFFBDBDBD),
    fontFamily: 'Harmattan',
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _rotation = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _isOpen = !_isOpen);
    _isOpen ? _ctrl.forward() : _ctrl.reverse();
  }

  DropdownItem? _getSelected() {
    if (widget.value == null) return null;
    try {
      return widget.items.firstWhere((item) {
        item.labelEn == widget.labelEn;
        return item.label == widget.value;
      });
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selected = _getSelected();
    final isSelected = selected != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔽 Trigger Button
        GestureDetector(
          onTap: _toggle,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: selected?.icon != null ? 12 : 12,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: _isOpen ? Colors.blue : Colors.grey.shade300,
                width: _isOpen ? 2 : 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(_isOpen ? 0.12 : 0.06),
                  blurRadius: _isOpen ? 12 : 8,
                  offset: Offset(0, _isOpen ? 4 : 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // ✅ Icon prefix: only show if exists
                RotationTransition(
                  turns: _rotation,
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.blue,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),

                // ✅ Label text
                Expanded(
                  child: Text(
                    isSelected ? selected.label : widget.placeholder,
                    style: isSelected ? _style : _placeholderStyle,
                    textDirection: TextDirection.rtl,
                  ),
                ),

                // ✅ Dropdown arrow
                if (isSelected && selected.icon != null) ...[
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: (selected.color ?? Colors.blue).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      selected.icon,
                      color: selected.color ?? Colors.blue,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                ] else if (!isSelected && widget.placeholderIcon != null) ...[
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      widget.placeholderIcon,
                      color: Colors.grey.shade500,
                      size: 20,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        // 📜 Dropdown List
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: _isOpen ? (widget.items.length * 48).toDouble() : 0,
          margin: const EdgeInsets.only(top: 8),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: widget.items.map((item) {
              final isSelectedOption = widget.value == item.label;
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    widget.onChanged(item.label);
                    //  widget.onChangedEn != null ? widget.onChangedEn!(item.labelEn): null;
                    _toggle();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    color: isSelectedOption
                        ? (item.color ?? Colors.blue).withOpacity(0.06)
                        : Colors.transparent,
                    child: Row(
                      children: [
                        // ✅ Icon in list: only show if exists
                        if (isSelectedOption)
                          Icon(
                            Icons.check_rounded,
                            color: item.color ?? Colors.blue,
                            size: 20,
                          ),
                        // ✅ Label in list
                        Expanded(
                          child: Text(
                            item.label,
                            style: _style.copyWith(
                              color: isSelectedOption
                                  ? item.color ?? Colors.blue
                                  : Colors.grey,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),

                        // ✅ Checkmark for selected
                        if (item.icon != null) ...[
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: (item.color ?? Colors.blue).withOpacity(
                                0.15,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              item.icon,
                              color: item.color ?? Colors.blue,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
