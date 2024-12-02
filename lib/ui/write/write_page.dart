import 'package:flutter/material.dart';

class WritePage extends StatefulWidget {
  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  //제목, 작성자, 내용
  TextEditingController titleController = TextEditingController();
  TextEditingController writeController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    writeController.dispose();
    contentController.dispose();
    super.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                final result = formKey.currentState?.validate() ?? false;
              },
              child: Container(
                width: 50,
                height: 50,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  '완료',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                TextFormField(
                  controller: writeController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(hintText: '작성자'),
                  validator: (value) {
                    //문자열 앞뒤로공백제거
                    if (value?.trim().isEmpty ?? true) {
                      return '작성자를 입력해주세요.';
                    }
                    //유효성 검사 성공
                    return null;
                  },
                ),
                TextFormField(
                  controller: titleController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(hintText: '제목'),
                  validator: (value) {
                    //문자열 앞뒤로공백제거
                    if (value?.trim().isEmpty ?? true) {
                      return '제목를 입력해주세요.';
                    }
                    //유효성 검사 성공
                    return null;
                  },
                ),
                SizedBox(
                  height: 200,
                  child: TextFormField(
                    expands: true, //반드시 크기를 늘릴려면 정 필요하다.
                    controller: contentController,
                    maxLines: null, //반드시 null로 할당
                    textInputAction: TextInputAction.newline,
                    decoration: InputDecoration(hintText: '상세내용'),
                    validator: (value) {
                      //문자열 앞뒤로공백제거
                      if (value?.trim().isEmpty ?? true) {
                        return '상세내용을 입력해주세요.';
                      }
                      //유효성 검사 성공
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey,
                    child: Icon(Icons.image),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
