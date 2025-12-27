import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/constant/text.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class ChatBotScreen extends StatefulWidget {
  static const String routeName = "chat";
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  File? file;
  List message = [];
  TextEditingController textEditingController = TextEditingController();

  String keyApi = "AIzaSyDVzxk9ilLqQIXQn1gaQWPk_jKbGkSVmTg";

  @override
  void initState() {
    Gemini.init(apiKey: keyApi);
    super.initState();
  }

  openGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(() {
        file = File(photo.path);
      });
    }
  }

  add() {
    if (file != null) {
      if (textEditingController.text.isNotEmpty) {
        setState(() {
          message.add({
            "text": textEditingController.text,
            "sender": true,
            "image": file,
            "hasImage": true,
          });
        });

        Gemini gemini = Gemini.instance;
        gemini.textAndImage(
          text: textEditingController.text,
          images: [file!.readAsBytesSync()],
        ).then((value) {
          setState(() {
            message.add({
              "text": value?.output ?? "لا يوجد رد",
              "sender": false,
              "image": null,
              "hasImage": false,
            });
          });
        });

        setState(() {
          file = null;
        });
      }
    } else {
      if (textEditingController.text.isNotEmpty) {
        setState(() {
          message.add({
            "text": textEditingController.text,
            "sender": true,
            "image": null,
            "hasImage": false,
          });
        });

        Gemini gemini = Gemini.instance;
        gemini.text(textEditingController.text).then((value) {
          setState(() {
            message.add({
              "text": value?.output ?? "لا يوجد رد",
              "sender": false,
              "image": null,
              "hasImage": false,
            });
          });
        });
      }
    }

    setState(() {
      textEditingController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.primary, size: 30),
        title: Shimmer.fromColors(
          baseColor: Colors.blue,
          highlightColor: AppColor.red,
          child:  Text(
            logo,
            style: AppTextStyle.size24,
          ),
        ),
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height:  20.h),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView.builder(
                itemBuilder: (context, index) => Message(
                  sender: message[index]["sender"],
                  text: message[index]["text"],
                  hasImage: message[index]["hasImage"],
                  image: message[index]["image"],
                ),
                itemCount: message.length,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
            child: Row(
              children: [
                const SizedBox(width: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.70,
                  height: 40,
                  child: TextFormField(
                    controller: textEditingController,
                    cursorColor: Colors.transparent,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      contentPadding: const EdgeInsets.all(8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColor.primary,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    style:AppTextStyle.size18,
                  ),
                ),
                SizedBox(width:  8.w),
                GestureDetector(
                  onTap: () => add(),
                  child: const Icon(
                    Icons.send,
                    color: AppColor.primary,
                    size: 38,
                  ),
                ),
                SizedBox(width:  5.h),
                GestureDetector(
                  onTap: () => openGallery(),
                  child: const Icon(
                    Icons.add_photo_alternate,
                    color: AppColor.primary,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:  8.h),
        ],
      ),
    );
  }
}

class Message extends StatelessWidget {
  final bool sender;
  final bool hasImage;
  final String text;
  final File? image;

  const Message({
    super.key,
    required this.sender,
    required this.text,
    required this.hasImage,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: sender ? TextDirection.rtl : TextDirection.ltr,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          width: 300,
          child: Column(
            crossAxisAlignment:
            sender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (sender && hasImage)
                Container(
                  height: 200.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    image: image != null
                        ? DecorationImage(
                      image: FileImage(image!),
                      fit: BoxFit.fill,
                    )
                        : null,
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
              SizedBox(height:  8.h),
              Container(
                constraints: BoxConstraints(maxWidth: sender ? 250 : 400),
                decoration: BoxDecoration(
                  color: sender
                      ?  AppColor.lightGray
                      : AppColor.primary,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                padding:  EdgeInsets.all(8.0.r),
                child: Text(
                  text,
                  textAlign: TextAlign.start,
                  style: AppTextStyle.size18.copyWith(
                      color: AppColor.white
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
