import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String senderName;
  final String message;
  final String profileImage;
  final String dateSent;
  final int unreadMessagesCount;

  const NotificationItem({
    Key? key,
    required this.senderName,
    required this.message,
    required this.profileImage,
    required this.dateSent,
    required this.unreadMessagesCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage(profileImage),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      senderName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(message),
                  ],
                ),
                SizedBox(
                  width: 5.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$dateSent',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    unreadMessagesCount != 0
                        ? CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Colors.red,
                            child: Text(
                              '$unreadMessagesCount',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
