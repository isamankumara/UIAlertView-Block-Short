# UIAlertView-Block-Short

This Category will create for UIAlertView and this will help to create UIAlertView with one line. Users have few options.
 
## UIAlertView with block

No need to use delegate methods anymore. User can create UIAlertView with Block. When users pass parameters they have to pass buttons in the way of an array. The button index will come with block.

```objective-c

[UIAlertView showAlertWithTitle:@"title" message:@"this is message" cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"button 1", @"button 2"] tapBlock:^(UIAlertView *alertView , NSInteger buttonIndex) {
       NSLog(@"tag -> %d", (int)buttonIndex);
   }];

```

## Show Message with Title

User can pass message and title. No need to write more codes. Only one line.

```objective-c

[UIAlertView showMessage:@"You are done!" title:@"Info"];

```


## Show Message without title

User can pass message with no title.

```objective-c

[UIAlertView showMessage:@"You are done!"];

```


## Show Message with error title

When the user passes error messages the title will be displayed as error

```objective-c

[UIAlertView showErrorMessage:@"Invalid email address"];

```


## License

This is available under the MIT license. See the LICENSE file for more info.
