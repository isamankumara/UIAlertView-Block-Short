//
//  UIAlertView+Block+Short.m
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
#import <objc/runtime.h>
#import "UIAlertView+Block+Short.h"


@interface AlertHandler : NSObject
@property (nonatomic , copy) void (^tapBlock)(UIAlertView *alertView , NSInteger buttonIndex);
@end

@implementation AlertHandler

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.tapBlock) {
        self.tapBlock(alertView,buttonIndex);
    }
}

@end


static const char KAlertHandler;
@implementation UIAlertView (Block_Short)

+(void)showErrorMessage:(NSString *)error{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:error delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];

}

+(void)showMessage:(NSString *)message{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];

}

+(void)showMessage:(NSString *)message title:(NSString *)title{
     UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
}

+(void)showAlertWithTitle:(NSString *)title message:(NSString *) message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles tapBlock:(void (^)(UIAlertView *alertView , NSInteger buttonIndex))block{
    
    AlertHandler *alertHandler = [[AlertHandler alloc]init];
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:alertHandler cancelButtonTitle:cancelButtonTitle otherButtonTitles: nil];
    for (NSString * title in otherButtonTitles) {
        [alertView addButtonWithTitle:title];
    }
    alertHandler.tapBlock = block;
    alertView.delegate = alertHandler;
    objc_setAssociatedObject(self, &KAlertHandler, alertHandler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [alertView show];
    
}


@end
