//
//  UIAlertView+Block+Short.h
//  Projects
//
//  Created by Saman Kumara on 4/20/15.
//  Copyright (c) 2015 Saman Kumara. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Block_Short)

/**
 *  This class method can be used to create alerts to show errors. When there is an error, the Ulalertview title will be displayed as error.
 *
 *  @param error the error message that user want to show
 */
+(void)showErrorMessage:(NSString *)error;

/**
 *  This class method can be used to create alerts to show messages. No title on the alertview.
 *
 *  @param message the message that user want to show
 */
+(void)showMessage:(NSString *)message;

/**
 *  This class method can be use to create alert to show message with title. User can pass title and message as a parameter.
 *
 *  @param message the message that user want to show
 *  @param title   the title that user want to show on the UIAlertView
 */
+(void)showMessage:(NSString *)message title:(NSString *)title;


/**
 *  This is same like UIAlertView method. No need to write any delegate methods. The response will come in to the block. Then tapped button index will comes on the block
 *
 *  @param title             the title on the UIAlertView
 *  @param message           the message on the UIAlertView
 *  @param cancelButtonTitle the cancel button title
 *  @param otherButtonTitles the other buttons need to pass as an array
 *  @param block             the block when user tap on button
 */
+(void)showAlertWithTitle:(NSString *)title message:(NSString *) message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles tapBlock:(void (^)(UIAlertView *alertView , NSInteger buttonIndex))block;

@end
