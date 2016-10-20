//
//  StringManipulation.m
//  String manipulation
//
//  Created by 谢泽锋 on 16/1/11.
//  Copyright © 2016年 xiezefeng. All rights reserved.
//

#import "StringVerify.h"

@implementation StringVerify
/**
 * 校验是否  手机号码
 */
+(BOOL)VerifyPhoneNumber:(NSString*)phone
{
    //目前只效验前2位数。
    NSString *MOBILEFORMAT = @"^1(3|5|8|7)\\d{9}$";
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
//    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
//    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
//    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189（181与182？目前只效验前3位）
     22         */
//    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
//    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
//    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
//    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
//    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
//    if (([regextestmobile evaluateWithObject:phone] == YES)
//        || ([regextestcm evaluateWithObject:phone] == YES)
//        || ([regextestct evaluateWithObject:phone] == YES)
//        || ([regextestcu evaluateWithObject:phone] == YES))
//    {
//        return YES;
//    }
    
    NSPredicate *regextestMOBILE = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",MOBILEFORMAT];
    if ([regextestMOBILE evaluateWithObject:phone]) {
        return YES;
    }
    else
    {
        return NO;
    }
}
/**
 * 校验是否  金额
 */
+(BOOL)VerifyMoney:(NSString*)money
{
    NSString *regex = @"^[0-9]+(.[0-9]{2})?$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:money];
    if (!isMatch) {
        return NO;//输入金额错误
    }
    return YES;
}
/**
 * 校验是否   邮箱
 */
+ (BOOL)VerifyEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
/**
 * 校验是否   身份证
 */
+ (BOOL)VerifyIdentityCard:(NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}
/**
 * 校验是否   全中文
 */
+  (BOOL)VerifyChinese:(NSString *)Chinese;
{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:Chinese];
}
/**
 * 校验是否是 车牌号
 */
+ (BOOL) VerifyCarType:(NSString *)CarType
{
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
    return [carTest evaluateWithObject:CarType];
}
/**
 * 校验 纯数字
 */
+(BOOL)VerifyInt:(NSString*)IntString
{
    NSScanner* scan = [NSScanner scannerWithString:IntString];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}
/**
 * 校验 中文＋数字＋字母
 */
+(BOOL)VerifyNoSpecialSymbols:(NSString*)string
{
    NSString *regex = @"[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if(![pred evaluateWithObject:string])
    {
        return NO;
    }
    return YES;
}
+ (BOOL)VerifyNumAndChar:(NSString*)NumAndChar
{
    NSString *str = @"1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:str];
    NSArray *array = [NumAndChar componentsSeparatedByCharactersInSet:[set invertedSet]];
    if(array.count>1)
    {
        return NO;
    }
    return YES;
}
+ (BOOL)VerifyChar:(NSString*)Char
{
    NSString *str = @"1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:str];
    NSArray *array = [Char componentsSeparatedByCharactersInSet:[set invertedSet]];
    if(array.count>1)
    {
        return NO;
    }
    return YES;
    
}

@end
