import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/app_colors.dart';

enum NavIdentifier { home, card, statistics, settings }

class BottomNavBar extends StatelessWidget {
  final Widget child;
  final NavIdentifier parent;

  const BottomNavBar({Key? key, required this.child, required this.parent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: child),
          _BottomNavBar(
            parent: parent,
          )
        ],
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final NavIdentifier parent;

  const _BottomNavBar({Key? key, required this.parent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 88,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(NavItem.navItems.length, (index) {
          bool _isActive = NavItem.navItems[index].identifier == parent;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _isActive?
                    null
                    : context.router.pushNamed(NavItem.navItems[index].route),
                child: SvgPicture.asset(
                  _isActive
                      ? 'assets/svgs/${NavItem.navItems[index].identifier.name}_active.svg'
                      : 'assets/svgs/${NavItem.navItems[index].identifier.name}.svg',
                  color: _isActive
                      ? AppColors.primaryColor1
                      : AppColors.tertiaryColor2,
                  height: 32,
                  width: 32,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Container(
                width: 12,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color:
                      _isActive ? AppColors.primaryColor1 : Colors.transparent,
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

class NavItem {
  final String route;
  final NavIdentifier identifier;

  NavItem({required this.route, required this.identifier});

  static List<NavItem> navItems = [home, card, statistics, settings];

  static NavItem home = NavItem(
    route: '/home-screen',
    identifier: NavIdentifier.home,
  );
  static NavItem card = NavItem(
    route: '/card-screen',
    identifier: NavIdentifier.card,
  );
  static NavItem statistics = NavItem(
    route: '/statistics-screen',
    identifier: NavIdentifier.statistics,
  );
  static NavItem settings = NavItem(
    route: '/settings-screen',
    identifier: NavIdentifier.settings,
  );
}
