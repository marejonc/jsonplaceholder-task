import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tcb_recru_task/l10n/intl_util.dart';

class NavBarPage extends StatelessWidget {
  const NavBarPage({required this.shell, super.key});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: shell),
          _NavBar(shell),
        ],
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar(this.shell);

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    final tr = context.l10n;

    return SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade400)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            _NavBarItem(
              label: tr.gallery,
              icon: Icons.photo_library,
              onTap: () => shell.goBranch(0),
            ),
            _NavBarItem(
              label: tr.comments,
              icon: Icons.comment,
              onTap: () => shell.goBranch(1),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [Icon(icon), SizedBox(height: 4), Text(label)],
            ),
          ),
        ),
      ),
    );
  }
}
