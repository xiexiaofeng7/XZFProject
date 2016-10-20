//
//  StringManipulation.h
//  String manipulation
//
//  Created by 谢泽锋 on 16/1/11.
//  Copyright © 2016年 xiezefeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringVerify : NSString
/**
 * 校验是否  手机号码
 */
+(BOOL)VerifyPhoneNumber:(NSString*)phoneNumber;
/**
 * 校验是否  金额
 */
+(BOOL)VerifyMoney:(NSString*)money;
/**
 * 校验是否   邮箱
 */
+ (BOOL)VerifyEmail:(NSString *)email;
/**
 * 校验是否   身份证
 */
+ (BOOL)VerifyIdentityCard:(NSString *)identityCard;
/**
 * 校验是否   全中文
 */
+ (BOOL)VerifyChinese:(NSString *)Chinese;
/**
 * 校验是否 车牌号
 */
+ (BOOL)VerifyCarType:(NSString *)CarType;
/**
 * 校验 中文＋数字＋字母
 */
+(BOOL)VerifyNoSpecialSymbols:(NSString*)string;
/**
 * 校验 纯数字
 */
+ (BOOL)VerifyInt:(NSString*)IntString;
/**
 * 校验 数字＋字母
 */
+ (BOOL)VerifyNumAndChar:(NSString*)NumAndChar;
/**
 * 校验 纯字母
 */
+ (BOOL)VerifyChar:(NSString*)Char;
@end
