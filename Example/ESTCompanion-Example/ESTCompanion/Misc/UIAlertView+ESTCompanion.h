//
// Created by Jonathon Hibbard on 6/8/14.
// Copyright (c) 2014 estcompanion. All rights reserved.
//

typedef void (^errorAlertCancelBtnCompletion)(void);
typedef void (^errorAlertOtherBtnCompletion)(void);


@interface UIAlertView (ESTCompanion)

/**
 * ( Immediately ) Shows an UIAlertView having a title of "Error" and a message being [error description] for the NSError passed in.
 */
+(void)showAlertWithError:(NSError *)error delegate:(id)delegate cancelButtonTitle:(NSString *)cancelBtnTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;

/**
 * Same as the above, except with the following differences:
 *    1) The delegate of the UIAlertView will be AlertViewHelper
 *    2) The tap "action" for the cancel button and/or any of the "Other" buttons will be handled via completion callback blocks.
 */
+(void)showAlertWithError:(NSError *)error cancelBtnCompletion:(errorAlertCancelBtnCompletion)cancelBlock cancelButtonTitle:(NSString *)cancelBtnTitle otherBtnCompletion:(errorAlertOtherBtnCompletion)otherBlock otherButtonTitles:(NSString *)otherButtonTitles, ...;

/**
 * Both of these methods are the same as their counterparts above, except the title/message is defined manually via the call to them.
 */
+(void)showAlertWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelBtnTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;
+(void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelBtnCompletion:(errorAlertCancelBtnCompletion)cancelBlock cancelButtonTitle:(NSString *)cancelBtnTitle otherBtnCompletion:(errorAlertOtherBtnCompletion)otherBlock otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end


/**
 * Just a Dummy object to be the way for which we handle completion blocks of a UIAlertView.
 * May not be the greatest way to achieve this, but I'm lazy and just wanted an easy way...
 */
@interface AlertViewHelper : NSObject <UIAlertViewDelegate>

-(instancetype)initWithCancelBtnCompletion:(errorAlertCancelBtnCompletion)cancelBlock otherBtnCompletion:(errorAlertOtherBtnCompletion)otherBtnCompletion;

-(void)alertViewCancel:(UIAlertView *)alertView;
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end