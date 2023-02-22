# textfield_tags

This widget allows you to create a textfield that takes in Textfield values and display the values as tags. The tags can also be customized to your own preference. The widget also takes in a controller that can also be customized by extending it into your own custom controller and inheriting its functionalities.  

## Environment

`sdk: ">=2.12.0 <3.0.0"`

`flutter: ">=1.17.0"`

## Installation

```yaml 
  dependencies:
    text_field:
        git:
            url: https://github.com/ferryfer14/text_field.git
            ref: main # branch name
```

`$ flutter pub get`

## Getting Started

``` dart
    CustomTextField(
        cursorColor: primaryColor,
        label: AppLocalizations.of(context)!.username,
        fontSizeLabel: 16,
        hint: '',
        fontSizeInput: 14,
        info: AppLocalizations.of(context)!.info_username,
        fontSizeInfo: 12,
        colorInfo:  secondaryColor,
        colorInput: inputColor,
        colorBorder: secondaryColor,
        colorFocus: primaryColor,
        onChanged: (val) {
        },
        validator: (val) {
            if (val!.isEmpty) {
                return AppLocalizations.of(context)!
                .username_cant_empty;
            }
        },
    ),
```
### Visual Samples For Above Examples

For Username<br/>
<img src="https://raw.githubusercontent.com/ferryfer14/text_field/main/assets/username.png" width=250><br/>

For Username on Focus<br/>
<img src="https://raw.githubusercontent.com/ferryfer14/text_field/main/assets/username_onfocus.png" width=250><br/>

For Username on error<br/>
<img src="https://raw.githubusercontent.com/ferryfer14/text_field/main/assets/username_onerror.png" width=250><br/>

For Password<br/>
<img src="https://raw.githubusercontent.com/ferryfer14/text_field/main/assets/password.png" width=250><br/>

For Password on Show password<br/>
<img src="https://raw.githubusercontent.com/ferryfer14/text_field/main/assets/password_onshow.png" width=250><br/>

For Phone Number<br/>
<img src="https://raw.githubusercontent.com/ferryfer14/text_field/main/assets/phone.png" width=250><br/>