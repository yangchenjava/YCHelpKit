//
//  YCChineseCalendar.h
//  YCHelpKit
//
//  Created by yangc on 16-2-10.
//  Copyright (c) 2016年 yangc. All rights reserved.
//

#import <Foundation/Foundation.h>

static int const START_YEAR = 1901;
static int const END_YEAR = 2050;

@interface YCChineseCalendar : NSObject

+ (NSString *)chineseAnimalNameWithChineseYear:(NSInteger)chineseYear;
+ (NSString *)chineseYearNameWithChineseYear:(NSInteger)chineseYear;
+ (NSString *)chineseMonthNameWithChineseMonth:(NSInteger)chineseMonth;
+ (NSString *)chineseDayNameWithChineseDay:(NSInteger)chineseDay;
+ (NSString *)chineseTermNameWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

+ (NSString *)weekNameWithWeek:(NSInteger)week;
+ (NSString *)festivalNameWithDate:(NSString *)date;

@end
