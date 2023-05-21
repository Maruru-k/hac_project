import 'package:flutter/material.dart';
import 'package:hac_project/theme/tdp_colors.dart';
import 'package:hac_project/theme/tdp_text_field.dart';
import 'package:hac_project/theme/tdp_text_styles.dart';
import 'package:hac_project/widgets/tdp_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class WriteMessageScreen extends StatefulWidget {
  const WriteMessageScreen({Key? key}) : super(key: key);

  @override
  State<WriteMessageScreen> createState() => _WriteMessageScreenState();
}

class _WriteMessageScreenState extends State<WriteMessageScreen> {
  List<String> images = [];
  double height = 56;
  bool isFocused = false;

  void selectImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      images.add(image.name);
      setState(() {
        height = 129 * (images.length ~/ 4 + 1);
      });
    }
  }

  void deleteImage(int index) async {
    images.removeAt(index);
    setState(() {
      height = 129 / (images.length ~/ 4 + 1);
      if (images.isEmpty) height = 56;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(
          top: 30,
          left: 16,
          right: 16,
          bottom: 50,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Новое обращение",
                style: TdpTextStyle.title4(TdpColors.black),
              ),
              const SizedBox(height: 32),
              Text(
                "Тема",
                style: TdpTextStyle.standard(TdpColors.black),
              ),
              const SizedBox(height: 16),
              const TdpTextField(),
              const SizedBox(height: 20),
              Text(
                "Комментарий",
                style: TdpTextStyle.standard(TdpColors.black),
              ),
              const SizedBox(height: 16),
              const TdpTextField(
                linesCount: 10,
              ),
              const SizedBox(height: 20),
              Text(
                "Фото",
                style: TdpTextStyle.standard(TdpColors.black),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: selectImage,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  color: TdpColors.blue,
                  radius: const Radius.circular(12),
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    child: SizedBox(
                      height: height,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.attach_file_outlined,
                            color: TdpColors.blue,
                          ),
                          if (images.isNotEmpty)
                            Flexible(
                              child: GridView.builder(
                                itemCount: images.length,
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                ),
                                itemBuilder: (context, index) => InkWell(
                                  onHover: (value) {
                                    setState(() {
                                      isFocused = value;
                                    });
                                  },
                                  onTap: () => deleteImage(index),
                                  child: Stack(children: [
                                    Image.asset(images[index]),
                                    if (isFocused)
                                      Icon(
                                        Icons.close,
                                        size: 100,
                                        color: TdpColors.grey.withOpacity(0.4),
                                      ),
                                  ]),
                                ),
                              ),
                            ),
                          Text(
                            "Прикрепить файл",
                            style: TdpTextStyle.small(TdpColors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TdpButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WriteMessageScreen(),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Написать  обращение",
                      style: TdpTextStyle.standard(TdpColors.white),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward_outlined,
                      color: TdpColors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
