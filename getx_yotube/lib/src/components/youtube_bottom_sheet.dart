import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_yotube/res.dart';

class YoutubeBottomSheet extends StatelessWidget {
  const YoutubeBottomSheet({Key? key}) : super(key: key);

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '만들기',
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.close,
            ))
      ],
    );
  }

  Widget _itemButton(
      String icon, double iconSize, String label, Function onTap) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.3),
            ),
            child: Center(
              child: Container(
                child: SvgPicture.asset(
                  icon,
                  width: iconSize,
                  height: iconSize,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        height: 200,
        padding: EdgeInsets.only(left: 20),
        color: Colors.white,
        child: Column(
          children: [
            _header(),
            SizedBox(
              height: 10,
            ),
            _itemButton(Res.upload, 17, "동영상 업로드", () {
              print("동영상 업로드 기능");
            }),
            SizedBox(
              height: 10,
            ),
            _itemButton(Res.broadcast, 25, "실시간 스트리밍 시작", () {
              print("실시간 스트리밍 시작 기능");
            }),
            // _itemButton(),
          ],
        ),
      ),
    );
  }
}
