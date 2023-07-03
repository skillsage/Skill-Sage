part of skillsage_widgets;

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword, isEmail, isDate;
  final int? maxLine;
  final Icon? leadingIcon;
  const CustomTextField({
    super.key,
    this.hintText,
    required this.controller,
    this.isPassword = false,
    this.isEmail = false,
    this.isDate = false,
    this.maxLine = 1,
    this.leadingIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme.customTextTheme(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: TextFormField(
        keyboardType: widget.isDate
            ? TextInputType.datetime
            : widget.isEmail
                ? TextInputType.emailAddress
                : TextInputType.text,
        readOnly: widget.isDate,
        onTap: widget.isDate
            ? () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  setState(() {
                    widget.controller!.text = formattedDate;
                  });
                }
              }
            : null,
        style: textTheme.bodySmall,
        controller: widget.controller,
        enabled: true,
        obscureText: widget.isPassword && obscurePassword,
        maxLines: widget.maxLine,
        validator: widget.isPassword
            ? (value) {
                if (value == null || value.trim() == "" || value.length < 6) {
                  return "${widget.hintText} must be more than 5 characters";
                }
                return null;
              }
            : widget.isEmail
                ? (value) {
                    if (value == null || value.trim() == "") {
                      return "Please enter email address";
                    }
                    if (!emailREgex.hasMatch(value)) {
                      return "Please enter a valid Email";
                    }
                    return null;
                  }
                : (value) {
                    if (value == null || value.trim() == "") {
                      return "Enter a ${widget.hintText}";
                    }
                    if (value.length <= 3) {
                      return "${widget.hintText} must be more than 3 Characters";
                    }
                    return null;
                  },
        decoration: InputDecoration(
          filled: true,
          fillColor: AppTheme.appTheme(context).primary1,
          hintText: widget.hintText,
          hintStyle:
              CustomTextTheme.customTextTheme(context).textTheme.bodySmall,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () => {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        })
                      },
                  icon: Icon(
                    obscurePassword
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                    size: 18,
                  ))
              : null,
          prefixIcon: widget.leadingIcon,
        ),
      ),
    );
  }
}
