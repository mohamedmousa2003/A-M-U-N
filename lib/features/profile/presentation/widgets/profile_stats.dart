import 'package:amun/features/profile/presentation/widgets/profile_stat_item.dart';
import 'package:flutter/cupertino.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        ProfileStatItem(title: "Trips", value: "12"),
        ProfileStatItem(title: "Favorites", value: "24"),
        ProfileStatItem(title: "Cities", value: "8"),
      ],
    );
  }
}
