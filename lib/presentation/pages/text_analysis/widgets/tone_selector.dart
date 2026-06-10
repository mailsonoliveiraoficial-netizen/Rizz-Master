import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class ToneSelector extends StatefulWidget {
  final ValueChanged<String> onToneSelected;

  const ToneSelector({super.key, required this.onToneSelected});

  @override
  State<ToneSelector> createState() => _ToneSelectorState();
}

class _ToneSelectorState extends State<ToneSelector> {
  final List<String> _tones = [
    "Natural",
    "Confiante",
    "Engraçado",
    "Sedutor",
    "Romântico",
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Selecione o Tom do Rizz",
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 42,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: _tones.length,
            itemBuilder: (context, index) {
              final bool isSelected = _selectedIndex == index;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ChoiceChip(
                  label: Text(_tones[index]),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _selectedIndex = index);
                      widget.onToneSelected(_tones[index]);
                    }
                  },
                  selectedColor: AppTheme.primaryPurple,
                  backgroundColor: AppTheme.cardColor,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : AppTheme.textGrey,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 13,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: isSelected ? AppTheme.primaryPurple : Colors.white10,
                      width: 1,
                    ),
                  ),
                  showCheckmark: false,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}