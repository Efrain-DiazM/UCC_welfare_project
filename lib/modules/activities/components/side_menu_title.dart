import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SideMenuTitle extends StatelessWidget {
  const SideMenuTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
        padding: EdgeInsets.only(left: 24),
        child: Divider(
          color: Colors.white24,
          height: 1,
        ),
      ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(microseconds: 300),
              height: 56,
              width: 288,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
            ),
            const ListTile(
              // onTap: () {},
              leading: SizedBox(
                height: 34,
                width: 34,
                child: Icon(
                  Icons.home, 
                  color: Colors.white,
                ),
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ]
    );
  }
}
