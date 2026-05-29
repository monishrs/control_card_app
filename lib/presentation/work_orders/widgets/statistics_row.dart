import 'package:control_card_prototype/common_lib.dart';


class StatisticsRow extends StatelessWidget {
  const StatisticsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F7F7),
      child: Row(
        children: <Widget>[
          _buildStatItem('RUNNING', '2', const Color(0xFF1E8E3E), flex: 1),
          _buildDivider(),
          _buildStatItem('WAITING', '4', const Color(0xFFD97706), flex: 1),
          _buildDivider(),
          _buildStatItem('DONE TODAY', '12', Colors.black87, flex: 1),
          _buildDivider(),
          _buildStatItem(
            'PIECES OK',
            '1,842',
            const Color(0xFF1E8E3E),
            flex: 1,
          ),
          _buildDivider(),
          _buildStatItem('NG / 1000', '14', const Color(0xFFD32F2F), flex: 1),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    Color valueColor, {
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.padding24,
          vertical: Sizes.padding16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              label,
              style:
                  AppTextStyles.liberationMono.textStyle12BoldGrey600Spacing1,
            ),
            const SizedBox(height: Sizes.size4),
            Text(
              value,
              style: AppTextStyles.inter.textStyle28Bold.copyWith(
                color: valueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: Sizes.height60,
      width: Sizes.width1,
      color: const Color(0xFFE0E0E0),
    );
  }
}
