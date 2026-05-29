import 'package:control_card_prototype/common_lib.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Top Header
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.padding24,
            vertical: Sizes.padding16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'LINE 03 • YAMATO • SHIFT A',
                    style: AppTextStyles
                        .liberationMono
                        .textStyle12BoldGrey600Spacing12,
                  ),
                  const SizedBox(height: Sizes.size4),
                  Text(
                    'Work Orders',
                    style: AppTextStyles.inter.textStyle28BoldBlack87,
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
                label: Text(
                  'Scan WO tag',
                  style: AppTextStyles.inter.textStyle14Bold.copyWith(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A1A1A),
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.padding24,
                    vertical: Sizes.padding16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Sizes.radius4),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: Sizes.size1,
          thickness: Sizes.size1,
          color: Color(0xFFE0E0E0),
        ),
        // Sub-header (Instructions)
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.padding24,
            vertical: Sizes.padding12,
          ),
          child: Row(
            children: <Widget>[
              Text(
                'OPEN A WO:',
                style:
                    AppTextStyles.liberationMono.textStyle12BoldGrey600Spacing1,
              ),
              const SizedBox(width: Sizes.size16),
              _buildInstructionBadge('1. TAP WO TILE BELOW'),
              const SizedBox(width: Sizes.size12),
              Text(
                '–or–',
                style: AppTextStyles.liberationMono.textStyle12RegularGrey500,
              ),
              const SizedBox(width: Sizes.size12),
              _buildInstructionBadge('2. SCAN THE PRINTED WO TAG'),
              const Spacer(),
              Text(
                'NO TYPING NEEDED',
                style:
                    AppTextStyles.liberationMono.textStyle12BoldGrey500Spacing1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInstructionBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.padding10,
        vertical: Sizes.padding4,
      ),
      decoration: AppDecorations.headerInstructionBadge(),
      child: Text(
        text,
        style: AppTextStyles.liberationMono.textStyle11Bold.copyWith(
          color: Colors.white,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
