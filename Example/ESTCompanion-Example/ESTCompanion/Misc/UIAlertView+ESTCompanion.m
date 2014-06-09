//
// Created by Jonathon Hibbard on 6/8/14.
// Copyright (c) 2014 estcompanion. All rights reserved.
//

#import "UIAlertView+ESTCompanion.h"

@interface AlertViewHelper ()

@property (nonatomic, copy) errorAlertCancelBtnCompletion cancelBlock;
@property (nonatomic, copy) errorAlertOtherBtnCompletion otherBlock;

@end

@implementation AlertViewHelper

-(instancetype)initWithCancelBtnCompletion:(errorAlertCancelBtnCompletion)cancelBlock otherBtnCompletion:(errorAlertOtherBtnCompletion)otherBtnCompletion {

    self = [super init];
    if( !self ) return nil;

    _cancelBlock = cancelBlock;
    _otherBlock = otherBtnCompletion;

    return self;
}

-(void)alertViewCancel:(UIAlertView *)alertView {
    if( self.cancelBlock != nil ) self.cancelBlock();

    alertView.delegate = nil;
    self.cancelBlock = nil;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if( buttonIndex > 0 && self.otherBlock != nil ) self.otherBlock();

    alertView.delegate = nil;
    self.otherBlock = nil;
}

@end


@implementation UIAlertView (ESTCompanion)

+(void)showAlertWithError:(NSError *)error delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelBtnTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION {
    NSString *title = @"Error";
    NSString *message = [error description];

    [[self class] showAlertWithTitle:title
                             message:message
                            delegate:delegate
                   cancelButtonTitle:cancelBtnTitle
                   otherButtonTitles:otherButtonTitles, nil];
}

+(void)showAlertWithError:(NSError *)error cancelBtnCompletion:(errorAlertCancelBtnCompletion)cancelBlock cancelButtonTitle:(NSString *)cancelBtnTitle otherBtnCompletion:(errorAlertOtherBtnCompletion)otherBlock otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION {

    NSString *title = @"Error";
    NSString *message = [error description];

    [[self class] showAlertWithTitle:title
                             message:message
                 cancelBtnCompletion:cancelBlock
                   cancelButtonTitle:cancelBtnTitle
                  otherBtnCompletion:otherBlock
                   otherButtonTitles:otherButtonTitles, nil];
}


+(void)showAlertWithTitle:(NSString *)title message:(NSString *)message delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelBtnTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION {

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:delegate
                                          cancelButtonTitle:cancelBtnTitle
                                          otherButtonTitles:otherButtonTitles, nil];
    [alert show];
}

+(void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelBtnCompletion:(errorAlertCancelBtnCompletion)cancelBlock cancelButtonTitle:(NSString *)cancelBtnTitle otherBtnCompletion:(errorAlertOtherBtnCompletion)otherBlock otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION {

    AlertViewHelper *alertViewHelper = [[AlertViewHelper alloc] initWithCancelBtnCompletion:cancelBlock otherBtnCompletion:otherBlock];

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:alertViewHelper
                                          cancelButtonTitle:cancelBtnTitle
                                          otherButtonTitles:otherButtonTitles, nil];
    [alert show];
}
@end