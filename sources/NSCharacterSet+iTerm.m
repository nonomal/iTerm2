//
//  NSCharacterSet+iTerm.m
//  iTerm2
//
//  Created by George Nachman on 3/29/15.
//
//

#import "NSCharacterSet+iTerm.h"
#import "iTermAdvancedSettingsModel.h"
#import "NSArray+iTerm.h"
#import "NSStringITerm.h"

unichar iTermMinimumDefaultEmojiPresentationCodePoint = 0x2300;

@implementation NSCharacterSet (iTerm)
// Ranges are generated list list_to_range.py and range_to_range.py scripts in the tools folder.

// http://unicode.org/reports/tr36/idn-chars.html
+ (instancetype)idnCharacters {
    static dispatch_once_t onceToken;
    static NSCharacterSet *idnCharacters;
    dispatch_once(&onceToken, ^{
        NSMutableCharacterSet *set = [[NSMutableCharacterSet alloc] init];
        [set addCharactersInRange:NSMakeRange(0x61, 1)];
        [set addCharactersInRange:NSMakeRange(0x27, 1)];
        [set addCharactersInRange:NSMakeRange(0x2d, 2)];
        [set addCharactersInRange:NSMakeRange(0x30, 11)];
        [set addCharactersInRange:NSMakeRange(0x41, 26)];
        [set addCharactersInRange:NSMakeRange(0x62, 25)];
        [set addCharactersInRange:NSMakeRange(0xa1, 7)];
        [set addCharactersInRange:NSMakeRange(0xa9, 6)];
        [set addCharactersInRange:NSMakeRange(0xb0, 4)];
        [set addCharactersInRange:NSMakeRange(0xb5, 3)];
        [set addCharactersInRange:NSMakeRange(0xb9, 360)];
        [set addCharactersInRange:NSMakeRange(0x222, 18)];
        [set addCharactersInRange:NSMakeRange(0x250, 94)];
        [set addCharactersInRange:NSMakeRange(0x2b0, 40)];
        [set addCharactersInRange:NSMakeRange(0x2de, 114)];
        [set addCharactersInRange:NSMakeRange(0x360, 16)];
        [set addCharactersInRange:NSMakeRange(0x374, 2)];
        [set addCharactersInRange:NSMakeRange(0x386, 5)];
        [set addCharactersInRange:NSMakeRange(0x38c, 1)];
        [set addCharactersInRange:NSMakeRange(0x38e, 20)];
        [set addCharactersInRange:NSMakeRange(0x3a3, 44)];
        [set addCharactersInRange:NSMakeRange(0x3d0, 39)];
        [set addCharactersInRange:NSMakeRange(0x400, 135)];
        [set addCharactersInRange:NSMakeRange(0x488, 71)];
        [set addCharactersInRange:NSMakeRange(0x4d0, 38)];
        [set addCharactersInRange:NSMakeRange(0x4f8, 2)];
        [set addCharactersInRange:NSMakeRange(0x500, 16)];
        [set addCharactersInRange:NSMakeRange(0x531, 38)];
        [set addCharactersInRange:NSMakeRange(0x559, 7)];
        [set addCharactersInRange:NSMakeRange(0x561, 39)];
        [set addCharactersInRange:NSMakeRange(0x589, 2)];
        [set addCharactersInRange:NSMakeRange(0x591, 17)];
        [set addCharactersInRange:NSMakeRange(0x5a3, 23)];
        [set addCharactersInRange:NSMakeRange(0x5bb, 10)];
        [set addCharactersInRange:NSMakeRange(0x5d0, 27)];
        [set addCharactersInRange:NSMakeRange(0x5f0, 5)];
        [set addCharactersInRange:NSMakeRange(0x60c, 1)];
        [set addCharactersInRange:NSMakeRange(0x61b, 1)];
        [set addCharactersInRange:NSMakeRange(0x61f, 1)];
        [set addCharactersInRange:NSMakeRange(0x621, 26)];
        [set addCharactersInRange:NSMakeRange(0x640, 22)];
        [set addCharactersInRange:NSMakeRange(0x660, 125)];
        [set addCharactersInRange:NSMakeRange(0x6de, 16)];
        [set addCharactersInRange:NSMakeRange(0x6f0, 15)];
        [set addCharactersInRange:NSMakeRange(0x700, 14)];
        [set addCharactersInRange:NSMakeRange(0x710, 29)];
        [set addCharactersInRange:NSMakeRange(0x730, 27)];
        [set addCharactersInRange:NSMakeRange(0x780, 50)];
        [set addCharactersInRange:NSMakeRange(0x901, 3)];
        [set addCharactersInRange:NSMakeRange(0x905, 53)];
        [set addCharactersInRange:NSMakeRange(0x93c, 18)];
        [set addCharactersInRange:NSMakeRange(0x950, 5)];
        [set addCharactersInRange:NSMakeRange(0x958, 25)];
        [set addCharactersInRange:NSMakeRange(0x981, 3)];
        [set addCharactersInRange:NSMakeRange(0x985, 8)];
        [set addCharactersInRange:NSMakeRange(0x98f, 2)];
        [set addCharactersInRange:NSMakeRange(0x993, 22)];
        [set addCharactersInRange:NSMakeRange(0x9aa, 7)];
        [set addCharactersInRange:NSMakeRange(0x9b2, 1)];
        [set addCharactersInRange:NSMakeRange(0x9b6, 4)];
        [set addCharactersInRange:NSMakeRange(0x9bc, 1)];
        [set addCharactersInRange:NSMakeRange(0x9be, 7)];
        [set addCharactersInRange:NSMakeRange(0x9c7, 2)];
        [set addCharactersInRange:NSMakeRange(0x9cb, 3)];
        [set addCharactersInRange:NSMakeRange(0x9d7, 1)];
        [set addCharactersInRange:NSMakeRange(0x9dc, 2)];
        [set addCharactersInRange:NSMakeRange(0x9df, 5)];
        [set addCharactersInRange:NSMakeRange(0x9e6, 21)];
        [set addCharactersInRange:NSMakeRange(0xa02, 1)];
        [set addCharactersInRange:NSMakeRange(0xa05, 6)];
        [set addCharactersInRange:NSMakeRange(0xa0f, 2)];
        [set addCharactersInRange:NSMakeRange(0xa13, 22)];
        [set addCharactersInRange:NSMakeRange(0xa2a, 7)];
        [set addCharactersInRange:NSMakeRange(0xa32, 2)];
        [set addCharactersInRange:NSMakeRange(0xa35, 2)];
        [set addCharactersInRange:NSMakeRange(0xa38, 2)];
        [set addCharactersInRange:NSMakeRange(0xa3c, 1)];
        [set addCharactersInRange:NSMakeRange(0xa3e, 5)];
        [set addCharactersInRange:NSMakeRange(0xa47, 2)];
        [set addCharactersInRange:NSMakeRange(0xa4b, 3)];
        [set addCharactersInRange:NSMakeRange(0xa59, 4)];
        [set addCharactersInRange:NSMakeRange(0xa5e, 1)];
        [set addCharactersInRange:NSMakeRange(0xa66, 15)];
        [set addCharactersInRange:NSMakeRange(0xa81, 3)];
        [set addCharactersInRange:NSMakeRange(0xa85, 7)];
        [set addCharactersInRange:NSMakeRange(0xa8d, 1)];
        [set addCharactersInRange:NSMakeRange(0xa8f, 3)];
        [set addCharactersInRange:NSMakeRange(0xa93, 22)];
        [set addCharactersInRange:NSMakeRange(0xaaa, 7)];
        [set addCharactersInRange:NSMakeRange(0xab2, 2)];
        [set addCharactersInRange:NSMakeRange(0xab5, 5)];
        [set addCharactersInRange:NSMakeRange(0xabc, 10)];
        [set addCharactersInRange:NSMakeRange(0xac7, 3)];
        [set addCharactersInRange:NSMakeRange(0xacb, 3)];
        [set addCharactersInRange:NSMakeRange(0xad0, 1)];
        [set addCharactersInRange:NSMakeRange(0xae0, 1)];
        [set addCharactersInRange:NSMakeRange(0xae6, 10)];
        [set addCharactersInRange:NSMakeRange(0xb01, 3)];
        [set addCharactersInRange:NSMakeRange(0xb05, 8)];
        [set addCharactersInRange:NSMakeRange(0xb0f, 2)];
        [set addCharactersInRange:NSMakeRange(0xb13, 22)];
        [set addCharactersInRange:NSMakeRange(0xb2a, 7)];
        [set addCharactersInRange:NSMakeRange(0xb32, 2)];
        [set addCharactersInRange:NSMakeRange(0xb36, 4)];
        [set addCharactersInRange:NSMakeRange(0xb3c, 8)];
        [set addCharactersInRange:NSMakeRange(0xb47, 2)];
        [set addCharactersInRange:NSMakeRange(0xb4b, 3)];
        [set addCharactersInRange:NSMakeRange(0xb56, 2)];
        [set addCharactersInRange:NSMakeRange(0xb5c, 2)];
        [set addCharactersInRange:NSMakeRange(0xb5f, 3)];
        [set addCharactersInRange:NSMakeRange(0xb66, 11)];
        [set addCharactersInRange:NSMakeRange(0xb82, 2)];
        [set addCharactersInRange:NSMakeRange(0xb85, 6)];
        [set addCharactersInRange:NSMakeRange(0xb8e, 3)];
        [set addCharactersInRange:NSMakeRange(0xb92, 4)];
        [set addCharactersInRange:NSMakeRange(0xb99, 2)];
        [set addCharactersInRange:NSMakeRange(0xb9c, 1)];
        [set addCharactersInRange:NSMakeRange(0xb9e, 2)];
        [set addCharactersInRange:NSMakeRange(0xba3, 2)];
        [set addCharactersInRange:NSMakeRange(0xba8, 3)];
        [set addCharactersInRange:NSMakeRange(0xbae, 8)];
        [set addCharactersInRange:NSMakeRange(0xbb7, 3)];
        [set addCharactersInRange:NSMakeRange(0xbbe, 5)];
        [set addCharactersInRange:NSMakeRange(0xbc6, 3)];
        [set addCharactersInRange:NSMakeRange(0xbca, 4)];
        [set addCharactersInRange:NSMakeRange(0xbd7, 1)];
        [set addCharactersInRange:NSMakeRange(0xbe7, 12)];
        [set addCharactersInRange:NSMakeRange(0xc01, 3)];
        [set addCharactersInRange:NSMakeRange(0xc05, 8)];
        [set addCharactersInRange:NSMakeRange(0xc0e, 3)];
        [set addCharactersInRange:NSMakeRange(0xc12, 23)];
        [set addCharactersInRange:NSMakeRange(0xc2a, 10)];
        [set addCharactersInRange:NSMakeRange(0xc35, 5)];
        [set addCharactersInRange:NSMakeRange(0xc3e, 7)];
        [set addCharactersInRange:NSMakeRange(0xc46, 3)];
        [set addCharactersInRange:NSMakeRange(0xc4a, 4)];
        [set addCharactersInRange:NSMakeRange(0xc55, 2)];
        [set addCharactersInRange:NSMakeRange(0xc60, 2)];
        [set addCharactersInRange:NSMakeRange(0xc66, 10)];
        [set addCharactersInRange:NSMakeRange(0xc82, 2)];
        [set addCharactersInRange:NSMakeRange(0xc85, 8)];
        [set addCharactersInRange:NSMakeRange(0xc8e, 3)];
        [set addCharactersInRange:NSMakeRange(0xc92, 23)];
        [set addCharactersInRange:NSMakeRange(0xcaa, 10)];
        [set addCharactersInRange:NSMakeRange(0xcb5, 5)];
        [set addCharactersInRange:NSMakeRange(0xcbe, 7)];
        [set addCharactersInRange:NSMakeRange(0xcc6, 3)];
        [set addCharactersInRange:NSMakeRange(0xcca, 4)];
        [set addCharactersInRange:NSMakeRange(0xcd5, 2)];
        [set addCharactersInRange:NSMakeRange(0xcde, 1)];
        [set addCharactersInRange:NSMakeRange(0xce0, 2)];
        [set addCharactersInRange:NSMakeRange(0xce6, 10)];
        [set addCharactersInRange:NSMakeRange(0xd02, 2)];
        [set addCharactersInRange:NSMakeRange(0xd05, 8)];
        [set addCharactersInRange:NSMakeRange(0xd0e, 3)];
        [set addCharactersInRange:NSMakeRange(0xd12, 23)];
        [set addCharactersInRange:NSMakeRange(0xd2a, 16)];
        [set addCharactersInRange:NSMakeRange(0xd3e, 6)];
        [set addCharactersInRange:NSMakeRange(0xd46, 3)];
        [set addCharactersInRange:NSMakeRange(0xd4a, 4)];
        [set addCharactersInRange:NSMakeRange(0xd57, 1)];
        [set addCharactersInRange:NSMakeRange(0xd60, 2)];
        [set addCharactersInRange:NSMakeRange(0xd66, 10)];
        [set addCharactersInRange:NSMakeRange(0xd82, 2)];
        [set addCharactersInRange:NSMakeRange(0xd85, 18)];
        [set addCharactersInRange:NSMakeRange(0xd9a, 24)];
        [set addCharactersInRange:NSMakeRange(0xdb3, 9)];
        [set addCharactersInRange:NSMakeRange(0xdbd, 1)];
        [set addCharactersInRange:NSMakeRange(0xdc0, 7)];
        [set addCharactersInRange:NSMakeRange(0xdca, 1)];
        [set addCharactersInRange:NSMakeRange(0xdcf, 6)];
        [set addCharactersInRange:NSMakeRange(0xdd6, 1)];
        [set addCharactersInRange:NSMakeRange(0xdd8, 8)];
        [set addCharactersInRange:NSMakeRange(0xdf2, 3)];
        [set addCharactersInRange:NSMakeRange(0xe01, 58)];
        [set addCharactersInRange:NSMakeRange(0xe3f, 29)];
        [set addCharactersInRange:NSMakeRange(0xe81, 2)];
        [set addCharactersInRange:NSMakeRange(0xe84, 1)];
        [set addCharactersInRange:NSMakeRange(0xe87, 2)];
        [set addCharactersInRange:NSMakeRange(0xe8a, 1)];
        [set addCharactersInRange:NSMakeRange(0xe8d, 1)];
        [set addCharactersInRange:NSMakeRange(0xe94, 4)];
        [set addCharactersInRange:NSMakeRange(0xe99, 7)];
        [set addCharactersInRange:NSMakeRange(0xea1, 3)];
        [set addCharactersInRange:NSMakeRange(0xea5, 1)];
        [set addCharactersInRange:NSMakeRange(0xea7, 1)];
        [set addCharactersInRange:NSMakeRange(0xeaa, 2)];
        [set addCharactersInRange:NSMakeRange(0xead, 13)];
        [set addCharactersInRange:NSMakeRange(0xebb, 3)];
        [set addCharactersInRange:NSMakeRange(0xec0, 5)];
        [set addCharactersInRange:NSMakeRange(0xec6, 1)];
        [set addCharactersInRange:NSMakeRange(0xec8, 6)];
        [set addCharactersInRange:NSMakeRange(0xed0, 10)];
        [set addCharactersInRange:NSMakeRange(0xedc, 2)];
        [set addCharactersInRange:NSMakeRange(0xf00, 72)];
        [set addCharactersInRange:NSMakeRange(0xf49, 34)];
        [set addCharactersInRange:NSMakeRange(0xf71, 27)];
        [set addCharactersInRange:NSMakeRange(0xf90, 8)];
        [set addCharactersInRange:NSMakeRange(0xf99, 36)];
        [set addCharactersInRange:NSMakeRange(0xfbe, 15)];
        [set addCharactersInRange:NSMakeRange(0xfcf, 1)];
        [set addCharactersInRange:NSMakeRange(0x1000, 34)];
        [set addCharactersInRange:NSMakeRange(0x1023, 5)];
        [set addCharactersInRange:NSMakeRange(0x1029, 2)];
        [set addCharactersInRange:NSMakeRange(0x102c, 7)];
        [set addCharactersInRange:NSMakeRange(0x1036, 4)];
        [set addCharactersInRange:NSMakeRange(0x1040, 26)];
        [set addCharactersInRange:NSMakeRange(0x10a0, 38)];
        [set addCharactersInRange:NSMakeRange(0x10d0, 41)];
        [set addCharactersInRange:NSMakeRange(0x10fb, 1)];
        [set addCharactersInRange:NSMakeRange(0x1200, 7)];
        [set addCharactersInRange:NSMakeRange(0x1208, 63)];
        [set addCharactersInRange:NSMakeRange(0x1248, 1)];
        [set addCharactersInRange:NSMakeRange(0x124a, 4)];
        [set addCharactersInRange:NSMakeRange(0x1250, 7)];
        [set addCharactersInRange:NSMakeRange(0x1258, 1)];
        [set addCharactersInRange:NSMakeRange(0x125a, 4)];
        [set addCharactersInRange:NSMakeRange(0x1260, 39)];
        [set addCharactersInRange:NSMakeRange(0x1288, 1)];
        [set addCharactersInRange:NSMakeRange(0x128a, 4)];
        [set addCharactersInRange:NSMakeRange(0x1290, 31)];
        [set addCharactersInRange:NSMakeRange(0x12b0, 1)];
        [set addCharactersInRange:NSMakeRange(0x12b2, 4)];
        [set addCharactersInRange:NSMakeRange(0x12b8, 7)];
        [set addCharactersInRange:NSMakeRange(0x12c0, 1)];
        [set addCharactersInRange:NSMakeRange(0x12c2, 4)];
        [set addCharactersInRange:NSMakeRange(0x12c8, 7)];
        [set addCharactersInRange:NSMakeRange(0x12d0, 7)];
        [set addCharactersInRange:NSMakeRange(0x12d8, 23)];
        [set addCharactersInRange:NSMakeRange(0x12f0, 31)];
        [set addCharactersInRange:NSMakeRange(0x1310, 1)];
        [set addCharactersInRange:NSMakeRange(0x1312, 4)];
        [set addCharactersInRange:NSMakeRange(0x1318, 7)];
        [set addCharactersInRange:NSMakeRange(0x1320, 39)];
        [set addCharactersInRange:NSMakeRange(0x1348, 19)];
        [set addCharactersInRange:NSMakeRange(0x1361, 28)];
        [set addCharactersInRange:NSMakeRange(0x13a0, 85)];
        [set addCharactersInRange:NSMakeRange(0x1401, 630)];
        [set addCharactersInRange:NSMakeRange(0x1681, 28)];
        [set addCharactersInRange:NSMakeRange(0x16a0, 81)];
        [set addCharactersInRange:NSMakeRange(0x1700, 13)];
        [set addCharactersInRange:NSMakeRange(0x170e, 7)];
        [set addCharactersInRange:NSMakeRange(0x1720, 23)];
        [set addCharactersInRange:NSMakeRange(0x1740, 20)];
        [set addCharactersInRange:NSMakeRange(0x1760, 13)];
        [set addCharactersInRange:NSMakeRange(0x176e, 3)];
        [set addCharactersInRange:NSMakeRange(0x1772, 2)];
        [set addCharactersInRange:NSMakeRange(0x1780, 93)];
        [set addCharactersInRange:NSMakeRange(0x17e0, 10)];
        [set addCharactersInRange:NSMakeRange(0x1800, 14)];
        [set addCharactersInRange:NSMakeRange(0x1810, 10)];
        [set addCharactersInRange:NSMakeRange(0x1820, 88)];
        [set addCharactersInRange:NSMakeRange(0x1880, 42)];
        [set addCharactersInRange:NSMakeRange(0x1e00, 156)];
        [set addCharactersInRange:NSMakeRange(0x1ea0, 90)];
        [set addCharactersInRange:NSMakeRange(0x1f00, 22)];
        [set addCharactersInRange:NSMakeRange(0x1f18, 6)];
        [set addCharactersInRange:NSMakeRange(0x1f20, 38)];
        [set addCharactersInRange:NSMakeRange(0x1f48, 6)];
        [set addCharactersInRange:NSMakeRange(0x1f50, 8)];
        [set addCharactersInRange:NSMakeRange(0x1f59, 1)];
        [set addCharactersInRange:NSMakeRange(0x1f5b, 1)];
        [set addCharactersInRange:NSMakeRange(0x1f5d, 1)];
        [set addCharactersInRange:NSMakeRange(0x1f5f, 31)];
        [set addCharactersInRange:NSMakeRange(0x1f80, 53)];
        [set addCharactersInRange:NSMakeRange(0x1fb6, 7)];
        [set addCharactersInRange:NSMakeRange(0x1fbe, 1)];
        [set addCharactersInRange:NSMakeRange(0x1fc2, 3)];
        [set addCharactersInRange:NSMakeRange(0x1fc6, 7)];
        [set addCharactersInRange:NSMakeRange(0x1fd0, 4)];
        [set addCharactersInRange:NSMakeRange(0x1fd6, 6)];
        [set addCharactersInRange:NSMakeRange(0x1fe0, 13)];
        [set addCharactersInRange:NSMakeRange(0x1ff2, 3)];
        [set addCharactersInRange:NSMakeRange(0x1ff6, 7)];
        [set addCharactersInRange:NSMakeRange(0x200b, 3)];
        [set addCharactersInRange:NSMakeRange(0x2010, 7)];
        [set addCharactersInRange:NSMakeRange(0x2018, 12)];
        [set addCharactersInRange:NSMakeRange(0x2027, 1)];
        [set addCharactersInRange:NSMakeRange(0x2030, 12)];
        [set addCharactersInRange:NSMakeRange(0x203d, 1)];
        [set addCharactersInRange:NSMakeRange(0x203f, 8)];
        [set addCharactersInRange:NSMakeRange(0x204a, 9)];
        [set addCharactersInRange:NSMakeRange(0x2057, 1)];
        [set addCharactersInRange:NSMakeRange(0x2060, 1)];
        [set addCharactersInRange:NSMakeRange(0x2070, 2)];
        [set addCharactersInRange:NSMakeRange(0x2074, 6)];
        [set addCharactersInRange:NSMakeRange(0x207b, 1)];
        [set addCharactersInRange:NSMakeRange(0x207f, 11)];
        [set addCharactersInRange:NSMakeRange(0x208b, 1)];
        [set addCharactersInRange:NSMakeRange(0x20a0, 18)];
        [set addCharactersInRange:NSMakeRange(0x20d0, 27)];
        [set addCharactersInRange:NSMakeRange(0x2100, 59)];
        [set addCharactersInRange:NSMakeRange(0x213d, 15)];
        [set addCharactersInRange:NSMakeRange(0x2153, 49)];
        [set addCharactersInRange:NSMakeRange(0x2190, 575)];
        [set addCharactersInRange:NSMakeRange(0x2400, 39)];
        [set addCharactersInRange:NSMakeRange(0x2440, 11)];
        [set addCharactersInRange:NSMakeRange(0x2460, 20)];
        [set addCharactersInRange:NSMakeRange(0x24b6, 73)];
        [set addCharactersInRange:NSMakeRange(0x2500, 276)];
        [set addCharactersInRange:NSMakeRange(0x2616, 2)];
        [set addCharactersInRange:NSMakeRange(0x2619, 101)];
        [set addCharactersInRange:NSMakeRange(0x2680, 10)];
        [set addCharactersInRange:NSMakeRange(0x2701, 4)];
        [set addCharactersInRange:NSMakeRange(0x2706, 4)];
        [set addCharactersInRange:NSMakeRange(0x270c, 28)];
        [set addCharactersInRange:NSMakeRange(0x2729, 35)];
        [set addCharactersInRange:NSMakeRange(0x274d, 1)];
        [set addCharactersInRange:NSMakeRange(0x274f, 4)];
        [set addCharactersInRange:NSMakeRange(0x2756, 1)];
        [set addCharactersInRange:NSMakeRange(0x2758, 7)];
        [set addCharactersInRange:NSMakeRange(0x2761, 52)];
        [set addCharactersInRange:NSMakeRange(0x2798, 24)];
        [set addCharactersInRange:NSMakeRange(0x27b1, 14)];
        [set addCharactersInRange:NSMakeRange(0x27d0, 28)];
        [set addCharactersInRange:NSMakeRange(0x27f0, 644)];
        [set addCharactersInRange:NSMakeRange(0x2a77, 137)];
        [set addCharactersInRange:NSMakeRange(0x2e80, 26)];
        [set addCharactersInRange:NSMakeRange(0x2e9b, 89)];
        [set addCharactersInRange:NSMakeRange(0x3001, 32)];
        [set addCharactersInRange:NSMakeRange(0x302a, 14)];
        [set addCharactersInRange:NSMakeRange(0x303b, 5)];
        [set addCharactersInRange:NSMakeRange(0x3041, 86)];
        [set addCharactersInRange:NSMakeRange(0x3099, 2)];
        [set addCharactersInRange:NSMakeRange(0x309d, 99)];
        [set addCharactersInRange:NSMakeRange(0x3105, 40)];
        [set addCharactersInRange:NSMakeRange(0x3190, 40)];
        [set addCharactersInRange:NSMakeRange(0x31f0, 16)];
        [set addCharactersInRange:NSMakeRange(0x3251, 15)];
        [set addCharactersInRange:NSMakeRange(0x327f, 77)];
        [set addCharactersInRange:NSMakeRange(0x32d0, 47)];
        [set addCharactersInRange:NSMakeRange(0x3300, 119)];
        [set addCharactersInRange:NSMakeRange(0x337b, 71)];
        [set addCharactersInRange:NSMakeRange(0x33c3, 4)];
        [set addCharactersInRange:NSMakeRange(0x33c8, 16)];
        [set addCharactersInRange:NSMakeRange(0x33d9, 5)];
        [set addCharactersInRange:NSMakeRange(0x33e0, 31)];
        [set addCharactersInRange:NSMakeRange(0xa000, 1165)];
        [set addCharactersInRange:NSMakeRange(0xa490, 55)];
        [set addCharactersInRange:NSMakeRange(0xa700, 23)];
        [set addCharactersInRange:NSMakeRange(0xfa10, 3)];
        [set addCharactersInRange:NSMakeRange(0xfa1f, 4)];
        [set addCharactersInRange:NSMakeRange(0xfb00, 7)];
        [set addCharactersInRange:NSMakeRange(0xfb13, 5)];
        [set addCharactersInRange:NSMakeRange(0xfb1e, 1)];
        [set addCharactersInRange:NSMakeRange(0xfb20, 9)];
        [set addCharactersInRange:NSMakeRange(0xfb4f, 99)];
        [set addCharactersInRange:NSMakeRange(0xfbd3, 136)];
        [set addCharactersInRange:NSMakeRange(0xfc64, 44)];
        [set addCharactersInRange:NSMakeRange(0xfc91, 72)];
        [set addCharactersInRange:NSMakeRange(0xfcda, 24)];
        [set addCharactersInRange:NSMakeRange(0xfcf5, 71)];
        [set addCharactersInRange:NSMakeRange(0xfd3e, 2)];
        [set addCharactersInRange:NSMakeRange(0xfd50, 64)];
        [set addCharactersInRange:NSMakeRange(0xfd92, 54)];
        [set addCharactersInRange:NSMakeRange(0xfdf0, 10)];
        [set addCharactersInRange:NSMakeRange(0xfdfc, 1)];
        [set addCharactersInRange:NSMakeRange(0xfe00, 16)];
        [set addCharactersInRange:NSMakeRange(0xfe20, 4)];
        [set addCharactersInRange:NSMakeRange(0xfe31, 2)];
        [set addCharactersInRange:NSMakeRange(0xfe39, 14)];
        [set addCharactersInRange:NSMakeRange(0xfe51, 1)];
        [set addCharactersInRange:NSMakeRange(0xfe58, 1)];
        [set addCharactersInRange:NSMakeRange(0xfe5d, 2)];
        [set addCharactersInRange:NSMakeRange(0xfe73, 1)];
        [set addCharactersInRange:NSMakeRange(0xfe80, 125)];
        [set addCharactersInRange:NSMakeRange(0xfeff, 1)];
        [set addCharactersInRange:NSMakeRange(0xff10, 10)];
        [set addCharactersInRange:NSMakeRange(0xff21, 26)];
        [set addCharactersInRange:NSMakeRange(0xff41, 26)];
        [set addCharactersInRange:NSMakeRange(0xff5f, 65)];
        [set addCharactersInRange:NSMakeRange(0xffe0, 3)];
        [set addCharactersInRange:NSMakeRange(0xffe4, 3)];
        [set addCharactersInRange:NSMakeRange(0xffe8, 7)];
        [set addCharactersInRange:NSMakeRange(0x10300, 31)];
        [set addCharactersInRange:NSMakeRange(0x10320, 4)];
        [set addCharactersInRange:NSMakeRange(0x10330, 27)];
        [set addCharactersInRange:NSMakeRange(0x10400, 38)];
        [set addCharactersInRange:NSMakeRange(0x10428, 38)];
        [set addCharactersInRange:NSMakeRange(0x1d000, 246)];
        [set addCharactersInRange:NSMakeRange(0x1d100, 39)];
        [set addCharactersInRange:NSMakeRange(0x1d12a, 73)];
        [set addCharactersInRange:NSMakeRange(0x1d17b, 99)];
        [set addCharactersInRange:NSMakeRange(0x1d400, 85)];
        [set addCharactersInRange:NSMakeRange(0x1d456, 71)];
        [set addCharactersInRange:NSMakeRange(0x1d49e, 2)];
        [set addCharactersInRange:NSMakeRange(0x1d4a2, 1)];
        [set addCharactersInRange:NSMakeRange(0x1d4a5, 2)];
        [set addCharactersInRange:NSMakeRange(0x1d4a9, 4)];
        [set addCharactersInRange:NSMakeRange(0x1d4ae, 12)];
        [set addCharactersInRange:NSMakeRange(0x1d4bb, 1)];
        [set addCharactersInRange:NSMakeRange(0x1d4bd, 4)];
        [set addCharactersInRange:NSMakeRange(0x1d4c2, 2)];
        [set addCharactersInRange:NSMakeRange(0x1d4c5, 65)];
        [set addCharactersInRange:NSMakeRange(0x1d507, 4)];
        [set addCharactersInRange:NSMakeRange(0x1d50d, 8)];
        [set addCharactersInRange:NSMakeRange(0x1d516, 7)];
        [set addCharactersInRange:NSMakeRange(0x1d51e, 28)];
        [set addCharactersInRange:NSMakeRange(0x1d53b, 4)];
        [set addCharactersInRange:NSMakeRange(0x1d540, 5)];
        [set addCharactersInRange:NSMakeRange(0x1d546, 1)];
        [set addCharactersInRange:NSMakeRange(0x1d54a, 7)];
        [set addCharactersInRange:NSMakeRange(0x1d552, 338)];
        [set addCharactersInRange:NSMakeRange(0x1d6a8, 290)];
        [set addCharactersInRange:NSMakeRange(0x1d7ce, 50)];
        [set addCharactersInRange:NSMakeRange(0x1100, 90)];
        [set addCharactersInRange:NSMakeRange(0x115f, 68)];
        [set addCharactersInRange:NSMakeRange(0x11a8, 82)];
        [set addCharactersInRange:NSMakeRange(0xac00, 11172)];
        [set addCharactersInRange:NSMakeRange(0x3131, 94)];
        [set addCharactersInRange:NSMakeRange(0x3260, 28)];
        [set addCharactersInRange:NSMakeRange(0xffa0, 31)];
        [set addCharactersInRange:NSMakeRange(0xffc2, 6)];
        [set addCharactersInRange:NSMakeRange(0xffca, 6)];
        [set addCharactersInRange:NSMakeRange(0xffd2, 6)];
        [set addCharactersInRange:NSMakeRange(0xffda, 3)];
        [set addCharactersInRange:NSMakeRange(0x3021, 9)];
        [set addCharactersInRange:NSMakeRange(0x3400, 6582)];
        [set addCharactersInRange:NSMakeRange(0x4e00, 20902)];
        [set addCharactersInRange:NSMakeRange(0xfa0e, 2)];
        [set addCharactersInRange:NSMakeRange(0xfa13, 2)];
        [set addCharactersInRange:NSMakeRange(0xfa23, 2)];
        [set addCharactersInRange:NSMakeRange(0xfa27, 3)];
        [set addCharactersInRange:NSMakeRange(0x20000, 42711)];
        [set addCharactersInRange:NSMakeRange(0x2e80, 26)];
        [set addCharactersInRange:NSMakeRange(0x2e9b, 4)];
        [set addCharactersInRange:NSMakeRange(0x2ea0, 83)];
        [set addCharactersInRange:NSMakeRange(0x2f00, 214)];
        [set addCharactersInRange:NSMakeRange(0x3038, 3)];
        [set addCharactersInRange:NSMakeRange(0xf900, 270)];
        [set addCharactersInRange:NSMakeRange(0xfa15, 10)];
        [set addCharactersInRange:NSMakeRange(0xfa25, 2)];
        [set addCharactersInRange:NSMakeRange(0xfa2a, 4)];
        [set addCharactersInRange:NSMakeRange(0xfa30, 59)];
        [set addCharactersInRange:NSMakeRange(0x2f800, 542)];

        idnCharacters = [set copy];
    });
    return idnCharacters;
}

// wget 'https://www.unicode.org/Public/UCD/latest/ucd/EastAsianWidth.txt'
// tools/eastasian.py
+ (instancetype)fullWidthCharacterSetForUnicodeVersion:(NSInteger)version {
    static NSMutableCharacterSet *sFullWidth8;
    static NSMutableCharacterSet *sFullWidth9;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sFullWidth8 = [[NSMutableCharacterSet alloc] init];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x1100, 0x115f - 0x1100 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x11a3, 0x11a7 - 0x11a3 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x11fa, 0x11ff - 0x11fa + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x2329, 0x232a - 0x2329 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x2e80, 0x2e99 - 0x2e80 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x2e9b, 0x2ef3 - 0x2e9b + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x2f00, 0x2fd5 - 0x2f00 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x2ff0, 0x2ffb - 0x2ff0 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x3000, 0x303e - 0x3000 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x3041, 0x3096 - 0x3041 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x3099, 0x30ff - 0x3099 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x3105, 0x312d - 0x3105 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x3131, 0x318e - 0x3131 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x3190, 0x31ba - 0x3190 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x31c0, 0x31e3 - 0x31c0 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x31f0, 0x321e - 0x31f0 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x3220, 0x3247 - 0x3220 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x3250, 0x32fe - 0x3250 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x3300, 0x4dbf - 0x3300 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x4e00, 0xa48c - 0x4e00 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0xa490, 0xa4c6 - 0xa490 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0xa960, 0xa97c - 0xa960 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0xac00, 0xd7a3 - 0xac00 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0xd7b0, 0xd7c6 - 0xd7b0 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0xd7cb, 0xd7fb - 0xd7cb + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0xf900, 0xfaff - 0xf900 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0xfe10, 0xfe19 - 0xfe10 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0xfe30, 0xfe52 - 0xfe30 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0xfe54, 0xfe66 - 0xfe54 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0xfe68, 0xfe6b - 0xfe68 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0xff01, 0xff60 - 0xff01 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0xffe0, 0xffe6 - 0xffe0 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x1b000, 0x1b001 - 0x1b000 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x1f200, 0x1f202 - 0x1f200 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x1f210, 0x1f23a - 0x1f210 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x1f240, 0x1f248 - 0x1f240 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x1f250, 0x1f251 - 0x1f250 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x20000, 0x2fffd - 0x20000 + 1)];
        [sFullWidth8 addCharactersInRange:NSMakeRange(0x30000, 0x3fffd - 0x30000 + 1)];

        sFullWidth9 = [[NSMutableCharacterSet alloc] init];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1100, 96)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x231a, 2)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x2329, 2)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x23e9, 4)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x23f0, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x23f3, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x25fd, 2)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x2614, 2)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x2648, 12)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x267f, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x2693, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x26a1, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x26aa, 2)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x26bd, 2)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x26c4, 2)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x26ce, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x26d4, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x26ea, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x26f2, 2)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x26f5, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x26fa, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x26fd, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x2705, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x270a, 2)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x2728, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x274c, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x274e, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x2753, 3)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x2757, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x2795, 3)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x27b0, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x27bf, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x2b1b, 2)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x2b50, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x2b55, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x2e80, 26)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x2e9b, 89)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x2f00, 214)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x2ff0, 12)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x3000, 63)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x3041, 86)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x3099, 103)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x3105, 43)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x3131, 94)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x3190, 84)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x31f0, 47)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x3220, 40)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x3250, 7024)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x4e00, 22157)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0xa490, 55)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0xa960, 29)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0xac00, 11172)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0xf900, 512)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0xfe10, 10)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0xfe30, 35)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0xfe54, 19)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0xfe68, 4)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0xff01, 96)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0xffe0, 7)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x16fe0, 5)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x16ff0, 2)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x17000, 6136)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x18800, 1238)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x18d00, 9)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1aff0, 4)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1aff5, 7)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1affd, 2)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1b000, 291)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1b132, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1b150, 3)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1b155, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1b164, 4)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1b170, 396)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f004, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f0cf, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f18e, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f191, 10)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f200, 3)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f210, 44)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f240, 9)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f250, 2)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f260, 6)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f300, 33)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f32d, 9)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f337, 70)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f37e, 22)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f3a0, 43)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f3cf, 5)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f3e0, 17)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f3f4, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f3f8, 71)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f440, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f442, 187)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f4ff, 63)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f54b, 4)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f550, 24)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f57a, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f595, 2)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f5a4, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f5fb, 85)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f680, 70)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f6cc, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f6d0, 3)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f6d5, 3)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f6dc, 4)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f6eb, 2)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f6f4, 9)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f7e0, 12)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f7f0, 1)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f90c, 47)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f93c, 10)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1f947, 185)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1fa70, 13)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1fa80, 9)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1fa90, 46)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1fabf, 7)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1face, 14)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1fae0, 9)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x1faf0, 9)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x20000, 65534)];
        [sFullWidth9 addCharactersInRange:NSMakeRange(0x30000, 65534)];    });

    if (version >= 9) {
        return sFullWidth9;
    } else {
        return sFullWidth8;
    }
}

+ (instancetype)ambiguousWidthCharacterSetForUnicodeVersion:(NSInteger)version {
    static NSMutableCharacterSet *sAmbiguousWidth8;
    static NSMutableCharacterSet *sAmbiguousWidth9;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sAmbiguousWidth8 = [[NSMutableCharacterSet alloc] init];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x300, 0x36f - 0x300 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x391, 0x3a1 - 0x391 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x3b1, 0x3c1 - 0x3b1 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x410, 0x44f - 0x410 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2160, 0x216b - 0x2160 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2170, 0x2179 - 0x2170 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2190, 0x2199 - 0x2190 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2460, 0x24e9 - 0x2460 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x24eb, 0x254b - 0x24eb + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2550, 0x2573 - 0x2550 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2580, 0x258f - 0x2580 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x26c4, 0x26cd - 0x26c4 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x26cf, 0x26e1 - 0x26cf + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x26e8, 0x26ff - 0x26e8 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2776, 0x277f - 0x2776 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x3248, 0x324f - 0x3248 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xe000, 0xf8ff - 0xe000 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xfe00, 0xfe0f - 0xfe00 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x1f100, 0x1f10a - 0x1f100 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x1f110, 0x1f12d - 0x1f110 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x1f130, 0x1f169 - 0x1f130 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x1f170, 0x1f19a - 0x1f170 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xe0100, 0xe01ef - 0xe0100 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xf0000, 0xffffd - 0xf0000 + 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x100000, 0x10fffd - 0x100000 + 1)];

        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xa1, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xa4, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xa7, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xa8, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xaa, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xad, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xae, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xb0, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xb1, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xb2, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xb3, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xb4, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xb6, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xb7, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xb8, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xb9, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xba, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xbc, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xbd, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xbe, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xbf, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xc6, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xd0, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xd7, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xd8, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xde, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xdf, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xe0, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xe1, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xe6, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xe8, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xe9, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xea, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xec, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xed, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xf0, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xf2, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xf3, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xf7, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xf8, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xf9, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xfa, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xfc, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xfe, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x101, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x111, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x113, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x11b, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x126, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x127, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x12b, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x131, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x132, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x133, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x138, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x13f, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x140, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x141, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x142, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x144, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x148, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x149, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x14a, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x14b, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x14d, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x152, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x153, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x166, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x167, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x16b, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x1ce, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x1d0, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x1d2, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x1d4, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x1d6, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x1d8, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x1da, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x1dc, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x251, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x261, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2c4, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2c7, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2c9, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2ca, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2cb, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2cd, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2d0, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2d8, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2d9, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2da, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2db, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2dd, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2df, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x3a3, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x3a4, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x3a5, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x3a6, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x3a7, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x3a8, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x3a9, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x3c3, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x3c4, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x3c5, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x3c6, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x3c7, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x3c8, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x3c9, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x401, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x451, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2010, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2013, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2014, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2015, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2016, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2018, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2019, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x201c, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x201d, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2020, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2021, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2022, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2024, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2025, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2026, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2027, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2030, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2032, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2033, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2035, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x203b, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x203e, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2074, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x207f, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2081, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2082, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2083, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2084, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x20ac, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2103, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2105, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2109, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2113, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2116, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2121, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2122, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2126, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x212b, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2153, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2154, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x215b, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x215c, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x215d, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x215e, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2189, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x21b8, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x21b9, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x21d2, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x21d4, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x21e7, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2200, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2202, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2203, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2207, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2208, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x220b, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x220f, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2211, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2215, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x221a, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x221d, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x221e, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x221f, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2220, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2223, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2225, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2227, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2228, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2229, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x222a, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x222b, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x222c, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x222e, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2234, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2235, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2236, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2237, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x223c, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x223d, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2248, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x224c, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2252, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2260, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2261, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2264, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2265, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2266, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2267, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x226a, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x226b, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x226e, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x226f, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2282, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2283, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2286, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2287, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2295, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2299, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x22a5, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x22bf, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2312, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2592, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2593, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2594, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2595, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25a0, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25a1, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25a3, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25a4, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25a5, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25a6, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25a7, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25a8, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25a9, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25b2, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25b3, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25b6, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25b7, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25bc, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25bd, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25c0, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25c1, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25c6, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25c7, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25c8, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25cb, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25ce, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25cf, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25d0, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25d1, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25e2, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25e3, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25e4, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25e5, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x25ef, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2605, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2606, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2609, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x260e, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x260f, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2614, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2615, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x261c, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x261e, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2640, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2642, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2660, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2661, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2663, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2664, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2665, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2667, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2668, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2669, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x266a, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x266c, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x266d, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x266f, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x269e, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x269f, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x26be, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x26bf, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x26e3, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x273d, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2757, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2b55, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2b56, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2b57, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2b58, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0x2b59, 1)];
        [sAmbiguousWidth8 addCharactersInRange:NSMakeRange(0xfffd, 1)];

        sAmbiguousWidth9 = [[NSMutableCharacterSet alloc] init];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xa1, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xa4, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xa7, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xaa, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xad, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xb0, 5)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xb6, 5)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xbc, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xc6, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xd0, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xd7, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xde, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xe6, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xe8, 3)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xec, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xf0, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xf2, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xf7, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xfc, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xfe, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x101, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x111, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x113, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x11b, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x126, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x12b, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x131, 3)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x138, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x13f, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x144, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x148, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x14d, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x152, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x166, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x16b, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x1ce, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x1d0, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x1d2, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x1d4, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x1d6, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x1d8, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x1da, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x1dc, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x251, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x261, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2c4, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2c7, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2c9, 3)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2cd, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2d0, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2d8, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2dd, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2df, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x300, 112)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x391, 17)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x3a3, 7)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x3b1, 17)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x3c3, 7)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x401, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x410, 64)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x451, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2010, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2013, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2018, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x201c, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2020, 3)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2024, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2030, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2032, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2035, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x203b, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x203e, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2074, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x207f, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2081, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x20ac, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2103, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2105, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2109, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2113, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2116, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2121, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2126, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x212b, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2153, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x215b, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2160, 12)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2170, 10)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2189, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2190, 10)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x21b8, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x21d2, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x21d4, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x21e7, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2200, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2202, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2207, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x220b, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x220f, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2211, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2215, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x221a, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x221d, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2223, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2225, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2227, 6)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x222e, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2234, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x223c, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2248, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x224c, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2252, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2260, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2264, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x226a, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x226e, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2282, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2286, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2295, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2299, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x22a5, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x22bf, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2312, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2460, 138)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x24eb, 97)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2550, 36)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2580, 16)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2592, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x25a0, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x25a3, 7)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x25b2, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x25b6, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x25bc, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x25c0, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x25c6, 3)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x25cb, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x25ce, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x25e2, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x25ef, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2605, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2609, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x260e, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x261c, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x261e, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2640, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2642, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2660, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2663, 3)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2667, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x266c, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x266f, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x269e, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x26bf, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x26c6, 8)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x26cf, 5)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x26d5, 13)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x26e3, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x26e8, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x26eb, 7)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x26f4, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x26f6, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x26fb, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x26fe, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x273d, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2776, 10)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x2b56, 4)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x3248, 8)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xe000, 6400)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xfe00, 16)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xfffd, 1)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x1f100, 11)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x1f110, 30)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x1f130, 58)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x1f170, 30)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x1f18f, 2)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x1f19b, 18)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xe0100, 240)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0xf0000, 65534)];
        [sAmbiguousWidth9 addCharactersInRange:NSMakeRange(0x100000, 65534)];
    });

    if (version >= 9) {
        return sAmbiguousWidth9;
    } else {
        return sAmbiguousWidth8;
    }
}

// This was built from Unicode 12's database using the following commands:
// wget ftp://ftp.unicode.org/Public/UNIDATA/UnicodeData.txt
// Prepend this line:
//    code;charname;gc;ccc;bc;cdm;ddv;dv;nv;m;u1n;comment;upper;lower;title
// cat UnicodeData.txt | csvgrep -d ";" -c gc -r '^L|^N|^P|^S|^Zs' ~/UnicodeData.txt | csvcut -c code | tail -n +2 | tools/list_to_range.py
// This gets non-letters, non-numbers, non-punctuation, non-symbols, non-space-separators.
+ (instancetype)baseCharactersForUnicodeVersion:(NSInteger)version {
    assert(version == 12);
    static NSCharacterSet *characterSet;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableCharacterSet *set = [[NSMutableCharacterSet alloc] init];
        [set addCharactersInRange:NSMakeRange(0x20, 95)];
        [set addCharactersInRange:NSMakeRange(0xa0, 13)];
        [set addCharactersInRange:NSMakeRange(0xae, 594)];
        [set addCharactersInRange:NSMakeRange(0x370, 8)];
        [set addCharactersInRange:NSMakeRange(0x37a, 6)];
        [set addCharactersInRange:NSMakeRange(0x384, 7)];
        [set addCharactersInRange:NSMakeRange(0x38c, 1)];
        [set addCharactersInRange:NSMakeRange(0x38e, 20)];
        [set addCharactersInRange:NSMakeRange(0x3a3, 224)];
        [set addCharactersInRange:NSMakeRange(0x48a, 166)];
        [set addCharactersInRange:NSMakeRange(0x531, 38)];
        [set addCharactersInRange:NSMakeRange(0x559, 50)];
        [set addCharactersInRange:NSMakeRange(0x58d, 3)];
        [set addCharactersInRange:NSMakeRange(0x5be, 1)];
        [set addCharactersInRange:NSMakeRange(0x5c0, 1)];
        [set addCharactersInRange:NSMakeRange(0x5c3, 1)];
        [set addCharactersInRange:NSMakeRange(0x5c6, 1)];
        [set addCharactersInRange:NSMakeRange(0x5d0, 27)];
        [set addCharactersInRange:NSMakeRange(0x5ef, 6)];
        [set addCharactersInRange:NSMakeRange(0x606, 10)];
        [set addCharactersInRange:NSMakeRange(0x61b, 1)];
        [set addCharactersInRange:NSMakeRange(0x61d, 46)];
        [set addCharactersInRange:NSMakeRange(0x660, 16)];
        [set addCharactersInRange:NSMakeRange(0x671, 101)];
        [set addCharactersInRange:NSMakeRange(0x6de, 1)];
        [set addCharactersInRange:NSMakeRange(0x6e5, 2)];
        [set addCharactersInRange:NSMakeRange(0x6e9, 1)];
        [set addCharactersInRange:NSMakeRange(0x6ee, 32)];
        [set addCharactersInRange:NSMakeRange(0x710, 1)];
        [set addCharactersInRange:NSMakeRange(0x712, 30)];
        [set addCharactersInRange:NSMakeRange(0x74d, 89)];
        [set addCharactersInRange:NSMakeRange(0x7b1, 1)];
        [set addCharactersInRange:NSMakeRange(0x7c0, 43)];
        [set addCharactersInRange:NSMakeRange(0x7f4, 7)];
        [set addCharactersInRange:NSMakeRange(0x7fe, 24)];
        [set addCharactersInRange:NSMakeRange(0x81a, 1)];
        [set addCharactersInRange:NSMakeRange(0x824, 1)];
        [set addCharactersInRange:NSMakeRange(0x828, 1)];
        [set addCharactersInRange:NSMakeRange(0x830, 15)];
        [set addCharactersInRange:NSMakeRange(0x840, 25)];
        [set addCharactersInRange:NSMakeRange(0x85e, 1)];
        [set addCharactersInRange:NSMakeRange(0x860, 11)];
        [set addCharactersInRange:NSMakeRange(0x870, 31)];
        [set addCharactersInRange:NSMakeRange(0x8a0, 42)];
        [set addCharactersInRange:NSMakeRange(0x904, 54)];
        [set addCharactersInRange:NSMakeRange(0x93d, 1)];
        [set addCharactersInRange:NSMakeRange(0x950, 1)];
        [set addCharactersInRange:NSMakeRange(0x958, 10)];
        [set addCharactersInRange:NSMakeRange(0x964, 29)];
        [set addCharactersInRange:NSMakeRange(0x985, 8)];
        [set addCharactersInRange:NSMakeRange(0x98f, 2)];
        [set addCharactersInRange:NSMakeRange(0x993, 22)];
        [set addCharactersInRange:NSMakeRange(0x9aa, 7)];
        [set addCharactersInRange:NSMakeRange(0x9b2, 1)];
        [set addCharactersInRange:NSMakeRange(0x9b6, 4)];
        [set addCharactersInRange:NSMakeRange(0x9bd, 1)];
        [set addCharactersInRange:NSMakeRange(0x9ce, 1)];
        [set addCharactersInRange:NSMakeRange(0x9dc, 2)];
        [set addCharactersInRange:NSMakeRange(0x9df, 3)];
        [set addCharactersInRange:NSMakeRange(0x9e6, 24)];
        [set addCharactersInRange:NSMakeRange(0xa05, 6)];
        [set addCharactersInRange:NSMakeRange(0xa0f, 2)];
        [set addCharactersInRange:NSMakeRange(0xa13, 22)];
        [set addCharactersInRange:NSMakeRange(0xa2a, 7)];
        [set addCharactersInRange:NSMakeRange(0xa32, 2)];
        [set addCharactersInRange:NSMakeRange(0xa35, 2)];
        [set addCharactersInRange:NSMakeRange(0xa38, 2)];
        [set addCharactersInRange:NSMakeRange(0xa59, 4)];
        [set addCharactersInRange:NSMakeRange(0xa5e, 1)];
        [set addCharactersInRange:NSMakeRange(0xa66, 10)];
        [set addCharactersInRange:NSMakeRange(0xa72, 3)];
        [set addCharactersInRange:NSMakeRange(0xa76, 1)];
        [set addCharactersInRange:NSMakeRange(0xa85, 9)];
        [set addCharactersInRange:NSMakeRange(0xa8f, 3)];
        [set addCharactersInRange:NSMakeRange(0xa93, 22)];
        [set addCharactersInRange:NSMakeRange(0xaaa, 7)];
        [set addCharactersInRange:NSMakeRange(0xab2, 2)];
        [set addCharactersInRange:NSMakeRange(0xab5, 5)];
        [set addCharactersInRange:NSMakeRange(0xabd, 1)];
        [set addCharactersInRange:NSMakeRange(0xad0, 1)];
        [set addCharactersInRange:NSMakeRange(0xae0, 2)];
        [set addCharactersInRange:NSMakeRange(0xae6, 12)];
        [set addCharactersInRange:NSMakeRange(0xaf9, 1)];
        [set addCharactersInRange:NSMakeRange(0xb05, 8)];
        [set addCharactersInRange:NSMakeRange(0xb0f, 2)];
        [set addCharactersInRange:NSMakeRange(0xb13, 22)];
        [set addCharactersInRange:NSMakeRange(0xb2a, 7)];
        [set addCharactersInRange:NSMakeRange(0xb32, 2)];
        [set addCharactersInRange:NSMakeRange(0xb35, 5)];
        [set addCharactersInRange:NSMakeRange(0xb3d, 1)];
        [set addCharactersInRange:NSMakeRange(0xb5c, 2)];
        [set addCharactersInRange:NSMakeRange(0xb5f, 3)];
        [set addCharactersInRange:NSMakeRange(0xb66, 18)];
        [set addCharactersInRange:NSMakeRange(0xb83, 1)];
        [set addCharactersInRange:NSMakeRange(0xb85, 6)];
        [set addCharactersInRange:NSMakeRange(0xb8e, 3)];
        [set addCharactersInRange:NSMakeRange(0xb92, 4)];
        [set addCharactersInRange:NSMakeRange(0xb99, 2)];
        [set addCharactersInRange:NSMakeRange(0xb9c, 1)];
        [set addCharactersInRange:NSMakeRange(0xb9e, 2)];
        [set addCharactersInRange:NSMakeRange(0xba3, 2)];
        [set addCharactersInRange:NSMakeRange(0xba8, 3)];
        [set addCharactersInRange:NSMakeRange(0xbae, 12)];
        [set addCharactersInRange:NSMakeRange(0xbd0, 1)];
        [set addCharactersInRange:NSMakeRange(0xbe6, 21)];
        [set addCharactersInRange:NSMakeRange(0xc05, 8)];
        [set addCharactersInRange:NSMakeRange(0xc0e, 3)];
        [set addCharactersInRange:NSMakeRange(0xc12, 23)];
        [set addCharactersInRange:NSMakeRange(0xc2a, 16)];
        [set addCharactersInRange:NSMakeRange(0xc3d, 1)];
        [set addCharactersInRange:NSMakeRange(0xc58, 3)];
        [set addCharactersInRange:NSMakeRange(0xc5d, 1)];
        [set addCharactersInRange:NSMakeRange(0xc60, 2)];
        [set addCharactersInRange:NSMakeRange(0xc66, 10)];
        [set addCharactersInRange:NSMakeRange(0xc77, 10)];
        [set addCharactersInRange:NSMakeRange(0xc84, 9)];
        [set addCharactersInRange:NSMakeRange(0xc8e, 3)];
        [set addCharactersInRange:NSMakeRange(0xc92, 23)];
        [set addCharactersInRange:NSMakeRange(0xcaa, 10)];
        [set addCharactersInRange:NSMakeRange(0xcb5, 5)];
        [set addCharactersInRange:NSMakeRange(0xcbd, 1)];
        [set addCharactersInRange:NSMakeRange(0xcdd, 2)];
        [set addCharactersInRange:NSMakeRange(0xce0, 2)];
        [set addCharactersInRange:NSMakeRange(0xce6, 10)];
        [set addCharactersInRange:NSMakeRange(0xcf1, 2)];
        [set addCharactersInRange:NSMakeRange(0xd04, 9)];
        [set addCharactersInRange:NSMakeRange(0xd0e, 3)];
        [set addCharactersInRange:NSMakeRange(0xd12, 41)];
        [set addCharactersInRange:NSMakeRange(0xd3d, 1)];
        [set addCharactersInRange:NSMakeRange(0xd4e, 2)];
        [set addCharactersInRange:NSMakeRange(0xd54, 3)];
        [set addCharactersInRange:NSMakeRange(0xd58, 10)];
        [set addCharactersInRange:NSMakeRange(0xd66, 26)];
        [set addCharactersInRange:NSMakeRange(0xd85, 18)];
        [set addCharactersInRange:NSMakeRange(0xd9a, 24)];
        [set addCharactersInRange:NSMakeRange(0xdb3, 9)];
        [set addCharactersInRange:NSMakeRange(0xdbd, 1)];
        [set addCharactersInRange:NSMakeRange(0xdc0, 7)];
        [set addCharactersInRange:NSMakeRange(0xde6, 10)];
        [set addCharactersInRange:NSMakeRange(0xdf4, 1)];
        [set addCharactersInRange:NSMakeRange(0xe01, 48)];
        [set addCharactersInRange:NSMakeRange(0xe32, 2)];
        [set addCharactersInRange:NSMakeRange(0xe3f, 8)];
        [set addCharactersInRange:NSMakeRange(0xe4f, 13)];
        [set addCharactersInRange:NSMakeRange(0xe81, 2)];
        [set addCharactersInRange:NSMakeRange(0xe84, 1)];
        [set addCharactersInRange:NSMakeRange(0xe86, 5)];
        [set addCharactersInRange:NSMakeRange(0xe8c, 24)];
        [set addCharactersInRange:NSMakeRange(0xea5, 1)];
        [set addCharactersInRange:NSMakeRange(0xea7, 10)];
        [set addCharactersInRange:NSMakeRange(0xeb2, 2)];
        [set addCharactersInRange:NSMakeRange(0xebd, 1)];
        [set addCharactersInRange:NSMakeRange(0xec0, 5)];
        [set addCharactersInRange:NSMakeRange(0xec6, 1)];
        [set addCharactersInRange:NSMakeRange(0xed0, 10)];
        [set addCharactersInRange:NSMakeRange(0xedc, 4)];
        [set addCharactersInRange:NSMakeRange(0xf00, 24)];
        [set addCharactersInRange:NSMakeRange(0xf1a, 27)];
        [set addCharactersInRange:NSMakeRange(0xf36, 1)];
        [set addCharactersInRange:NSMakeRange(0xf38, 1)];
        [set addCharactersInRange:NSMakeRange(0xf3a, 4)];
        [set addCharactersInRange:NSMakeRange(0xf40, 8)];
        [set addCharactersInRange:NSMakeRange(0xf49, 36)];
        [set addCharactersInRange:NSMakeRange(0xf85, 1)];
        [set addCharactersInRange:NSMakeRange(0xf88, 5)];
        [set addCharactersInRange:NSMakeRange(0xfbe, 8)];
        [set addCharactersInRange:NSMakeRange(0xfc7, 6)];
        [set addCharactersInRange:NSMakeRange(0xfce, 13)];
        [set addCharactersInRange:NSMakeRange(0x1000, 43)];
        [set addCharactersInRange:NSMakeRange(0x103f, 23)];
        [set addCharactersInRange:NSMakeRange(0x105a, 4)];
        [set addCharactersInRange:NSMakeRange(0x1061, 1)];
        [set addCharactersInRange:NSMakeRange(0x1065, 2)];
        [set addCharactersInRange:NSMakeRange(0x106e, 3)];
        [set addCharactersInRange:NSMakeRange(0x1075, 13)];
        [set addCharactersInRange:NSMakeRange(0x108e, 1)];
        [set addCharactersInRange:NSMakeRange(0x1090, 10)];
        [set addCharactersInRange:NSMakeRange(0x109e, 40)];
        [set addCharactersInRange:NSMakeRange(0x10c7, 1)];
        [set addCharactersInRange:NSMakeRange(0x10cd, 1)];
        [set addCharactersInRange:NSMakeRange(0x10d0, 377)];
        [set addCharactersInRange:NSMakeRange(0x124a, 4)];
        [set addCharactersInRange:NSMakeRange(0x1250, 7)];
        [set addCharactersInRange:NSMakeRange(0x1258, 1)];
        [set addCharactersInRange:NSMakeRange(0x125a, 4)];
        [set addCharactersInRange:NSMakeRange(0x1260, 41)];
        [set addCharactersInRange:NSMakeRange(0x128a, 4)];
        [set addCharactersInRange:NSMakeRange(0x1290, 33)];
        [set addCharactersInRange:NSMakeRange(0x12b2, 4)];
        [set addCharactersInRange:NSMakeRange(0x12b8, 7)];
        [set addCharactersInRange:NSMakeRange(0x12c0, 1)];
        [set addCharactersInRange:NSMakeRange(0x12c2, 4)];
        [set addCharactersInRange:NSMakeRange(0x12c8, 15)];
        [set addCharactersInRange:NSMakeRange(0x12d8, 57)];
        [set addCharactersInRange:NSMakeRange(0x1312, 4)];
        [set addCharactersInRange:NSMakeRange(0x1318, 67)];
        [set addCharactersInRange:NSMakeRange(0x1360, 29)];
        [set addCharactersInRange:NSMakeRange(0x1380, 26)];
        [set addCharactersInRange:NSMakeRange(0x13a0, 86)];
        [set addCharactersInRange:NSMakeRange(0x13f8, 6)];
        [set addCharactersInRange:NSMakeRange(0x1400, 669)];
        [set addCharactersInRange:NSMakeRange(0x16a0, 89)];
        [set addCharactersInRange:NSMakeRange(0x1700, 18)];
        [set addCharactersInRange:NSMakeRange(0x171f, 19)];
        [set addCharactersInRange:NSMakeRange(0x1735, 2)];
        [set addCharactersInRange:NSMakeRange(0x1740, 18)];
        [set addCharactersInRange:NSMakeRange(0x1760, 13)];
        [set addCharactersInRange:NSMakeRange(0x176e, 3)];
        [set addCharactersInRange:NSMakeRange(0x1780, 52)];
        [set addCharactersInRange:NSMakeRange(0x17d4, 9)];
        [set addCharactersInRange:NSMakeRange(0x17e0, 10)];
        [set addCharactersInRange:NSMakeRange(0x17f0, 10)];
        [set addCharactersInRange:NSMakeRange(0x1800, 11)];
        [set addCharactersInRange:NSMakeRange(0x1810, 10)];
        [set addCharactersInRange:NSMakeRange(0x1820, 89)];
        [set addCharactersInRange:NSMakeRange(0x1880, 5)];
        [set addCharactersInRange:NSMakeRange(0x1887, 34)];
        [set addCharactersInRange:NSMakeRange(0x18aa, 1)];
        [set addCharactersInRange:NSMakeRange(0x18b0, 70)];
        [set addCharactersInRange:NSMakeRange(0x1900, 31)];
        [set addCharactersInRange:NSMakeRange(0x1940, 1)];
        [set addCharactersInRange:NSMakeRange(0x1944, 42)];
        [set addCharactersInRange:NSMakeRange(0x1970, 5)];
        [set addCharactersInRange:NSMakeRange(0x1980, 44)];
        [set addCharactersInRange:NSMakeRange(0x19b0, 26)];
        [set addCharactersInRange:NSMakeRange(0x19d0, 11)];
        [set addCharactersInRange:NSMakeRange(0x19de, 57)];
        [set addCharactersInRange:NSMakeRange(0x1a1e, 55)];
        [set addCharactersInRange:NSMakeRange(0x1a80, 10)];
        [set addCharactersInRange:NSMakeRange(0x1a90, 10)];
        [set addCharactersInRange:NSMakeRange(0x1aa0, 14)];
        [set addCharactersInRange:NSMakeRange(0x1b05, 47)];
        [set addCharactersInRange:NSMakeRange(0x1b45, 8)];
        [set addCharactersInRange:NSMakeRange(0x1b50, 27)];
        [set addCharactersInRange:NSMakeRange(0x1b74, 11)];
        [set addCharactersInRange:NSMakeRange(0x1b83, 30)];
        [set addCharactersInRange:NSMakeRange(0x1bae, 56)];
        [set addCharactersInRange:NSMakeRange(0x1bfc, 40)];
        [set addCharactersInRange:NSMakeRange(0x1c3b, 15)];
        [set addCharactersInRange:NSMakeRange(0x1c4d, 60)];
        [set addCharactersInRange:NSMakeRange(0x1c90, 43)];
        [set addCharactersInRange:NSMakeRange(0x1cbd, 11)];
        [set addCharactersInRange:NSMakeRange(0x1cd3, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ce9, 4)];
        [set addCharactersInRange:NSMakeRange(0x1cee, 6)];
        [set addCharactersInRange:NSMakeRange(0x1cf5, 2)];
        [set addCharactersInRange:NSMakeRange(0x1cfa, 1)];
        [set addCharactersInRange:NSMakeRange(0x1d00, 192)];
        [set addCharactersInRange:NSMakeRange(0x1e00, 278)];
        [set addCharactersInRange:NSMakeRange(0x1f18, 6)];
        [set addCharactersInRange:NSMakeRange(0x1f20, 38)];
        [set addCharactersInRange:NSMakeRange(0x1f48, 6)];
        [set addCharactersInRange:NSMakeRange(0x1f50, 8)];
        [set addCharactersInRange:NSMakeRange(0x1f59, 1)];
        [set addCharactersInRange:NSMakeRange(0x1f5b, 1)];
        [set addCharactersInRange:NSMakeRange(0x1f5d, 1)];
        [set addCharactersInRange:NSMakeRange(0x1f5f, 31)];
        [set addCharactersInRange:NSMakeRange(0x1f80, 53)];
        [set addCharactersInRange:NSMakeRange(0x1fb6, 15)];
        [set addCharactersInRange:NSMakeRange(0x1fc6, 14)];
        [set addCharactersInRange:NSMakeRange(0x1fd6, 6)];
        [set addCharactersInRange:NSMakeRange(0x1fdd, 19)];
        [set addCharactersInRange:NSMakeRange(0x1ff2, 3)];
        [set addCharactersInRange:NSMakeRange(0x1ff6, 9)];
        [set addCharactersInRange:NSMakeRange(0x2000, 11)];
        [set addCharactersInRange:NSMakeRange(0x2010, 24)];
        [set addCharactersInRange:NSMakeRange(0x202f, 49)];
        [set addCharactersInRange:NSMakeRange(0x2070, 2)];
        [set addCharactersInRange:NSMakeRange(0x2074, 27)];
        [set addCharactersInRange:NSMakeRange(0x2090, 13)];
        [set addCharactersInRange:NSMakeRange(0x20a0, 33)];
        [set addCharactersInRange:NSMakeRange(0x2100, 140)];
        [set addCharactersInRange:NSMakeRange(0x2190, 663)];
        [set addCharactersInRange:NSMakeRange(0x2440, 11)];
        [set addCharactersInRange:NSMakeRange(0x2460, 1812)];
        [set addCharactersInRange:NSMakeRange(0x2b76, 32)];
        [set addCharactersInRange:NSMakeRange(0x2b97, 344)];
        [set addCharactersInRange:NSMakeRange(0x2cf2, 2)];
        [set addCharactersInRange:NSMakeRange(0x2cf9, 45)];
        [set addCharactersInRange:NSMakeRange(0x2d27, 1)];
        [set addCharactersInRange:NSMakeRange(0x2d2d, 1)];
        [set addCharactersInRange:NSMakeRange(0x2d30, 56)];
        [set addCharactersInRange:NSMakeRange(0x2d6f, 2)];
        [set addCharactersInRange:NSMakeRange(0x2d80, 23)];
        [set addCharactersInRange:NSMakeRange(0x2da0, 7)];
        [set addCharactersInRange:NSMakeRange(0x2da8, 7)];
        [set addCharactersInRange:NSMakeRange(0x2db0, 7)];
        [set addCharactersInRange:NSMakeRange(0x2db8, 7)];
        [set addCharactersInRange:NSMakeRange(0x2dc0, 7)];
        [set addCharactersInRange:NSMakeRange(0x2dc8, 7)];
        [set addCharactersInRange:NSMakeRange(0x2dd0, 7)];
        [set addCharactersInRange:NSMakeRange(0x2dd8, 7)];
        [set addCharactersInRange:NSMakeRange(0x2e00, 94)];
        [set addCharactersInRange:NSMakeRange(0x2e80, 26)];
        [set addCharactersInRange:NSMakeRange(0x2e9b, 89)];
        [set addCharactersInRange:NSMakeRange(0x2f00, 214)];
        [set addCharactersInRange:NSMakeRange(0x2ff0, 12)];
        [set addCharactersInRange:NSMakeRange(0x3000, 42)];
        [set addCharactersInRange:NSMakeRange(0x3030, 16)];
        [set addCharactersInRange:NSMakeRange(0x3041, 86)];
        [set addCharactersInRange:NSMakeRange(0x309b, 101)];
        [set addCharactersInRange:NSMakeRange(0x3105, 43)];
        [set addCharactersInRange:NSMakeRange(0x3131, 94)];
        [set addCharactersInRange:NSMakeRange(0x3190, 84)];
        [set addCharactersInRange:NSMakeRange(0x31f0, 47)];
        [set addCharactersInRange:NSMakeRange(0x3220, 481)];
        [set addCharactersInRange:NSMakeRange(0x4dbf, 66)];
        [set addCharactersInRange:NSMakeRange(0x9fff, 1166)];
        [set addCharactersInRange:NSMakeRange(0xa490, 55)];
        [set addCharactersInRange:NSMakeRange(0xa4d0, 348)];
        [set addCharactersInRange:NSMakeRange(0xa640, 47)];
        [set addCharactersInRange:NSMakeRange(0xa673, 1)];
        [set addCharactersInRange:NSMakeRange(0xa67e, 32)];
        [set addCharactersInRange:NSMakeRange(0xa6a0, 80)];
        [set addCharactersInRange:NSMakeRange(0xa6f2, 6)];
        [set addCharactersInRange:NSMakeRange(0xa700, 203)];
        [set addCharactersInRange:NSMakeRange(0xa7d0, 2)];
        [set addCharactersInRange:NSMakeRange(0xa7d3, 1)];
        [set addCharactersInRange:NSMakeRange(0xa7d5, 5)];
        [set addCharactersInRange:NSMakeRange(0xa7f2, 16)];
        [set addCharactersInRange:NSMakeRange(0xa803, 3)];
        [set addCharactersInRange:NSMakeRange(0xa807, 4)];
        [set addCharactersInRange:NSMakeRange(0xa80c, 23)];
        [set addCharactersInRange:NSMakeRange(0xa828, 4)];
        [set addCharactersInRange:NSMakeRange(0xa830, 10)];
        [set addCharactersInRange:NSMakeRange(0xa840, 56)];
        [set addCharactersInRange:NSMakeRange(0xa882, 50)];
        [set addCharactersInRange:NSMakeRange(0xa8ce, 12)];
        [set addCharactersInRange:NSMakeRange(0xa8f2, 13)];
        [set addCharactersInRange:NSMakeRange(0xa900, 38)];
        [set addCharactersInRange:NSMakeRange(0xa92e, 25)];
        [set addCharactersInRange:NSMakeRange(0xa95f, 30)];
        [set addCharactersInRange:NSMakeRange(0xa984, 47)];
        [set addCharactersInRange:NSMakeRange(0xa9c1, 13)];
        [set addCharactersInRange:NSMakeRange(0xa9cf, 11)];
        [set addCharactersInRange:NSMakeRange(0xa9de, 7)];
        [set addCharactersInRange:NSMakeRange(0xa9e6, 25)];
        [set addCharactersInRange:NSMakeRange(0xaa00, 41)];
        [set addCharactersInRange:NSMakeRange(0xaa40, 3)];
        [set addCharactersInRange:NSMakeRange(0xaa44, 8)];
        [set addCharactersInRange:NSMakeRange(0xaa50, 10)];
        [set addCharactersInRange:NSMakeRange(0xaa5c, 31)];
        [set addCharactersInRange:NSMakeRange(0xaa7e, 50)];
        [set addCharactersInRange:NSMakeRange(0xaab1, 1)];
        [set addCharactersInRange:NSMakeRange(0xaab5, 2)];
        [set addCharactersInRange:NSMakeRange(0xaab9, 5)];
        [set addCharactersInRange:NSMakeRange(0xaac0, 1)];
        [set addCharactersInRange:NSMakeRange(0xaac2, 1)];
        [set addCharactersInRange:NSMakeRange(0xaadb, 16)];
        [set addCharactersInRange:NSMakeRange(0xaaf0, 5)];
        [set addCharactersInRange:NSMakeRange(0xab01, 6)];
        [set addCharactersInRange:NSMakeRange(0xab09, 6)];
        [set addCharactersInRange:NSMakeRange(0xab11, 6)];
        [set addCharactersInRange:NSMakeRange(0xab20, 7)];
        [set addCharactersInRange:NSMakeRange(0xab28, 7)];
        [set addCharactersInRange:NSMakeRange(0xab30, 60)];
        [set addCharactersInRange:NSMakeRange(0xab70, 115)];
        [set addCharactersInRange:NSMakeRange(0xabeb, 1)];
        [set addCharactersInRange:NSMakeRange(0xabf0, 10)];
        [set addCharactersInRange:NSMakeRange(0xac00, 1)];
        [set addCharactersInRange:NSMakeRange(0xd7a3, 1)];
        [set addCharactersInRange:NSMakeRange(0xd7b0, 23)];
        [set addCharactersInRange:NSMakeRange(0xd7cb, 49)];
        [set addCharactersInRange:NSMakeRange(0xf900, 366)];
        [set addCharactersInRange:NSMakeRange(0xfa70, 106)];
        [set addCharactersInRange:NSMakeRange(0xfb00, 7)];
        [set addCharactersInRange:NSMakeRange(0xfb13, 5)];
        [set addCharactersInRange:NSMakeRange(0xfb1d, 1)];
        [set addCharactersInRange:NSMakeRange(0xfb1f, 24)];
        [set addCharactersInRange:NSMakeRange(0xfb38, 5)];
        [set addCharactersInRange:NSMakeRange(0xfb3e, 1)];
        [set addCharactersInRange:NSMakeRange(0xfb40, 2)];
        [set addCharactersInRange:NSMakeRange(0xfb43, 2)];
        [set addCharactersInRange:NSMakeRange(0xfb46, 125)];
        [set addCharactersInRange:NSMakeRange(0xfbd3, 445)];
        [set addCharactersInRange:NSMakeRange(0xfd92, 54)];
        [set addCharactersInRange:NSMakeRange(0xfdcf, 1)];
        [set addCharactersInRange:NSMakeRange(0xfdf0, 16)];
        [set addCharactersInRange:NSMakeRange(0xfe10, 10)];
        [set addCharactersInRange:NSMakeRange(0xfe30, 35)];
        [set addCharactersInRange:NSMakeRange(0xfe54, 19)];
        [set addCharactersInRange:NSMakeRange(0xfe68, 4)];
        [set addCharactersInRange:NSMakeRange(0xfe70, 5)];
        [set addCharactersInRange:NSMakeRange(0xfe76, 135)];
        [set addCharactersInRange:NSMakeRange(0xff01, 190)];
        [set addCharactersInRange:NSMakeRange(0xffc2, 6)];
        [set addCharactersInRange:NSMakeRange(0xffca, 6)];
        [set addCharactersInRange:NSMakeRange(0xffd2, 6)];
        [set addCharactersInRange:NSMakeRange(0xffda, 3)];
        [set addCharactersInRange:NSMakeRange(0xffe0, 7)];
        [set addCharactersInRange:NSMakeRange(0xffe8, 7)];
        [set addCharactersInRange:NSMakeRange(0xfffc, 2)];
        [set addCharactersInRange:NSMakeRange(0x10000, 12)];
        [set addCharactersInRange:NSMakeRange(0x1000d, 26)];
        [set addCharactersInRange:NSMakeRange(0x10028, 19)];
        [set addCharactersInRange:NSMakeRange(0x1003c, 2)];
        [set addCharactersInRange:NSMakeRange(0x1003f, 15)];
        [set addCharactersInRange:NSMakeRange(0x10050, 14)];
        [set addCharactersInRange:NSMakeRange(0x10080, 123)];
        [set addCharactersInRange:NSMakeRange(0x10100, 3)];
        [set addCharactersInRange:NSMakeRange(0x10107, 45)];
        [set addCharactersInRange:NSMakeRange(0x10137, 88)];
        [set addCharactersInRange:NSMakeRange(0x10190, 13)];
        [set addCharactersInRange:NSMakeRange(0x101a0, 1)];
        [set addCharactersInRange:NSMakeRange(0x101d0, 45)];
        [set addCharactersInRange:NSMakeRange(0x10280, 29)];
        [set addCharactersInRange:NSMakeRange(0x102a0, 49)];
        [set addCharactersInRange:NSMakeRange(0x102e1, 27)];
        [set addCharactersInRange:NSMakeRange(0x10300, 36)];
        [set addCharactersInRange:NSMakeRange(0x1032d, 30)];
        [set addCharactersInRange:NSMakeRange(0x10350, 38)];
        [set addCharactersInRange:NSMakeRange(0x10380, 30)];
        [set addCharactersInRange:NSMakeRange(0x1039f, 37)];
        [set addCharactersInRange:NSMakeRange(0x103c8, 14)];
        [set addCharactersInRange:NSMakeRange(0x10400, 158)];
        [set addCharactersInRange:NSMakeRange(0x104a0, 10)];
        [set addCharactersInRange:NSMakeRange(0x104b0, 36)];
        [set addCharactersInRange:NSMakeRange(0x104d8, 36)];
        [set addCharactersInRange:NSMakeRange(0x10500, 40)];
        [set addCharactersInRange:NSMakeRange(0x10530, 52)];
        [set addCharactersInRange:NSMakeRange(0x1056f, 12)];
        [set addCharactersInRange:NSMakeRange(0x1057c, 15)];
        [set addCharactersInRange:NSMakeRange(0x1058c, 7)];
        [set addCharactersInRange:NSMakeRange(0x10594, 2)];
        [set addCharactersInRange:NSMakeRange(0x10597, 11)];
        [set addCharactersInRange:NSMakeRange(0x105a3, 15)];
        [set addCharactersInRange:NSMakeRange(0x105b3, 7)];
        [set addCharactersInRange:NSMakeRange(0x105bb, 2)];
        [set addCharactersInRange:NSMakeRange(0x10600, 311)];
        [set addCharactersInRange:NSMakeRange(0x10740, 22)];
        [set addCharactersInRange:NSMakeRange(0x10760, 8)];
        [set addCharactersInRange:NSMakeRange(0x10780, 6)];
        [set addCharactersInRange:NSMakeRange(0x10787, 42)];
        [set addCharactersInRange:NSMakeRange(0x107b2, 9)];
        [set addCharactersInRange:NSMakeRange(0x10800, 6)];
        [set addCharactersInRange:NSMakeRange(0x10808, 1)];
        [set addCharactersInRange:NSMakeRange(0x1080a, 44)];
        [set addCharactersInRange:NSMakeRange(0x10837, 2)];
        [set addCharactersInRange:NSMakeRange(0x1083c, 1)];
        [set addCharactersInRange:NSMakeRange(0x1083f, 23)];
        [set addCharactersInRange:NSMakeRange(0x10857, 72)];
        [set addCharactersInRange:NSMakeRange(0x108a7, 9)];
        [set addCharactersInRange:NSMakeRange(0x108e0, 19)];
        [set addCharactersInRange:NSMakeRange(0x108f4, 2)];
        [set addCharactersInRange:NSMakeRange(0x108fb, 33)];
        [set addCharactersInRange:NSMakeRange(0x1091f, 27)];
        [set addCharactersInRange:NSMakeRange(0x1093f, 1)];
        [set addCharactersInRange:NSMakeRange(0x10980, 56)];
        [set addCharactersInRange:NSMakeRange(0x109bc, 20)];
        [set addCharactersInRange:NSMakeRange(0x109d2, 47)];
        [set addCharactersInRange:NSMakeRange(0x10a10, 4)];
        [set addCharactersInRange:NSMakeRange(0x10a15, 3)];
        [set addCharactersInRange:NSMakeRange(0x10a19, 29)];
        [set addCharactersInRange:NSMakeRange(0x10a40, 9)];
        [set addCharactersInRange:NSMakeRange(0x10a50, 9)];
        [set addCharactersInRange:NSMakeRange(0x10a60, 64)];
        [set addCharactersInRange:NSMakeRange(0x10ac0, 37)];
        [set addCharactersInRange:NSMakeRange(0x10aeb, 12)];
        [set addCharactersInRange:NSMakeRange(0x10b00, 54)];
        [set addCharactersInRange:NSMakeRange(0x10b39, 29)];
        [set addCharactersInRange:NSMakeRange(0x10b58, 27)];
        [set addCharactersInRange:NSMakeRange(0x10b78, 26)];
        [set addCharactersInRange:NSMakeRange(0x10b99, 4)];
        [set addCharactersInRange:NSMakeRange(0x10ba9, 7)];
        [set addCharactersInRange:NSMakeRange(0x10c00, 73)];
        [set addCharactersInRange:NSMakeRange(0x10c80, 51)];
        [set addCharactersInRange:NSMakeRange(0x10cc0, 51)];
        [set addCharactersInRange:NSMakeRange(0x10cfa, 42)];
        [set addCharactersInRange:NSMakeRange(0x10d30, 10)];
        [set addCharactersInRange:NSMakeRange(0x10e60, 31)];
        [set addCharactersInRange:NSMakeRange(0x10e80, 42)];
        [set addCharactersInRange:NSMakeRange(0x10ead, 1)];
        [set addCharactersInRange:NSMakeRange(0x10eb0, 2)];
        [set addCharactersInRange:NSMakeRange(0x10f00, 40)];
        [set addCharactersInRange:NSMakeRange(0x10f30, 22)];
        [set addCharactersInRange:NSMakeRange(0x10f51, 9)];
        [set addCharactersInRange:NSMakeRange(0x10f70, 18)];
        [set addCharactersInRange:NSMakeRange(0x10f86, 4)];
        [set addCharactersInRange:NSMakeRange(0x10fb0, 28)];
        [set addCharactersInRange:NSMakeRange(0x10fe0, 23)];
        [set addCharactersInRange:NSMakeRange(0x11003, 53)];
        [set addCharactersInRange:NSMakeRange(0x11047, 7)];
        [set addCharactersInRange:NSMakeRange(0x11052, 30)];
        [set addCharactersInRange:NSMakeRange(0x11071, 2)];
        [set addCharactersInRange:NSMakeRange(0x11075, 1)];
        [set addCharactersInRange:NSMakeRange(0x11083, 45)];
        [set addCharactersInRange:NSMakeRange(0x110bb, 2)];
        [set addCharactersInRange:NSMakeRange(0x110be, 4)];
        [set addCharactersInRange:NSMakeRange(0x110d0, 25)];
        [set addCharactersInRange:NSMakeRange(0x110f0, 10)];
        [set addCharactersInRange:NSMakeRange(0x11103, 36)];
        [set addCharactersInRange:NSMakeRange(0x11136, 15)];
        [set addCharactersInRange:NSMakeRange(0x11147, 1)];
        [set addCharactersInRange:NSMakeRange(0x11150, 35)];
        [set addCharactersInRange:NSMakeRange(0x11174, 3)];
        [set addCharactersInRange:NSMakeRange(0x11183, 48)];
        [set addCharactersInRange:NSMakeRange(0x111c1, 8)];
        [set addCharactersInRange:NSMakeRange(0x111cd, 1)];
        [set addCharactersInRange:NSMakeRange(0x111d0, 16)];
        [set addCharactersInRange:NSMakeRange(0x111e1, 20)];
        [set addCharactersInRange:NSMakeRange(0x11200, 18)];
        [set addCharactersInRange:NSMakeRange(0x11213, 25)];
        [set addCharactersInRange:NSMakeRange(0x11238, 6)];
        [set addCharactersInRange:NSMakeRange(0x11280, 7)];
        [set addCharactersInRange:NSMakeRange(0x11288, 1)];
        [set addCharactersInRange:NSMakeRange(0x1128a, 4)];
        [set addCharactersInRange:NSMakeRange(0x1128f, 15)];
        [set addCharactersInRange:NSMakeRange(0x1129f, 11)];
        [set addCharactersInRange:NSMakeRange(0x112b0, 47)];
        [set addCharactersInRange:NSMakeRange(0x112f0, 10)];
        [set addCharactersInRange:NSMakeRange(0x11305, 8)];
        [set addCharactersInRange:NSMakeRange(0x1130f, 2)];
        [set addCharactersInRange:NSMakeRange(0x11313, 22)];
        [set addCharactersInRange:NSMakeRange(0x1132a, 7)];
        [set addCharactersInRange:NSMakeRange(0x11332, 2)];
        [set addCharactersInRange:NSMakeRange(0x11335, 5)];
        [set addCharactersInRange:NSMakeRange(0x1133d, 1)];
        [set addCharactersInRange:NSMakeRange(0x11350, 1)];
        [set addCharactersInRange:NSMakeRange(0x1135d, 5)];
        [set addCharactersInRange:NSMakeRange(0x11400, 53)];
        [set addCharactersInRange:NSMakeRange(0x11447, 21)];
        [set addCharactersInRange:NSMakeRange(0x1145d, 1)];
        [set addCharactersInRange:NSMakeRange(0x1145f, 3)];
        [set addCharactersInRange:NSMakeRange(0x11480, 48)];
        [set addCharactersInRange:NSMakeRange(0x114c4, 4)];
        [set addCharactersInRange:NSMakeRange(0x114d0, 10)];
        [set addCharactersInRange:NSMakeRange(0x11580, 47)];
        [set addCharactersInRange:NSMakeRange(0x115c1, 27)];
        [set addCharactersInRange:NSMakeRange(0x11600, 48)];
        [set addCharactersInRange:NSMakeRange(0x11641, 4)];
        [set addCharactersInRange:NSMakeRange(0x11650, 10)];
        [set addCharactersInRange:NSMakeRange(0x11660, 13)];
        [set addCharactersInRange:NSMakeRange(0x11680, 43)];
        [set addCharactersInRange:NSMakeRange(0x116b8, 2)];
        [set addCharactersInRange:NSMakeRange(0x116c0, 10)];
        [set addCharactersInRange:NSMakeRange(0x11700, 27)];
        [set addCharactersInRange:NSMakeRange(0x11730, 23)];
        [set addCharactersInRange:NSMakeRange(0x11800, 44)];
        [set addCharactersInRange:NSMakeRange(0x1183b, 1)];
        [set addCharactersInRange:NSMakeRange(0x118a0, 83)];
        [set addCharactersInRange:NSMakeRange(0x118ff, 8)];
        [set addCharactersInRange:NSMakeRange(0x11909, 1)];
        [set addCharactersInRange:NSMakeRange(0x1190c, 8)];
        [set addCharactersInRange:NSMakeRange(0x11915, 2)];
        [set addCharactersInRange:NSMakeRange(0x11918, 24)];
        [set addCharactersInRange:NSMakeRange(0x1193f, 1)];
        [set addCharactersInRange:NSMakeRange(0x11941, 1)];
        [set addCharactersInRange:NSMakeRange(0x11944, 3)];
        [set addCharactersInRange:NSMakeRange(0x11950, 10)];
        [set addCharactersInRange:NSMakeRange(0x119a0, 8)];
        [set addCharactersInRange:NSMakeRange(0x119aa, 39)];
        [set addCharactersInRange:NSMakeRange(0x119e1, 3)];
        [set addCharactersInRange:NSMakeRange(0x11a00, 1)];
        [set addCharactersInRange:NSMakeRange(0x11a0b, 40)];
        [set addCharactersInRange:NSMakeRange(0x11a3a, 1)];
        [set addCharactersInRange:NSMakeRange(0x11a3f, 8)];
        [set addCharactersInRange:NSMakeRange(0x11a50, 1)];
        [set addCharactersInRange:NSMakeRange(0x11a5c, 46)];
        [set addCharactersInRange:NSMakeRange(0x11a9a, 9)];
        [set addCharactersInRange:NSMakeRange(0x11ab0, 73)];
        [set addCharactersInRange:NSMakeRange(0x11c00, 9)];
        [set addCharactersInRange:NSMakeRange(0x11c0a, 37)];
        [set addCharactersInRange:NSMakeRange(0x11c40, 6)];
        [set addCharactersInRange:NSMakeRange(0x11c50, 29)];
        [set addCharactersInRange:NSMakeRange(0x11c70, 32)];
        [set addCharactersInRange:NSMakeRange(0x11d00, 7)];
        [set addCharactersInRange:NSMakeRange(0x11d08, 2)];
        [set addCharactersInRange:NSMakeRange(0x11d0b, 38)];
        [set addCharactersInRange:NSMakeRange(0x11d46, 1)];
        [set addCharactersInRange:NSMakeRange(0x11d50, 10)];
        [set addCharactersInRange:NSMakeRange(0x11d60, 6)];
        [set addCharactersInRange:NSMakeRange(0x11d67, 2)];
        [set addCharactersInRange:NSMakeRange(0x11d6a, 32)];
        [set addCharactersInRange:NSMakeRange(0x11d98, 1)];
        [set addCharactersInRange:NSMakeRange(0x11da0, 10)];
        [set addCharactersInRange:NSMakeRange(0x11ee0, 19)];
        [set addCharactersInRange:NSMakeRange(0x11ef7, 2)];
        [set addCharactersInRange:NSMakeRange(0x11fb0, 1)];
        [set addCharactersInRange:NSMakeRange(0x11fc0, 50)];
        [set addCharactersInRange:NSMakeRange(0x11fff, 923)];
        [set addCharactersInRange:NSMakeRange(0x12400, 111)];
        [set addCharactersInRange:NSMakeRange(0x12470, 5)];
        [set addCharactersInRange:NSMakeRange(0x12480, 196)];
        [set addCharactersInRange:NSMakeRange(0x12f90, 99)];
        [set addCharactersInRange:NSMakeRange(0x13000, 1071)];
        [set addCharactersInRange:NSMakeRange(0x14400, 583)];
        [set addCharactersInRange:NSMakeRange(0x16800, 569)];
        [set addCharactersInRange:NSMakeRange(0x16a40, 31)];
        [set addCharactersInRange:NSMakeRange(0x16a60, 10)];
        [set addCharactersInRange:NSMakeRange(0x16a6e, 81)];
        [set addCharactersInRange:NSMakeRange(0x16ac0, 10)];
        [set addCharactersInRange:NSMakeRange(0x16ad0, 30)];
        [set addCharactersInRange:NSMakeRange(0x16af5, 1)];
        [set addCharactersInRange:NSMakeRange(0x16b00, 48)];
        [set addCharactersInRange:NSMakeRange(0x16b37, 15)];
        [set addCharactersInRange:NSMakeRange(0x16b50, 10)];
        [set addCharactersInRange:NSMakeRange(0x16b5b, 7)];
        [set addCharactersInRange:NSMakeRange(0x16b63, 21)];
        [set addCharactersInRange:NSMakeRange(0x16b7d, 19)];
        [set addCharactersInRange:NSMakeRange(0x16e40, 91)];
        [set addCharactersInRange:NSMakeRange(0x16f00, 75)];
        [set addCharactersInRange:NSMakeRange(0x16f50, 1)];
        [set addCharactersInRange:NSMakeRange(0x16f93, 13)];
        [set addCharactersInRange:NSMakeRange(0x16fe0, 4)];
        [set addCharactersInRange:NSMakeRange(0x17000, 1)];
        [set addCharactersInRange:NSMakeRange(0x187f7, 1)];
        [set addCharactersInRange:NSMakeRange(0x18800, 1238)];
        [set addCharactersInRange:NSMakeRange(0x18d00, 1)];
        [set addCharactersInRange:NSMakeRange(0x18d08, 1)];
        [set addCharactersInRange:NSMakeRange(0x1aff0, 4)];
        [set addCharactersInRange:NSMakeRange(0x1aff5, 7)];
        [set addCharactersInRange:NSMakeRange(0x1affd, 2)];
        [set addCharactersInRange:NSMakeRange(0x1b000, 291)];
        [set addCharactersInRange:NSMakeRange(0x1b150, 3)];
        [set addCharactersInRange:NSMakeRange(0x1b164, 4)];
        [set addCharactersInRange:NSMakeRange(0x1b170, 396)];
        [set addCharactersInRange:NSMakeRange(0x1bc00, 107)];
        [set addCharactersInRange:NSMakeRange(0x1bc70, 13)];
        [set addCharactersInRange:NSMakeRange(0x1bc80, 9)];
        [set addCharactersInRange:NSMakeRange(0x1bc90, 10)];
        [set addCharactersInRange:NSMakeRange(0x1bc9c, 1)];
        [set addCharactersInRange:NSMakeRange(0x1bc9f, 1)];
        [set addCharactersInRange:NSMakeRange(0x1cf50, 116)];
        [set addCharactersInRange:NSMakeRange(0x1d000, 246)];
        [set addCharactersInRange:NSMakeRange(0x1d100, 39)];
        [set addCharactersInRange:NSMakeRange(0x1d129, 60)];
        [set addCharactersInRange:NSMakeRange(0x1d16a, 3)];
        [set addCharactersInRange:NSMakeRange(0x1d183, 2)];
        [set addCharactersInRange:NSMakeRange(0x1d18c, 30)];
        [set addCharactersInRange:NSMakeRange(0x1d1ae, 61)];
        [set addCharactersInRange:NSMakeRange(0x1d200, 66)];
        [set addCharactersInRange:NSMakeRange(0x1d245, 1)];
        [set addCharactersInRange:NSMakeRange(0x1d2e0, 20)];
        [set addCharactersInRange:NSMakeRange(0x1d300, 87)];
        [set addCharactersInRange:NSMakeRange(0x1d360, 25)];
        [set addCharactersInRange:NSMakeRange(0x1d400, 85)];
        [set addCharactersInRange:NSMakeRange(0x1d456, 71)];
        [set addCharactersInRange:NSMakeRange(0x1d49e, 2)];
        [set addCharactersInRange:NSMakeRange(0x1d4a2, 1)];
        [set addCharactersInRange:NSMakeRange(0x1d4a5, 2)];
        [set addCharactersInRange:NSMakeRange(0x1d4a9, 4)];
        [set addCharactersInRange:NSMakeRange(0x1d4ae, 12)];
        [set addCharactersInRange:NSMakeRange(0x1d4bb, 1)];
        [set addCharactersInRange:NSMakeRange(0x1d4bd, 7)];
        [set addCharactersInRange:NSMakeRange(0x1d4c5, 65)];
        [set addCharactersInRange:NSMakeRange(0x1d507, 4)];
        [set addCharactersInRange:NSMakeRange(0x1d50d, 8)];
        [set addCharactersInRange:NSMakeRange(0x1d516, 7)];
        [set addCharactersInRange:NSMakeRange(0x1d51e, 28)];
        [set addCharactersInRange:NSMakeRange(0x1d53b, 4)];
        [set addCharactersInRange:NSMakeRange(0x1d540, 5)];
        [set addCharactersInRange:NSMakeRange(0x1d546, 1)];
        [set addCharactersInRange:NSMakeRange(0x1d54a, 7)];
        [set addCharactersInRange:NSMakeRange(0x1d552, 340)];
        [set addCharactersInRange:NSMakeRange(0x1d6a8, 292)];
        [set addCharactersInRange:NSMakeRange(0x1d7ce, 562)];
        [set addCharactersInRange:NSMakeRange(0x1da37, 4)];
        [set addCharactersInRange:NSMakeRange(0x1da6d, 8)];
        [set addCharactersInRange:NSMakeRange(0x1da76, 14)];
        [set addCharactersInRange:NSMakeRange(0x1da85, 7)];
        [set addCharactersInRange:NSMakeRange(0x1df00, 31)];
        [set addCharactersInRange:NSMakeRange(0x1e100, 45)];
        [set addCharactersInRange:NSMakeRange(0x1e137, 7)];
        [set addCharactersInRange:NSMakeRange(0x1e140, 10)];
        [set addCharactersInRange:NSMakeRange(0x1e14e, 2)];
        [set addCharactersInRange:NSMakeRange(0x1e290, 30)];
        [set addCharactersInRange:NSMakeRange(0x1e2c0, 44)];
        [set addCharactersInRange:NSMakeRange(0x1e2f0, 10)];
        [set addCharactersInRange:NSMakeRange(0x1e2ff, 1)];
        [set addCharactersInRange:NSMakeRange(0x1e7e0, 7)];
        [set addCharactersInRange:NSMakeRange(0x1e7e8, 4)];
        [set addCharactersInRange:NSMakeRange(0x1e7ed, 2)];
        [set addCharactersInRange:NSMakeRange(0x1e7f0, 15)];
        [set addCharactersInRange:NSMakeRange(0x1e800, 197)];
        [set addCharactersInRange:NSMakeRange(0x1e8c7, 9)];
        [set addCharactersInRange:NSMakeRange(0x1e900, 68)];
        [set addCharactersInRange:NSMakeRange(0x1e94b, 1)];
        [set addCharactersInRange:NSMakeRange(0x1e950, 10)];
        [set addCharactersInRange:NSMakeRange(0x1e95e, 2)];
        [set addCharactersInRange:NSMakeRange(0x1ec71, 68)];
        [set addCharactersInRange:NSMakeRange(0x1ed01, 61)];
        [set addCharactersInRange:NSMakeRange(0x1ee00, 4)];
        [set addCharactersInRange:NSMakeRange(0x1ee05, 27)];
        [set addCharactersInRange:NSMakeRange(0x1ee21, 2)];
        [set addCharactersInRange:NSMakeRange(0x1ee24, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ee27, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ee29, 10)];
        [set addCharactersInRange:NSMakeRange(0x1ee34, 4)];
        [set addCharactersInRange:NSMakeRange(0x1ee39, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ee3b, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ee42, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ee47, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ee49, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ee4b, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ee4d, 3)];
        [set addCharactersInRange:NSMakeRange(0x1ee51, 2)];
        [set addCharactersInRange:NSMakeRange(0x1ee54, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ee57, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ee59, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ee5b, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ee5d, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ee5f, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ee61, 2)];
        [set addCharactersInRange:NSMakeRange(0x1ee64, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ee67, 4)];
        [set addCharactersInRange:NSMakeRange(0x1ee6c, 7)];
        [set addCharactersInRange:NSMakeRange(0x1ee74, 4)];
        [set addCharactersInRange:NSMakeRange(0x1ee79, 4)];
        [set addCharactersInRange:NSMakeRange(0x1ee7e, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ee80, 10)];
        [set addCharactersInRange:NSMakeRange(0x1ee8b, 17)];
        [set addCharactersInRange:NSMakeRange(0x1eea1, 3)];
        [set addCharactersInRange:NSMakeRange(0x1eea5, 5)];
        [set addCharactersInRange:NSMakeRange(0x1eeab, 17)];
        [set addCharactersInRange:NSMakeRange(0x1eef0, 2)];
        [set addCharactersInRange:NSMakeRange(0x1f000, 44)];
        [set addCharactersInRange:NSMakeRange(0x1f030, 100)];
        [set addCharactersInRange:NSMakeRange(0x1f0a0, 15)];
        [set addCharactersInRange:NSMakeRange(0x1f0b1, 15)];
        [set addCharactersInRange:NSMakeRange(0x1f0c1, 15)];
        [set addCharactersInRange:NSMakeRange(0x1f0d1, 37)];
        [set addCharactersInRange:NSMakeRange(0x1f100, 174)];
        [set addCharactersInRange:NSMakeRange(0x1f1e6, 29)];
        [set addCharactersInRange:NSMakeRange(0x1f210, 44)];
        [set addCharactersInRange:NSMakeRange(0x1f240, 9)];
        [set addCharactersInRange:NSMakeRange(0x1f250, 2)];
        [set addCharactersInRange:NSMakeRange(0x1f260, 6)];
        [set addCharactersInRange:NSMakeRange(0x1f300, 984)];
        [set addCharactersInRange:NSMakeRange(0x1f6dd, 16)];
        [set addCharactersInRange:NSMakeRange(0x1f6f0, 13)];
        [set addCharactersInRange:NSMakeRange(0x1f700, 116)];
        [set addCharactersInRange:NSMakeRange(0x1f780, 89)];
        [set addCharactersInRange:NSMakeRange(0x1f7e0, 12)];
        [set addCharactersInRange:NSMakeRange(0x1f7f0, 1)];
        [set addCharactersInRange:NSMakeRange(0x1f800, 12)];
        [set addCharactersInRange:NSMakeRange(0x1f810, 56)];
        [set addCharactersInRange:NSMakeRange(0x1f850, 10)];
        [set addCharactersInRange:NSMakeRange(0x1f860, 40)];
        [set addCharactersInRange:NSMakeRange(0x1f890, 30)];
        [set addCharactersInRange:NSMakeRange(0x1f8b0, 2)];
        [set addCharactersInRange:NSMakeRange(0x1f900, 340)];
        [set addCharactersInRange:NSMakeRange(0x1fa60, 14)];
        [set addCharactersInRange:NSMakeRange(0x1fa70, 5)];
        [set addCharactersInRange:NSMakeRange(0x1fa78, 5)];
        [set addCharactersInRange:NSMakeRange(0x1fa80, 7)];
        [set addCharactersInRange:NSMakeRange(0x1fa90, 29)];
        [set addCharactersInRange:NSMakeRange(0x1fab0, 11)];
        [set addCharactersInRange:NSMakeRange(0x1fac0, 6)];
        [set addCharactersInRange:NSMakeRange(0x1fad0, 10)];
        [set addCharactersInRange:NSMakeRange(0x1fae0, 8)];
        [set addCharactersInRange:NSMakeRange(0x1faf0, 7)];
        [set addCharactersInRange:NSMakeRange(0x1fb00, 147)];
        [set addCharactersInRange:NSMakeRange(0x1fb94, 55)];
        [set addCharactersInRange:NSMakeRange(0x1fbf0, 10)];
        [set addCharactersInRange:NSMakeRange(0x20000, 1)];
        [set addCharactersInRange:NSMakeRange(0x2a6df, 1)];
        [set addCharactersInRange:NSMakeRange(0x2a700, 1)];
        [set addCharactersInRange:NSMakeRange(0x2b738, 1)];
        [set addCharactersInRange:NSMakeRange(0x2b740, 1)];
        [set addCharactersInRange:NSMakeRange(0x2b81d, 1)];
        [set addCharactersInRange:NSMakeRange(0x2b820, 1)];
        [set addCharactersInRange:NSMakeRange(0x2cea1, 1)];
        [set addCharactersInRange:NSMakeRange(0x2ceb0, 1)];
        [set addCharactersInRange:NSMakeRange(0x2ebe0, 1)];
        [set addCharactersInRange:NSMakeRange(0x2f800, 542)];
        [set addCharactersInRange:NSMakeRange(0x30000, 1)];
        [set addCharactersInRange:NSMakeRange(0x3134a, 1)];

        characterSet = set;
    });
    return characterSet;
}

// Assumes unicode 12
+ (instancetype)codePointsWithOwnCell {
    static dispatch_once_t onceToken;
    static NSCharacterSet *characterSet;
    dispatch_once(&onceToken, ^{
        NSMutableCharacterSet *set = [[NSMutableCharacterSet alloc] init];
        [set formUnionWithCharacterSet:[self baseCharactersForUnicodeVersion:12]];
        [set formUnionWithCharacterSet:[self spacingCombiningMarksForUnicodeVersion:12]];
        [set formUnionWithCharacterSet:[self modifierLettersForUnicodeVersion:12]];
        characterSet = set;
    });
    return characterSet;
}

// Assumes unicode 12
// csvgrep -d ";" -c gc -r '^Mc$' tests/UnicodeData.txt | csvcut -c code | tail -n +2 | tools/list_to_range.py
+ (instancetype)spacingCombiningMarksForUnicodeVersion:(int)version {
    assert(version == 12);
    static NSCharacterSet *characterSet;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableCharacterSet *set = [[NSMutableCharacterSet alloc] init];
        [set addCharactersInRange:NSMakeRange(0x903, 1)];
        [set addCharactersInRange:NSMakeRange(0x93b, 1)];
        [set addCharactersInRange:NSMakeRange(0x93e, 3)];
        [set addCharactersInRange:NSMakeRange(0x949, 4)];
        [set addCharactersInRange:NSMakeRange(0x94e, 2)];
        [set addCharactersInRange:NSMakeRange(0x982, 2)];
        [set addCharactersInRange:NSMakeRange(0x9be, 3)];
        [set addCharactersInRange:NSMakeRange(0x9c7, 2)];
        [set addCharactersInRange:NSMakeRange(0x9cb, 2)];
        [set addCharactersInRange:NSMakeRange(0x9d7, 1)];
        [set addCharactersInRange:NSMakeRange(0xa03, 1)];
        [set addCharactersInRange:NSMakeRange(0xa3e, 3)];
        [set addCharactersInRange:NSMakeRange(0xa83, 1)];
        [set addCharactersInRange:NSMakeRange(0xabe, 3)];
        [set addCharactersInRange:NSMakeRange(0xac9, 1)];
        [set addCharactersInRange:NSMakeRange(0xacb, 2)];
        [set addCharactersInRange:NSMakeRange(0xb02, 2)];
        [set addCharactersInRange:NSMakeRange(0xb3e, 1)];
        [set addCharactersInRange:NSMakeRange(0xb40, 1)];
        [set addCharactersInRange:NSMakeRange(0xb47, 2)];
        [set addCharactersInRange:NSMakeRange(0xb4b, 2)];
        [set addCharactersInRange:NSMakeRange(0xb57, 1)];
        [set addCharactersInRange:NSMakeRange(0xbbe, 2)];
        [set addCharactersInRange:NSMakeRange(0xbc1, 2)];
        [set addCharactersInRange:NSMakeRange(0xbc6, 3)];
        [set addCharactersInRange:NSMakeRange(0xbca, 3)];
        [set addCharactersInRange:NSMakeRange(0xbd7, 1)];
        [set addCharactersInRange:NSMakeRange(0xc01, 3)];
        [set addCharactersInRange:NSMakeRange(0xc41, 4)];
        [set addCharactersInRange:NSMakeRange(0xc82, 2)];
        [set addCharactersInRange:NSMakeRange(0xcbe, 1)];
        [set addCharactersInRange:NSMakeRange(0xcc0, 5)];
        [set addCharactersInRange:NSMakeRange(0xcc7, 2)];
        [set addCharactersInRange:NSMakeRange(0xcca, 2)];
        [set addCharactersInRange:NSMakeRange(0xcd5, 2)];
        [set addCharactersInRange:NSMakeRange(0xd02, 2)];
        [set addCharactersInRange:NSMakeRange(0xd3e, 3)];
        [set addCharactersInRange:NSMakeRange(0xd46, 3)];
        [set addCharactersInRange:NSMakeRange(0xd4a, 3)];
        [set addCharactersInRange:NSMakeRange(0xd57, 1)];
        [set addCharactersInRange:NSMakeRange(0xd82, 2)];
        [set addCharactersInRange:NSMakeRange(0xdcf, 3)];
        [set addCharactersInRange:NSMakeRange(0xdd8, 8)];
        [set addCharactersInRange:NSMakeRange(0xdf2, 2)];
        [set addCharactersInRange:NSMakeRange(0xf3e, 2)];
        [set addCharactersInRange:NSMakeRange(0xf7f, 1)];
        [set addCharactersInRange:NSMakeRange(0x102b, 2)];
        [set addCharactersInRange:NSMakeRange(0x1031, 1)];
        [set addCharactersInRange:NSMakeRange(0x1038, 1)];
        [set addCharactersInRange:NSMakeRange(0x103b, 2)];
        [set addCharactersInRange:NSMakeRange(0x1056, 2)];
        [set addCharactersInRange:NSMakeRange(0x1062, 3)];
        [set addCharactersInRange:NSMakeRange(0x1067, 7)];
        [set addCharactersInRange:NSMakeRange(0x1083, 2)];
        [set addCharactersInRange:NSMakeRange(0x1087, 6)];
        [set addCharactersInRange:NSMakeRange(0x108f, 1)];
        [set addCharactersInRange:NSMakeRange(0x109a, 3)];
        [set addCharactersInRange:NSMakeRange(0x1715, 1)];
        [set addCharactersInRange:NSMakeRange(0x1734, 1)];
        [set addCharactersInRange:NSMakeRange(0x17b6, 1)];
        [set addCharactersInRange:NSMakeRange(0x17be, 8)];
        [set addCharactersInRange:NSMakeRange(0x17c7, 2)];
        [set addCharactersInRange:NSMakeRange(0x1923, 4)];
        [set addCharactersInRange:NSMakeRange(0x1929, 3)];
        [set addCharactersInRange:NSMakeRange(0x1930, 2)];
        [set addCharactersInRange:NSMakeRange(0x1933, 6)];
        [set addCharactersInRange:NSMakeRange(0x1a19, 2)];
        [set addCharactersInRange:NSMakeRange(0x1a55, 1)];
        [set addCharactersInRange:NSMakeRange(0x1a57, 1)];
        [set addCharactersInRange:NSMakeRange(0x1a61, 1)];
        [set addCharactersInRange:NSMakeRange(0x1a63, 2)];
        [set addCharactersInRange:NSMakeRange(0x1a6d, 6)];
        [set addCharactersInRange:NSMakeRange(0x1b04, 1)];
        [set addCharactersInRange:NSMakeRange(0x1b35, 1)];
        [set addCharactersInRange:NSMakeRange(0x1b3b, 1)];
        [set addCharactersInRange:NSMakeRange(0x1b3d, 5)];
        [set addCharactersInRange:NSMakeRange(0x1b43, 2)];
        [set addCharactersInRange:NSMakeRange(0x1b82, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ba1, 1)];
        [set addCharactersInRange:NSMakeRange(0x1ba6, 2)];
        [set addCharactersInRange:NSMakeRange(0x1baa, 1)];
        [set addCharactersInRange:NSMakeRange(0x1be7, 1)];
        [set addCharactersInRange:NSMakeRange(0x1bea, 3)];
        [set addCharactersInRange:NSMakeRange(0x1bee, 1)];
        [set addCharactersInRange:NSMakeRange(0x1bf2, 2)];
        [set addCharactersInRange:NSMakeRange(0x1c24, 8)];
        [set addCharactersInRange:NSMakeRange(0x1c34, 2)];
        [set addCharactersInRange:NSMakeRange(0x1ce1, 1)];
        [set addCharactersInRange:NSMakeRange(0x1cf7, 1)];
        [set addCharactersInRange:NSMakeRange(0x302e, 2)];
        [set addCharactersInRange:NSMakeRange(0xa823, 2)];
        [set addCharactersInRange:NSMakeRange(0xa827, 1)];
        [set addCharactersInRange:NSMakeRange(0xa880, 2)];
        [set addCharactersInRange:NSMakeRange(0xa8b4, 16)];
        [set addCharactersInRange:NSMakeRange(0xa952, 2)];
        [set addCharactersInRange:NSMakeRange(0xa983, 1)];
        [set addCharactersInRange:NSMakeRange(0xa9b4, 2)];
        [set addCharactersInRange:NSMakeRange(0xa9ba, 2)];
        [set addCharactersInRange:NSMakeRange(0xa9be, 3)];
        [set addCharactersInRange:NSMakeRange(0xaa2f, 2)];
        [set addCharactersInRange:NSMakeRange(0xaa33, 2)];
        [set addCharactersInRange:NSMakeRange(0xaa4d, 1)];
        [set addCharactersInRange:NSMakeRange(0xaa7b, 1)];
        [set addCharactersInRange:NSMakeRange(0xaa7d, 1)];
        [set addCharactersInRange:NSMakeRange(0xaaeb, 1)];
        [set addCharactersInRange:NSMakeRange(0xaaee, 2)];
        [set addCharactersInRange:NSMakeRange(0xaaf5, 1)];
        [set addCharactersInRange:NSMakeRange(0xabe3, 2)];
        [set addCharactersInRange:NSMakeRange(0xabe6, 2)];
        [set addCharactersInRange:NSMakeRange(0xabe9, 2)];
        [set addCharactersInRange:NSMakeRange(0xabec, 1)];
        [set addCharactersInRange:NSMakeRange(0x11000, 1)];
        [set addCharactersInRange:NSMakeRange(0x11002, 1)];
        [set addCharactersInRange:NSMakeRange(0x11082, 1)];
        [set addCharactersInRange:NSMakeRange(0x110b0, 3)];
        [set addCharactersInRange:NSMakeRange(0x110b7, 2)];
        [set addCharactersInRange:NSMakeRange(0x1112c, 1)];
        [set addCharactersInRange:NSMakeRange(0x11145, 2)];
        [set addCharactersInRange:NSMakeRange(0x11182, 1)];
        [set addCharactersInRange:NSMakeRange(0x111b3, 3)];
        [set addCharactersInRange:NSMakeRange(0x111bf, 2)];
        [set addCharactersInRange:NSMakeRange(0x111ce, 1)];
        [set addCharactersInRange:NSMakeRange(0x1122c, 3)];
        [set addCharactersInRange:NSMakeRange(0x11232, 2)];
        [set addCharactersInRange:NSMakeRange(0x11235, 1)];
        [set addCharactersInRange:NSMakeRange(0x112e0, 3)];
        [set addCharactersInRange:NSMakeRange(0x11302, 2)];
        [set addCharactersInRange:NSMakeRange(0x1133e, 2)];
        [set addCharactersInRange:NSMakeRange(0x11341, 4)];
        [set addCharactersInRange:NSMakeRange(0x11347, 2)];
        [set addCharactersInRange:NSMakeRange(0x1134b, 3)];
        [set addCharactersInRange:NSMakeRange(0x11357, 1)];
        [set addCharactersInRange:NSMakeRange(0x11362, 2)];
        [set addCharactersInRange:NSMakeRange(0x11435, 3)];
        [set addCharactersInRange:NSMakeRange(0x11440, 2)];
        [set addCharactersInRange:NSMakeRange(0x11445, 1)];
        [set addCharactersInRange:NSMakeRange(0x114b0, 3)];
        [set addCharactersInRange:NSMakeRange(0x114b9, 1)];
        [set addCharactersInRange:NSMakeRange(0x114bb, 4)];
        [set addCharactersInRange:NSMakeRange(0x114c1, 1)];
        [set addCharactersInRange:NSMakeRange(0x115af, 3)];
        [set addCharactersInRange:NSMakeRange(0x115b8, 4)];
        [set addCharactersInRange:NSMakeRange(0x115be, 1)];
        [set addCharactersInRange:NSMakeRange(0x11630, 3)];
        [set addCharactersInRange:NSMakeRange(0x1163b, 2)];
        [set addCharactersInRange:NSMakeRange(0x1163e, 1)];
        [set addCharactersInRange:NSMakeRange(0x116ac, 1)];
        [set addCharactersInRange:NSMakeRange(0x116ae, 2)];
        [set addCharactersInRange:NSMakeRange(0x116b6, 1)];
        [set addCharactersInRange:NSMakeRange(0x11720, 2)];
        [set addCharactersInRange:NSMakeRange(0x11726, 1)];
        [set addCharactersInRange:NSMakeRange(0x1182c, 3)];
        [set addCharactersInRange:NSMakeRange(0x11838, 1)];
        [set addCharactersInRange:NSMakeRange(0x11930, 6)];
        [set addCharactersInRange:NSMakeRange(0x11937, 2)];
        [set addCharactersInRange:NSMakeRange(0x1193d, 1)];
        [set addCharactersInRange:NSMakeRange(0x11940, 1)];
        [set addCharactersInRange:NSMakeRange(0x11942, 1)];
        [set addCharactersInRange:NSMakeRange(0x119d1, 3)];
        [set addCharactersInRange:NSMakeRange(0x119dc, 4)];
        [set addCharactersInRange:NSMakeRange(0x119e4, 1)];
        [set addCharactersInRange:NSMakeRange(0x11a39, 1)];
        [set addCharactersInRange:NSMakeRange(0x11a57, 2)];
        [set addCharactersInRange:NSMakeRange(0x11a97, 1)];
        [set addCharactersInRange:NSMakeRange(0x11c2f, 1)];
        [set addCharactersInRange:NSMakeRange(0x11c3e, 1)];
        [set addCharactersInRange:NSMakeRange(0x11ca9, 1)];
        [set addCharactersInRange:NSMakeRange(0x11cb1, 1)];
        [set addCharactersInRange:NSMakeRange(0x11cb4, 1)];
        [set addCharactersInRange:NSMakeRange(0x11d8a, 5)];
        [set addCharactersInRange:NSMakeRange(0x11d93, 2)];
        [set addCharactersInRange:NSMakeRange(0x11d96, 1)];
        [set addCharactersInRange:NSMakeRange(0x11ef5, 2)];
        [set addCharactersInRange:NSMakeRange(0x16f51, 55)];
        [set addCharactersInRange:NSMakeRange(0x16ff0, 2)];
        [set addCharactersInRange:NSMakeRange(0x1d165, 2)];
        [set addCharactersInRange:NSMakeRange(0x1d16d, 6)];
        characterSet = set;
    });
    if ([iTermAdvancedSettingsModel aggressiveBaseCharacterDetection]) {
        return characterSet;
    } else {
        return [NSCharacterSet characterSetWithRange:NSMakeRange(0, 0)];
    }
}

// csvgrep -d ";" -c gc -r '^Lm$' tests/UnicodeData.txt | csvcut -c code | tail -n +2 | tools/list_to_range.py
// Modifier letters include HALFWIDTH KATAKANA VOICED SOUND MARK. See issue 6048.
+ (instancetype)modifierLettersForUnicodeVersion:(int)version {
    assert(version == 12);
    static NSCharacterSet *characterSet;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableCharacterSet *set = [[NSMutableCharacterSet alloc] init];

        [set addCharactersInRange:NSMakeRange(0x2b0, 18)];
        [set addCharactersInRange:NSMakeRange(0x2c6, 12)];
        [set addCharactersInRange:NSMakeRange(0x2e0, 5)];
        [set addCharactersInRange:NSMakeRange(0x2ec, 1)];
        [set addCharactersInRange:NSMakeRange(0x2ee, 1)];
        [set addCharactersInRange:NSMakeRange(0x374, 1)];
        [set addCharactersInRange:NSMakeRange(0x37a, 1)];
        [set addCharactersInRange:NSMakeRange(0x559, 1)];
        [set addCharactersInRange:NSMakeRange(0x640, 1)];
        [set addCharactersInRange:NSMakeRange(0x6e5, 2)];
        [set addCharactersInRange:NSMakeRange(0x7f4, 2)];
        [set addCharactersInRange:NSMakeRange(0x7fa, 1)];
        [set addCharactersInRange:NSMakeRange(0x81a, 1)];
        [set addCharactersInRange:NSMakeRange(0x824, 1)];
        [set addCharactersInRange:NSMakeRange(0x828, 1)];
        [set addCharactersInRange:NSMakeRange(0x8c9, 1)];
        [set addCharactersInRange:NSMakeRange(0x971, 1)];
        [set addCharactersInRange:NSMakeRange(0xe46, 1)];
        [set addCharactersInRange:NSMakeRange(0xec6, 1)];
        [set addCharactersInRange:NSMakeRange(0x10fc, 1)];
        [set addCharactersInRange:NSMakeRange(0x17d7, 1)];
        [set addCharactersInRange:NSMakeRange(0x1843, 1)];
        [set addCharactersInRange:NSMakeRange(0x1aa7, 1)];
        [set addCharactersInRange:NSMakeRange(0x1c78, 6)];
        [set addCharactersInRange:NSMakeRange(0x1d2c, 63)];
        [set addCharactersInRange:NSMakeRange(0x1d78, 1)];
        [set addCharactersInRange:NSMakeRange(0x1d9b, 37)];
        [set addCharactersInRange:NSMakeRange(0x2071, 1)];
        [set addCharactersInRange:NSMakeRange(0x207f, 1)];
        [set addCharactersInRange:NSMakeRange(0x2090, 13)];
        [set addCharactersInRange:NSMakeRange(0x2c7c, 2)];
        [set addCharactersInRange:NSMakeRange(0x2d6f, 1)];
        [set addCharactersInRange:NSMakeRange(0x2e2f, 1)];
        [set addCharactersInRange:NSMakeRange(0x3005, 1)];
        [set addCharactersInRange:NSMakeRange(0x3031, 5)];
        [set addCharactersInRange:NSMakeRange(0x303b, 1)];
        [set addCharactersInRange:NSMakeRange(0x309d, 2)];
        [set addCharactersInRange:NSMakeRange(0x30fc, 3)];
        [set addCharactersInRange:NSMakeRange(0xa015, 1)];
        [set addCharactersInRange:NSMakeRange(0xa4f8, 6)];
        [set addCharactersInRange:NSMakeRange(0xa60c, 1)];
        [set addCharactersInRange:NSMakeRange(0xa67f, 1)];
        [set addCharactersInRange:NSMakeRange(0xa69c, 2)];
        [set addCharactersInRange:NSMakeRange(0xa717, 9)];
        [set addCharactersInRange:NSMakeRange(0xa770, 1)];
        [set addCharactersInRange:NSMakeRange(0xa788, 1)];
        [set addCharactersInRange:NSMakeRange(0xa7f2, 3)];
        [set addCharactersInRange:NSMakeRange(0xa7f8, 2)];
        [set addCharactersInRange:NSMakeRange(0xa9cf, 1)];
        [set addCharactersInRange:NSMakeRange(0xa9e6, 1)];
        [set addCharactersInRange:NSMakeRange(0xaa70, 1)];
        [set addCharactersInRange:NSMakeRange(0xaadd, 1)];
        [set addCharactersInRange:NSMakeRange(0xaaf3, 2)];
        [set addCharactersInRange:NSMakeRange(0xab5c, 4)];
        [set addCharactersInRange:NSMakeRange(0xab69, 1)];
        [set addCharactersInRange:NSMakeRange(0xff70, 1)];
        [set addCharactersInRange:NSMakeRange(0xff9e, 2)];
        [set addCharactersInRange:NSMakeRange(0x10780, 6)];
        [set addCharactersInRange:NSMakeRange(0x10787, 42)];
        [set addCharactersInRange:NSMakeRange(0x107b2, 9)];
        [set addCharactersInRange:NSMakeRange(0x16b40, 4)];
        [set addCharactersInRange:NSMakeRange(0x16f93, 13)];
        [set addCharactersInRange:NSMakeRange(0x16fe0, 2)];
        [set addCharactersInRange:NSMakeRange(0x16fe3, 1)];
        [set addCharactersInRange:NSMakeRange(0x1aff0, 4)];
        [set addCharactersInRange:NSMakeRange(0x1aff5, 7)];
        [set addCharactersInRange:NSMakeRange(0x1affd, 2)];
        [set addCharactersInRange:NSMakeRange(0x1e137, 7)];
        [set addCharactersInRange:NSMakeRange(0x1e94b, 1)];
        characterSet = set;
    });
    return characterSet;
}

// Characters with the Default Ignorable Code Point (DI) property. See issue 9368.
// Download http://www.unicode.org/Public/UNIDATA/DerivedCoreProperties.txt and look for the
// Default_Ignorable_Code_point section. Give it as input to tools/default_ignorable.py
// Then add a hack for u+200b.
+ (instancetype)ignorableCharactersForUnicodeVersion:(NSInteger)version {
    static dispatch_once_t onceToken;
    static NSMutableCharacterSet *defaultIgnorables;
    dispatch_once(&onceToken, ^{
        defaultIgnorables = [[NSMutableCharacterSet alloc] init];
        [defaultIgnorables addCharactersInRange:NSMakeRange(0xad, 1)];
        [defaultIgnorables addCharactersInRange:NSMakeRange(0x34f, 1)];
        [defaultIgnorables addCharactersInRange:NSMakeRange(0x61c, 1)];
        [defaultIgnorables addCharactersInRange:NSMakeRange(0x115f, 2)];
        [defaultIgnorables addCharactersInRange:NSMakeRange(0x17b4, 2)];
        [defaultIgnorables addCharactersInRange:NSMakeRange(0x180b, 5)];
        if (![iTermAdvancedSettingsModel zeroWidthSpaceAdvancesCursor]) {
            // See issue 9786.
            [defaultIgnorables addCharactersInRange:NSMakeRange(0x200b, 1)];
        }
        [defaultIgnorables addCharactersInRange:NSMakeRange(0x200c, 4)];
        [defaultIgnorables addCharactersInRange:NSMakeRange(0x202a, 5)];
        [defaultIgnorables addCharactersInRange:NSMakeRange(0x2060, 16)];
        [defaultIgnorables addCharactersInRange:NSMakeRange(0x3164, 1)];
        [defaultIgnorables addCharactersInRange:NSMakeRange(0xfe00, 16)];
        [defaultIgnorables addCharactersInRange:NSMakeRange(0xfeff, 1)];
        [defaultIgnorables addCharactersInRange:NSMakeRange(0xffa0, 1)];
        [defaultIgnorables addCharactersInRange:NSMakeRange(0xfff0, 9)];
        [defaultIgnorables addCharactersInRange:NSMakeRange(0x1bca0, 4)];
        [defaultIgnorables addCharactersInRange:NSMakeRange(0x1d173, 8)];
        [defaultIgnorables addCharactersInRange:NSMakeRange(0xe0000, 4096)];
    });
    return defaultIgnorables;
}

+ (NSCharacterSet *)filenameCharacterSet {
    static NSMutableCharacterSet* filenameChars;
    if (!filenameChars) {
        filenameChars = [[NSCharacterSet whitespaceCharacterSet] mutableCopy];
        [filenameChars formUnionWithCharacterSet:[self urlCharacterSet]];
        [filenameChars formUnionWithCharacterSet:[NSCharacterSet characterSetWithCharactersInString:[iTermAdvancedSettingsModel filenameCharacterSet]]];
    }

    return filenameChars;
}

+ (NSCharacterSet *)urlCharacterSet {
    static NSMutableCharacterSet* urlChars;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *chars = [iTermAdvancedSettingsModel URLCharacterSet];
        urlChars = [NSMutableCharacterSet characterSetWithCharactersInString:chars];
        [urlChars formUnionWithCharacterSet:[NSCharacterSet idnCharacters]];
        [urlChars removeCharactersInString:[iTermAdvancedSettingsModel URLCharacterSetExclusions]];
    });

    return urlChars;
}

+ (NSCharacterSet *)emojiWithDefaultTextPresentation {
    static dispatch_once_t onceToken;
    static NSMutableCharacterSet *textPresentation;
    dispatch_once(&onceToken, ^{
        textPresentation = [[NSMutableCharacterSet alloc] init];
        [textPresentation addCharactersInRange:NSMakeRange(0x23, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2a, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x30, 10)];
        [textPresentation addCharactersInRange:NSMakeRange(0xa9, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0xae, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x203c, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2049, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2122, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2139, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2194, 6)];
        [textPresentation addCharactersInRange:NSMakeRange(0x21a9, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2328, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x23cf, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x23ed, 3)];
        [textPresentation addCharactersInRange:NSMakeRange(0x23f1, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x23f8, 3)];
        [textPresentation addCharactersInRange:NSMakeRange(0x24c2, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x25aa, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x25b6, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x25c0, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x25fb, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2600, 5)];
        [textPresentation addCharactersInRange:NSMakeRange(0x260e, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2611, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2618, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x261d, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2620, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2622, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2626, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x262a, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x262e, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2638, 3)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2640, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2642, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x265f, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2663, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2665, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2668, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x267b, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x267e, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2692, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2694, 4)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2699, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x269b, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x26a0, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x26a7, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x26b0, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x26c8, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x26cf, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x26d1, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x26d3, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x26e9, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x26f0, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x26f4, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x26f7, 3)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2702, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2708, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x270c, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x270f, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2712, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2714, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2716, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x271d, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2721, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2733, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2744, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2747, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2763, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x27a1, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2934, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x2b05, 3)];
        [textPresentation addCharactersInRange:NSMakeRange(0x3030, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x303d, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x3297, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x3299, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f170, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f17e, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f202, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f237, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f321, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f324, 9)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f336, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f37d, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f396, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f399, 3)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f39e, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f3cb, 4)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f3d4, 12)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f3f3, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f3f5, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f3f7, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f43f, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f441, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f4fd, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f549, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f56f, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f573, 7)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f587, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f58a, 4)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f590, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f5a5, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f5a8, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f5b1, 2)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f5bc, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f5c2, 3)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f5d1, 3)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f5dc, 3)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f5e1, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f5e3, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f5e8, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f5ef, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f5f3, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f5fa, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f6cb, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f6cd, 3)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f6e0, 6)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f6e9, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f6f0, 1)];
        [textPresentation addCharactersInRange:NSMakeRange(0x1f6f3, 1)];

    });
    return textPresentation;
}

// Emoji are added and not removed so this needs to be kept up to date with the most recent
// Unicode version.
// Use tools/emoji.py function output_default_emoji_presentation()
+ (NSCharacterSet *)emojiWithDefaultEmojiPresentation {
    static dispatch_once_t onceToken;
    static NSMutableCharacterSet *emojiPresentation;
    dispatch_once(&onceToken, ^{
        // NOTE: The smallest member must be at least iTermMinimumDefaultEmojiPresentationCodePoint.
        // If Unicode adds a new one, then adjust the constant.
        [emojiPresentation addCharactersInRange:NSMakeRange(0x231a, 2)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x23e9, 4)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x23f0, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x23f3, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x25fd, 2)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x2614, 2)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x2648, 12)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x267f, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x2693, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x26a1, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x26aa, 2)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x26bd, 2)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x26c4, 2)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x26ce, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x26d4, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x26ea, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x26f2, 2)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x26f5, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x26fa, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x26fd, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x2705, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x270a, 2)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x2728, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x274c, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x274e, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x2753, 3)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x2757, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x2795, 3)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x27b0, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x27bf, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x2b1b, 2)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x2b50, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x2b55, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f004, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f0cf, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f18e, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f191, 10)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f1e6, 26)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f201, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f21a, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f22f, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f232, 5)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f238, 3)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f250, 2)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f300, 33)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f32d, 9)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f337, 70)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f37e, 22)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f3a0, 43)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f3cf, 5)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f3e0, 17)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f3f4, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f3f8, 71)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f440, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f442, 187)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f4ff, 63)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f54b, 4)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f550, 24)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f57a, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f595, 2)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f5a4, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f5fb, 85)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f680, 70)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f6cc, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f6d0, 3)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f6d5, 3)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f6dc, 4)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f6eb, 2)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f6f4, 9)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f7e0, 12)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f7f0, 1)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f90c, 47)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f93c, 10)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1f947, 185)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1fa70, 13)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1fa80, 9)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1fa90, 46)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1fabf, 7)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1face, 14)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1fae0, 9)];
        [emojiPresentation addCharactersInRange:NSMakeRange(0x1faf0, 9)];
    });
    return emojiPresentation;
}

+ (NSCharacterSet *)modifierCharactersForcingFullWidthRendition {
    static NSMutableCharacterSet *characters;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        characters = [[NSMutableCharacterSet alloc] init];
        // From TR51. The presence of any of these characters as a modifier is sufficient to imply
        // emoji presentation.
        // VS16
        [characters addCharactersInRange:NSMakeRange(0xfe0f, 1)];
        // Skintone Modifiers
        [characters addCharactersInRange:NSMakeRange(0x1f3fb, 5)];
    });
    return characters;
}

+ (instancetype)emojiAcceptingVS16 {
    static dispatch_once_t onceToken;
    static NSMutableCharacterSet *emoji;
    dispatch_once(&onceToken, ^{
        emoji = [[NSMutableCharacterSet alloc] init];
        [emoji addCharactersInRange:NSMakeRange(0xa9, 1)];
        [emoji addCharactersInRange:NSMakeRange(0xae, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x203c, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2049, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2122, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2139, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2194, 6)];
        [emoji addCharactersInRange:NSMakeRange(0x21a9, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x2328, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x23cf, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x23ed, 3)];
        [emoji addCharactersInRange:NSMakeRange(0x23f1, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x23f8, 3)];
        [emoji addCharactersInRange:NSMakeRange(0x24c2, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x25aa, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x25b6, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x25c0, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x25fb, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x2600, 5)];
        [emoji addCharactersInRange:NSMakeRange(0x260e, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2611, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2618, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x261d, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2620, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2622, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x2626, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x262a, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x262e, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x2638, 3)];
        [emoji addCharactersInRange:NSMakeRange(0x2640, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2642, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x265f, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x2663, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2665, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x2668, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x267b, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x267e, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2692, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2694, 4)];
        [emoji addCharactersInRange:NSMakeRange(0x2699, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x269b, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x26a0, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x26a7, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x26b0, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x26c8, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x26cf, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x26d1, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x26d3, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x26e9, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x26f0, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x26f4, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x26f7, 3)];
        [emoji addCharactersInRange:NSMakeRange(0x2702, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2708, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x270c, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x270f, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2712, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2714, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2716, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x271d, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2721, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2733, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x2744, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2747, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2763, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x27a1, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2934, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x2b05, 3)];
        [emoji addCharactersInRange:NSMakeRange(0x3030, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x303d, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x3297, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x3299, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f170, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x1f17e, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x1f202, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f237, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f321, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f324, 9)];
        [emoji addCharactersInRange:NSMakeRange(0x1f336, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f37d, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f396, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x1f399, 3)];
        [emoji addCharactersInRange:NSMakeRange(0x1f39e, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x1f3cb, 4)];
        [emoji addCharactersInRange:NSMakeRange(0x1f3d4, 12)];
        [emoji addCharactersInRange:NSMakeRange(0x1f3f3, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f3f5, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f3f7, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f43f, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f441, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f4fd, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f549, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x1f56f, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x1f573, 7)];
        [emoji addCharactersInRange:NSMakeRange(0x1f587, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f58a, 4)];
        [emoji addCharactersInRange:NSMakeRange(0x1f590, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f5a5, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f5a8, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f5b1, 2)];
        [emoji addCharactersInRange:NSMakeRange(0x1f5bc, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f5c2, 3)];
        [emoji addCharactersInRange:NSMakeRange(0x1f5d1, 3)];
        [emoji addCharactersInRange:NSMakeRange(0x1f5dc, 3)];
        [emoji addCharactersInRange:NSMakeRange(0x1f5e1, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f5e3, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f5e8, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f5ef, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f5f3, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f5fa, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f6cb, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f6cd, 3)];
        [emoji addCharactersInRange:NSMakeRange(0x1f6e0, 6)];
        [emoji addCharactersInRange:NSMakeRange(0x1f6e9, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f6f0, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x1f6f3, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x23, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x2a, 1)];
        [emoji addCharactersInRange:NSMakeRange(0x30, 10)];
    });
    return emoji;
}

+ (NSCharacterSet *)flagCharactersForUnicodeVersion:(NSInteger)version {
    if (version < 9) {
        return [NSCharacterSet characterSetWithCharactersInString:@""];
    }

    static dispatch_once_t onceToken;
    static NSMutableCharacterSet *characterSet;
    dispatch_once(&onceToken, ^{
        characterSet = [[NSMutableCharacterSet alloc] init];
        // Emoji flag sequences:
        [characterSet addCharactersInRange:NSMakeRange(0x1F1E6, 0x1F200 - 0x1F1E6)];
        // Emoji tag sequences:
        [characterSet addCharactersInRange:NSMakeRange(0x1F3F4, 1)];
    });
    return characterSet;
}

// Run tools/bidi.py to generate this
+ (NSCharacterSet *)rtlSmellingCodePoints {
    static dispatch_once_t onceToken;
    static NSCharacterSet *characterSet;
    dispatch_once(&onceToken, ^{
        NSMutableCharacterSet *mutableCharacterSet = [[NSMutableCharacterSet alloc] init];
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x5be, 1)];  // HEBREW PUNCTUATION MAQAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x5c0, 1)];  // HEBREW PUNCTUATION PASEQ
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x5c3, 1)];  // HEBREW PUNCTUATION SOF PASUQ
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x5c6, 1)];  // HEBREW PUNCTUATION NUN HAFUKHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x5d0, 27)];  // HEBREW LETTER ALEF...HEBREW LETTER TAV
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x5ef, 6)];  // HEBREW YOD TRIANGLE...HEBREW PUNCTUATION GERSHAYIM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x600, 6)];  // ARABIC NUMBER SIGN...ARABIC NUMBER MARK ABOVE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x608, 1)];  // ARABIC RAY
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x60b, 1)];  // AFGHANI SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x60d, 1)];  // ARABIC DATE SEPARATOR
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x61b, 48)];  // ARABIC SEMICOLON...ARABIC LETTER YEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x660, 10)];  // ARABIC-INDIC DIGIT ZERO...ARABIC-INDIC DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x66b, 5)];  // ARABIC DECIMAL SEPARATOR...ARABIC LETTER DOTLESS QAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x671, 101)];  // ARABIC LETTER ALEF WASLA...ARABIC LETTER AE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x6dd, 1)];  // ARABIC END OF AYAH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x6e5, 2)];  // ARABIC SMALL WAW...ARABIC SMALL YEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x6ee, 2)];  // ARABIC LETTER DAL WITH INVERTED V...ARABIC LETTER REH WITH INVERTED V
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x6fa, 20)];  // ARABIC LETTER SHEEN WITH DOT BELOW...SYRIAC HARKLEAN ASTERISCUS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x70f, 2)];  // SYRIAC ABBREVIATION MARK...SYRIAC LETTER ALAPH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x712, 30)];  // SYRIAC LETTER BETH...SYRIAC LETTER PERSIAN DHALATH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x74d, 89)];  // SYRIAC LETTER SOGDIAN ZHAIN...THAANA LETTER WAAVU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x7b1, 1)];  // THAANA LETTER NAA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x7c0, 43)];  // NKO DIGIT ZERO...NKO LETTER JONA RA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x7f4, 2)];  // NKO HIGH TONE APOSTROPHE...NKO LOW TONE APOSTROPHE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x7fa, 1)];  // NKO LAJANYALAN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x7fe, 24)];  // NKO DOROME SIGN...SAMARITAN LETTER TAAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x81a, 1)];  // SAMARITAN MODIFIER LETTER EPENTHETIC YUT
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x824, 1)];  // SAMARITAN MODIFIER LETTER SHORT A
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x828, 1)];  // SAMARITAN MODIFIER LETTER I
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x830, 15)];  // SAMARITAN PUNCTUATION NEQUDAA...SAMARITAN PUNCTUATION ANNAAU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x840, 25)];  // MANDAIC LETTER HALQA...MANDAIC LETTER AIN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x85e, 1)];  // MANDAIC PUNCTUATION
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x860, 11)];  // SYRIAC LETTER MALAYALAM NGA...SYRIAC LETTER MALAYALAM SSA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x870, 31)];  // ARABIC LETTER ALEF WITH ATTACHED FATHA...ARABIC VERTICAL TAIL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x890, 2)];  // ARABIC POUND MARK ABOVE...ARABIC PIASTRE MARK ABOVE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x8a0, 42)];  // ARABIC LETTER BEH WITH SMALL V BELOW...ARABIC SMALL FARSI YEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x8e2, 1)];  // ARABIC DISPUTED END OF AYAH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x200f, 1)];  // RIGHT-TO-LEFT MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x202a, 5)];  // LEFT-TO-RIGHT EMBEDDING...RIGHT-TO-LEFT OVERRIDE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2066, 4)];  // LEFT-TO-RIGHT ISOLATE...POP DIRECTIONAL ISOLATE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb1d, 1)];  // HEBREW LETTER YOD WITH HIRIQ
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb1f, 10)];  // HEBREW LIGATURE YIDDISH YOD YOD PATAH...HEBREW LETTER WIDE TAV
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb2a, 13)];  // HEBREW LETTER SHIN WITH SHIN DOT...HEBREW LETTER ZAYIN WITH DAGESH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb38, 5)];  // HEBREW LETTER TET WITH DAGESH...HEBREW LETTER LAMED WITH DAGESH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb3e, 1)];  // HEBREW LETTER MEM WITH DAGESH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb40, 2)];  // HEBREW LETTER NUN WITH DAGESH...HEBREW LETTER SAMEKH WITH DAGESH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb43, 2)];  // HEBREW LETTER FINAL PE WITH DAGESH...HEBREW LETTER PE WITH DAGESH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb46, 125)];  // HEBREW LETTER TSADI WITH DAGESH...ARABIC SYMBOL WASLA ABOVE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfbd3, 363)];  // ARABIC LETTER NG ISOLATED FORM...ARABIC LIGATURE ALEF WITH FATHATAN ISOLATED FORM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfd50, 64)];  // ARABIC LIGATURE TEH WITH JEEM WITH MEEM INITIAL FORM...ARABIC LIGATURE MEEM WITH KHAH WITH MEEM INITIAL FORM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfd92, 54)];  // ARABIC LIGATURE MEEM WITH JEEM WITH KHAH INITIAL FORM...ARABIC LIGATURE NOON WITH JEEM WITH YEH FINAL FORM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfdf0, 13)];  // ARABIC LIGATURE SALLA USED AS KORANIC STOP SIGN ISOLATED FORM...RIAL SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfe70, 5)];  // ARABIC FATHATAN ISOLATED FORM...ARABIC KASRATAN ISOLATED FORM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfe76, 135)];  // ARABIC FATHA ISOLATED FORM...ARABIC LIGATURE LAM WITH ALEF FINAL FORM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10800, 6)];  // CYPRIOT SYLLABLE A...CYPRIOT SYLLABLE JA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10808, 1)];  // CYPRIOT SYLLABLE JO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1080a, 44)];  // CYPRIOT SYLLABLE KA...CYPRIOT SYLLABLE WO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10837, 2)];  // CYPRIOT SYLLABLE XA...CYPRIOT SYLLABLE XE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1083c, 1)];  // CYPRIOT SYLLABLE ZA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1083f, 23)];  // CYPRIOT SYLLABLE ZO...IMPERIAL ARAMAIC LETTER TAW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10857, 72)];  // IMPERIAL ARAMAIC SECTION SIGN...NABATAEAN LETTER TAW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x108a7, 9)];  // NABATAEAN NUMBER ONE...NABATAEAN NUMBER ONE HUNDRED
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x108e0, 19)];  // HATRAN LETTER ALEPH...HATRAN LETTER QOPH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x108f4, 2)];  // HATRAN LETTER SHIN...HATRAN LETTER TAW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x108fb, 33)];  // HATRAN NUMBER ONE...PHOENICIAN NUMBER THREE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10920, 26)];  // LYDIAN LETTER A...LYDIAN LETTER C
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1093f, 1)];  // LYDIAN TRIANGULAR MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10980, 56)];  // MEROITIC HIEROGLYPHIC LETTER A...MEROITIC CURSIVE LETTER DA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x109bc, 20)];  // MEROITIC CURSIVE FRACTION ELEVEN TWELFTHS...MEROITIC CURSIVE NUMBER SEVENTY
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x109d2, 47)];  // MEROITIC CURSIVE NUMBER ONE HUNDRED...KHAROSHTHI LETTER A
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10a10, 4)];  // KHAROSHTHI LETTER KA...KHAROSHTHI LETTER GHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10a15, 3)];  // KHAROSHTHI LETTER CA...KHAROSHTHI LETTER JA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10a19, 29)];  // KHAROSHTHI LETTER NYA...KHAROSHTHI LETTER VHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10a40, 9)];  // KHAROSHTHI DIGIT ONE...KHAROSHTHI FRACTION ONE HALF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10a50, 9)];  // KHAROSHTHI PUNCTUATION DOT...KHAROSHTHI PUNCTUATION LINES
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10a60, 64)];  // OLD SOUTH ARABIAN LETTER HE...OLD NORTH ARABIAN NUMBER TWENTY
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10ac0, 37)];  // MANICHAEAN LETTER ALEPH...MANICHAEAN LETTER TAW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10aeb, 12)];  // MANICHAEAN NUMBER ONE...MANICHAEAN PUNCTUATION LINE FILLER
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10b00, 54)];  // AVESTAN LETTER A...AVESTAN LETTER HE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10b40, 22)];  // INSCRIPTIONAL PARTHIAN LETTER ALEPH...INSCRIPTIONAL PARTHIAN LETTER TAW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10b58, 27)];  // INSCRIPTIONAL PARTHIAN NUMBER ONE...INSCRIPTIONAL PAHLAVI LETTER TAW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10b78, 26)];  // INSCRIPTIONAL PAHLAVI NUMBER ONE...PSALTER PAHLAVI LETTER TAW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10b99, 4)];  // PSALTER PAHLAVI SECTION MARK...PSALTER PAHLAVI FOUR DOTS WITH DOT
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10ba9, 7)];  // PSALTER PAHLAVI NUMBER ONE...PSALTER PAHLAVI NUMBER ONE HUNDRED
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10c00, 73)];  // OLD TURKIC LETTER ORKHON A...OLD TURKIC LETTER ORKHON BASH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10c80, 51)];  // OLD HUNGARIAN CAPITAL LETTER A...OLD HUNGARIAN CAPITAL LETTER US
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10cc0, 51)];  // OLD HUNGARIAN SMALL LETTER A...OLD HUNGARIAN SMALL LETTER US
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10cfa, 42)];  // OLD HUNGARIAN NUMBER ONE...HANIFI ROHINGYA MARK NA KHONNA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10d30, 10)];  // HANIFI ROHINGYA DIGIT ZERO...HANIFI ROHINGYA DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10d40, 38)];  // GARAY DIGIT ZERO...GARAY CAPITAL LETTER OLD NA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10d6f, 23)];  // GARAY REDUPLICATION MARK...GARAY SMALL LETTER OLD NA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10d8e, 2)];  // GARAY PLUS SIGN...GARAY MINUS SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10e60, 31)];  // RUMI DIGIT ONE...RUMI FRACTION TWO THIRDS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10e80, 42)];  // YEZIDI LETTER ELIF...YEZIDI LETTER ET
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10ead, 1)];  // YEZIDI HYPHENATION MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10eb0, 2)];  // YEZIDI LETTER LAM WITH DOT ABOVE...YEZIDI LETTER YOT WITH CIRCUMFLEX ABOVE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10ec2, 3)];  // ARABIC LETTER DAL WITH TWO DOTS VERTICALLY BELOW...ARABIC LETTER KAF WITH TWO DOTS VERTICALLY BELOW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10f00, 40)];  // OLD SOGDIAN LETTER ALEPH...OLD SOGDIAN LIGATURE AYIN-DALETH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10f30, 22)];  // SOGDIAN LETTER ALEPH...SOGDIAN INDEPENDENT SHIN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10f51, 9)];  // SOGDIAN NUMBER ONE...SOGDIAN PUNCTUATION HALF CIRCLE WITH DOT
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10f70, 18)];  // OLD UYGHUR LETTER ALEPH...OLD UYGHUR LETTER LESH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10f86, 4)];  // OLD UYGHUR PUNCTUATION BAR...OLD UYGHUR PUNCTUATION FOUR DOTS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10fb0, 28)];  // CHORASMIAN LETTER ALEPH...CHORASMIAN NUMBER ONE HUNDRED
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10fe0, 23)];  // ELYMAIC LETTER ALEPH...ELYMAIC LIGATURE ZAYIN-YODH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e800, 197)];  // MENDE KIKAKUI SYLLABLE M001 KI...MENDE KIKAKUI SYLLABLE M060 NYON
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e8c7, 9)];  // MENDE KIKAKUI DIGIT ONE...MENDE KIKAKUI DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e900, 68)];  // ADLAM CAPITAL LETTER ALIF...ADLAM SMALL LETTER SHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e94b, 1)];  // ADLAM NASALIZATION MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e950, 10)];  // ADLAM DIGIT ZERO...ADLAM DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e95e, 2)];  // ADLAM INITIAL EXCLAMATION MARK...ADLAM INITIAL QUESTION MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ec71, 68)];  // INDIC SIYAQ NUMBER ONE...INDIC SIYAQ ALTERNATE LAKH MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ed01, 61)];  // OTTOMAN SIYAQ NUMBER ONE...OTTOMAN SIYAQ FRACTION ONE SIXTH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee00, 4)];  // ARABIC MATHEMATICAL ALEF...ARABIC MATHEMATICAL DAL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee05, 27)];  // ARABIC MATHEMATICAL WAW...ARABIC MATHEMATICAL DOTLESS QAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee21, 2)];  // ARABIC MATHEMATICAL INITIAL BEH...ARABIC MATHEMATICAL INITIAL JEEM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee24, 1)];  // ARABIC MATHEMATICAL INITIAL HEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee27, 1)];  // ARABIC MATHEMATICAL INITIAL HAH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee29, 10)];  // ARABIC MATHEMATICAL INITIAL YEH...ARABIC MATHEMATICAL INITIAL QAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee34, 4)];  // ARABIC MATHEMATICAL INITIAL SHEEN...ARABIC MATHEMATICAL INITIAL KHAH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee39, 1)];  // ARABIC MATHEMATICAL INITIAL DAD
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee3b, 1)];  // ARABIC MATHEMATICAL INITIAL GHAIN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee42, 1)];  // ARABIC MATHEMATICAL TAILED JEEM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee47, 1)];  // ARABIC MATHEMATICAL TAILED HAH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee49, 1)];  // ARABIC MATHEMATICAL TAILED YEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee4b, 1)];  // ARABIC MATHEMATICAL TAILED LAM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee4d, 3)];  // ARABIC MATHEMATICAL TAILED NOON...ARABIC MATHEMATICAL TAILED AIN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee51, 2)];  // ARABIC MATHEMATICAL TAILED SAD...ARABIC MATHEMATICAL TAILED QAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee54, 1)];  // ARABIC MATHEMATICAL TAILED SHEEN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee57, 1)];  // ARABIC MATHEMATICAL TAILED KHAH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee59, 1)];  // ARABIC MATHEMATICAL TAILED DAD
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee5b, 1)];  // ARABIC MATHEMATICAL TAILED GHAIN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee5d, 1)];  // ARABIC MATHEMATICAL TAILED DOTLESS NOON
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee5f, 1)];  // ARABIC MATHEMATICAL TAILED DOTLESS QAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee61, 2)];  // ARABIC MATHEMATICAL STRETCHED BEH...ARABIC MATHEMATICAL STRETCHED JEEM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee64, 1)];  // ARABIC MATHEMATICAL STRETCHED HEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee67, 4)];  // ARABIC MATHEMATICAL STRETCHED HAH...ARABIC MATHEMATICAL STRETCHED KAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee6c, 7)];  // ARABIC MATHEMATICAL STRETCHED MEEM...ARABIC MATHEMATICAL STRETCHED QAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee74, 4)];  // ARABIC MATHEMATICAL STRETCHED SHEEN...ARABIC MATHEMATICAL STRETCHED KHAH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee79, 4)];  // ARABIC MATHEMATICAL STRETCHED DAD...ARABIC MATHEMATICAL STRETCHED DOTLESS BEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee7e, 1)];  // ARABIC MATHEMATICAL STRETCHED DOTLESS FEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee80, 10)];  // ARABIC MATHEMATICAL LOOPED ALEF...ARABIC MATHEMATICAL LOOPED YEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee8b, 17)];  // ARABIC MATHEMATICAL LOOPED LAM...ARABIC MATHEMATICAL LOOPED GHAIN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1eea1, 3)];  // ARABIC MATHEMATICAL DOUBLE-STRUCK BEH...ARABIC MATHEMATICAL DOUBLE-STRUCK DAL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1eea5, 5)];  // ARABIC MATHEMATICAL DOUBLE-STRUCK WAW...ARABIC MATHEMATICAL DOUBLE-STRUCK YEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1eeab, 17)];  // ARABIC MATHEMATICAL DOUBLE-STRUCK LAM...ARABIC MATHEMATICAL DOUBLE-STRUCK GHAIN
        characterSet = mutableCharacterSet;
    });
    return characterSet;
}

// Strong RTL code points
// Run tools/bidi.py to generate this
+ (NSCharacterSet *)strongRTLCodePoints {
    static dispatch_once_t onceToken;
    static NSCharacterSet *characterSet;
    dispatch_once(&onceToken, ^{
        NSMutableCharacterSet *mutableCharacterSet = [[NSMutableCharacterSet alloc] init];
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x5be, 1)];  // HEBREW PUNCTUATION MAQAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x5c0, 1)];  // HEBREW PUNCTUATION PASEQ
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x5c3, 1)];  // HEBREW PUNCTUATION SOF PASUQ
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x5c6, 1)];  // HEBREW PUNCTUATION NUN HAFUKHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x5d0, 27)];  // HEBREW LETTER ALEF...HEBREW LETTER TAV
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x5ef, 6)];  // HEBREW YOD TRIANGLE...HEBREW PUNCTUATION GERSHAYIM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x608, 1)];  // ARABIC RAY
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x60b, 1)];  // AFGHANI SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x60d, 1)];  // ARABIC DATE SEPARATOR
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x61b, 48)];  // ARABIC SEMICOLON...ARABIC LETTER YEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x66d, 3)];  // ARABIC FIVE POINTED STAR...ARABIC LETTER DOTLESS QAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x671, 101)];  // ARABIC LETTER ALEF WASLA...ARABIC LETTER AE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x6e5, 2)];  // ARABIC SMALL WAW...ARABIC SMALL YEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x6ee, 2)];  // ARABIC LETTER DAL WITH INVERTED V...ARABIC LETTER REH WITH INVERTED V
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x6fa, 20)];  // ARABIC LETTER SHEEN WITH DOT BELOW...SYRIAC HARKLEAN ASTERISCUS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x70f, 2)];  // SYRIAC ABBREVIATION MARK...SYRIAC LETTER ALAPH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x712, 30)];  // SYRIAC LETTER BETH...SYRIAC LETTER PERSIAN DHALATH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x74d, 89)];  // SYRIAC LETTER SOGDIAN ZHAIN...THAANA LETTER WAAVU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x7b1, 1)];  // THAANA LETTER NAA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x7c0, 43)];  // NKO DIGIT ZERO...NKO LETTER JONA RA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x7f4, 2)];  // NKO HIGH TONE APOSTROPHE...NKO LOW TONE APOSTROPHE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x7fa, 1)];  // NKO LAJANYALAN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x7fe, 24)];  // NKO DOROME SIGN...SAMARITAN LETTER TAAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x81a, 1)];  // SAMARITAN MODIFIER LETTER EPENTHETIC YUT
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x824, 1)];  // SAMARITAN MODIFIER LETTER SHORT A
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x828, 1)];  // SAMARITAN MODIFIER LETTER I
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x830, 15)];  // SAMARITAN PUNCTUATION NEQUDAA...SAMARITAN PUNCTUATION ANNAAU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x840, 25)];  // MANDAIC LETTER HALQA...MANDAIC LETTER AIN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x85e, 1)];  // MANDAIC PUNCTUATION
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x860, 11)];  // SYRIAC LETTER MALAYALAM NGA...SYRIAC LETTER MALAYALAM SSA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x870, 31)];  // ARABIC LETTER ALEF WITH ATTACHED FATHA...ARABIC VERTICAL TAIL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x8a0, 42)];  // ARABIC LETTER BEH WITH SMALL V BELOW...ARABIC SMALL FARSI YEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x200f, 1)];  // RIGHT-TO-LEFT MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb1d, 1)];  // HEBREW LETTER YOD WITH HIRIQ
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb1f, 10)];  // HEBREW LIGATURE YIDDISH YOD YOD PATAH...HEBREW LETTER WIDE TAV
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb2a, 13)];  // HEBREW LETTER SHIN WITH SHIN DOT...HEBREW LETTER ZAYIN WITH DAGESH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb38, 5)];  // HEBREW LETTER TET WITH DAGESH...HEBREW LETTER LAMED WITH DAGESH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb3e, 1)];  // HEBREW LETTER MEM WITH DAGESH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb40, 2)];  // HEBREW LETTER NUN WITH DAGESH...HEBREW LETTER SAMEKH WITH DAGESH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb43, 2)];  // HEBREW LETTER FINAL PE WITH DAGESH...HEBREW LETTER PE WITH DAGESH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb46, 125)];  // HEBREW LETTER TSADI WITH DAGESH...ARABIC SYMBOL WASLA ABOVE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfbd3, 363)];  // ARABIC LETTER NG ISOLATED FORM...ARABIC LIGATURE ALEF WITH FATHATAN ISOLATED FORM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfd50, 64)];  // ARABIC LIGATURE TEH WITH JEEM WITH MEEM INITIAL FORM...ARABIC LIGATURE MEEM WITH KHAH WITH MEEM INITIAL FORM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfd92, 54)];  // ARABIC LIGATURE MEEM WITH JEEM WITH KHAH INITIAL FORM...ARABIC LIGATURE NOON WITH JEEM WITH YEH FINAL FORM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfdf0, 13)];  // ARABIC LIGATURE SALLA USED AS KORANIC STOP SIGN ISOLATED FORM...RIAL SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfe70, 5)];  // ARABIC FATHATAN ISOLATED FORM...ARABIC KASRATAN ISOLATED FORM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfe76, 135)];  // ARABIC FATHA ISOLATED FORM...ARABIC LIGATURE LAM WITH ALEF FINAL FORM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10800, 6)];  // CYPRIOT SYLLABLE A...CYPRIOT SYLLABLE JA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10808, 1)];  // CYPRIOT SYLLABLE JO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1080a, 44)];  // CYPRIOT SYLLABLE KA...CYPRIOT SYLLABLE WO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10837, 2)];  // CYPRIOT SYLLABLE XA...CYPRIOT SYLLABLE XE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1083c, 1)];  // CYPRIOT SYLLABLE ZA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1083f, 23)];  // CYPRIOT SYLLABLE ZO...IMPERIAL ARAMAIC LETTER TAW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10857, 72)];  // IMPERIAL ARAMAIC SECTION SIGN...NABATAEAN LETTER TAW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x108a7, 9)];  // NABATAEAN NUMBER ONE...NABATAEAN NUMBER ONE HUNDRED
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x108e0, 19)];  // HATRAN LETTER ALEPH...HATRAN LETTER QOPH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x108f4, 2)];  // HATRAN LETTER SHIN...HATRAN LETTER TAW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x108fb, 33)];  // HATRAN NUMBER ONE...PHOENICIAN NUMBER THREE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10920, 26)];  // LYDIAN LETTER A...LYDIAN LETTER C
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1093f, 1)];  // LYDIAN TRIANGULAR MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10980, 56)];  // MEROITIC HIEROGLYPHIC LETTER A...MEROITIC CURSIVE LETTER DA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x109bc, 20)];  // MEROITIC CURSIVE FRACTION ELEVEN TWELFTHS...MEROITIC CURSIVE NUMBER SEVENTY
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x109d2, 47)];  // MEROITIC CURSIVE NUMBER ONE HUNDRED...KHAROSHTHI LETTER A
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10a10, 4)];  // KHAROSHTHI LETTER KA...KHAROSHTHI LETTER GHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10a15, 3)];  // KHAROSHTHI LETTER CA...KHAROSHTHI LETTER JA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10a19, 29)];  // KHAROSHTHI LETTER NYA...KHAROSHTHI LETTER VHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10a40, 9)];  // KHAROSHTHI DIGIT ONE...KHAROSHTHI FRACTION ONE HALF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10a50, 9)];  // KHAROSHTHI PUNCTUATION DOT...KHAROSHTHI PUNCTUATION LINES
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10a60, 64)];  // OLD SOUTH ARABIAN LETTER HE...OLD NORTH ARABIAN NUMBER TWENTY
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10ac0, 37)];  // MANICHAEAN LETTER ALEPH...MANICHAEAN LETTER TAW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10aeb, 12)];  // MANICHAEAN NUMBER ONE...MANICHAEAN PUNCTUATION LINE FILLER
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10b00, 54)];  // AVESTAN LETTER A...AVESTAN LETTER HE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10b40, 22)];  // INSCRIPTIONAL PARTHIAN LETTER ALEPH...INSCRIPTIONAL PARTHIAN LETTER TAW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10b58, 27)];  // INSCRIPTIONAL PARTHIAN NUMBER ONE...INSCRIPTIONAL PAHLAVI LETTER TAW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10b78, 26)];  // INSCRIPTIONAL PAHLAVI NUMBER ONE...PSALTER PAHLAVI LETTER TAW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10b99, 4)];  // PSALTER PAHLAVI SECTION MARK...PSALTER PAHLAVI FOUR DOTS WITH DOT
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10ba9, 7)];  // PSALTER PAHLAVI NUMBER ONE...PSALTER PAHLAVI NUMBER ONE HUNDRED
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10c00, 73)];  // OLD TURKIC LETTER ORKHON A...OLD TURKIC LETTER ORKHON BASH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10c80, 51)];  // OLD HUNGARIAN CAPITAL LETTER A...OLD HUNGARIAN CAPITAL LETTER US
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10cc0, 51)];  // OLD HUNGARIAN SMALL LETTER A...OLD HUNGARIAN SMALL LETTER US
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10cfa, 42)];  // OLD HUNGARIAN NUMBER ONE...HANIFI ROHINGYA MARK NA KHONNA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10d4a, 28)];  // GARAY VOWEL SIGN A...GARAY CAPITAL LETTER OLD NA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10d6f, 23)];  // GARAY REDUPLICATION MARK...GARAY SMALL LETTER OLD NA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10d8e, 2)];  // GARAY PLUS SIGN...GARAY MINUS SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10e80, 42)];  // YEZIDI LETTER ELIF...YEZIDI LETTER ET
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10ead, 1)];  // YEZIDI HYPHENATION MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10eb0, 2)];  // YEZIDI LETTER LAM WITH DOT ABOVE...YEZIDI LETTER YOT WITH CIRCUMFLEX ABOVE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10ec2, 3)];  // ARABIC LETTER DAL WITH TWO DOTS VERTICALLY BELOW...ARABIC LETTER KAF WITH TWO DOTS VERTICALLY BELOW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10f00, 40)];  // OLD SOGDIAN LETTER ALEPH...OLD SOGDIAN LIGATURE AYIN-DALETH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10f30, 22)];  // SOGDIAN LETTER ALEPH...SOGDIAN INDEPENDENT SHIN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10f51, 9)];  // SOGDIAN NUMBER ONE...SOGDIAN PUNCTUATION HALF CIRCLE WITH DOT
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10f70, 18)];  // OLD UYGHUR LETTER ALEPH...OLD UYGHUR LETTER LESH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10f86, 4)];  // OLD UYGHUR PUNCTUATION BAR...OLD UYGHUR PUNCTUATION FOUR DOTS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10fb0, 28)];  // CHORASMIAN LETTER ALEPH...CHORASMIAN NUMBER ONE HUNDRED
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10fe0, 23)];  // ELYMAIC LETTER ALEPH...ELYMAIC LIGATURE ZAYIN-YODH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e800, 197)];  // MENDE KIKAKUI SYLLABLE M001 KI...MENDE KIKAKUI SYLLABLE M060 NYON
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e8c7, 9)];  // MENDE KIKAKUI DIGIT ONE...MENDE KIKAKUI DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e900, 68)];  // ADLAM CAPITAL LETTER ALIF...ADLAM SMALL LETTER SHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e94b, 1)];  // ADLAM NASALIZATION MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e950, 10)];  // ADLAM DIGIT ZERO...ADLAM DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e95e, 2)];  // ADLAM INITIAL EXCLAMATION MARK...ADLAM INITIAL QUESTION MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ec71, 68)];  // INDIC SIYAQ NUMBER ONE...INDIC SIYAQ ALTERNATE LAKH MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ed01, 61)];  // OTTOMAN SIYAQ NUMBER ONE...OTTOMAN SIYAQ FRACTION ONE SIXTH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee00, 4)];  // ARABIC MATHEMATICAL ALEF...ARABIC MATHEMATICAL DAL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee05, 27)];  // ARABIC MATHEMATICAL WAW...ARABIC MATHEMATICAL DOTLESS QAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee21, 2)];  // ARABIC MATHEMATICAL INITIAL BEH...ARABIC MATHEMATICAL INITIAL JEEM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee24, 1)];  // ARABIC MATHEMATICAL INITIAL HEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee27, 1)];  // ARABIC MATHEMATICAL INITIAL HAH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee29, 10)];  // ARABIC MATHEMATICAL INITIAL YEH...ARABIC MATHEMATICAL INITIAL QAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee34, 4)];  // ARABIC MATHEMATICAL INITIAL SHEEN...ARABIC MATHEMATICAL INITIAL KHAH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee39, 1)];  // ARABIC MATHEMATICAL INITIAL DAD
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee3b, 1)];  // ARABIC MATHEMATICAL INITIAL GHAIN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee42, 1)];  // ARABIC MATHEMATICAL TAILED JEEM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee47, 1)];  // ARABIC MATHEMATICAL TAILED HAH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee49, 1)];  // ARABIC MATHEMATICAL TAILED YEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee4b, 1)];  // ARABIC MATHEMATICAL TAILED LAM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee4d, 3)];  // ARABIC MATHEMATICAL TAILED NOON...ARABIC MATHEMATICAL TAILED AIN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee51, 2)];  // ARABIC MATHEMATICAL TAILED SAD...ARABIC MATHEMATICAL TAILED QAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee54, 1)];  // ARABIC MATHEMATICAL TAILED SHEEN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee57, 1)];  // ARABIC MATHEMATICAL TAILED KHAH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee59, 1)];  // ARABIC MATHEMATICAL TAILED DAD
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee5b, 1)];  // ARABIC MATHEMATICAL TAILED GHAIN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee5d, 1)];  // ARABIC MATHEMATICAL TAILED DOTLESS NOON
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee5f, 1)];  // ARABIC MATHEMATICAL TAILED DOTLESS QAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee61, 2)];  // ARABIC MATHEMATICAL STRETCHED BEH...ARABIC MATHEMATICAL STRETCHED JEEM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee64, 1)];  // ARABIC MATHEMATICAL STRETCHED HEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee67, 4)];  // ARABIC MATHEMATICAL STRETCHED HAH...ARABIC MATHEMATICAL STRETCHED KAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee6c, 7)];  // ARABIC MATHEMATICAL STRETCHED MEEM...ARABIC MATHEMATICAL STRETCHED QAF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee74, 4)];  // ARABIC MATHEMATICAL STRETCHED SHEEN...ARABIC MATHEMATICAL STRETCHED KHAH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee79, 4)];  // ARABIC MATHEMATICAL STRETCHED DAD...ARABIC MATHEMATICAL STRETCHED DOTLESS BEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee7e, 1)];  // ARABIC MATHEMATICAL STRETCHED DOTLESS FEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee80, 10)];  // ARABIC MATHEMATICAL LOOPED ALEF...ARABIC MATHEMATICAL LOOPED YEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ee8b, 17)];  // ARABIC MATHEMATICAL LOOPED LAM...ARABIC MATHEMATICAL LOOPED GHAIN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1eea1, 3)];  // ARABIC MATHEMATICAL DOUBLE-STRUCK BEH...ARABIC MATHEMATICAL DOUBLE-STRUCK DAL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1eea5, 5)];  // ARABIC MATHEMATICAL DOUBLE-STRUCK WAW...ARABIC MATHEMATICAL DOUBLE-STRUCK YEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1eeab, 17)];  // ARABIC MATHEMATICAL DOUBLE-STRUCK LAM...ARABIC MATHEMATICAL DOUBLE-STRUCK GHAIN

        characterSet = mutableCharacterSet;
    });
    return characterSet;
}

// Strong LTR code points
// Run tools/bidi.py to generate this
+ (NSCharacterSet *)strongLTRCodePoints {
    static dispatch_once_t onceToken;
    static NSCharacterSet *characterSet;
    dispatch_once(&onceToken, ^{
        NSMutableCharacterSet *mutableCharacterSet = [[NSMutableCharacterSet alloc] init];
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x41, 26)];  // LATIN CAPITAL LETTER A...LATIN CAPITAL LETTER Z
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x61, 26)];  // LATIN SMALL LETTER A...LATIN SMALL LETTER Z
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaa, 1)];  // FEMININE ORDINAL INDICATOR
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb5, 1)];  // MICRO SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xba, 1)];  // MASCULINE ORDINAL INDICATOR
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc0, 23)];  // LATIN CAPITAL LETTER A WITH GRAVE...LATIN CAPITAL LETTER O WITH DIAERESIS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd8, 31)];  // LATIN CAPITAL LETTER O WITH STROKE...LATIN SMALL LETTER O WITH DIAERESIS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xf8, 449)];  // LATIN SMALL LETTER O WITH STROKE...MODIFIER LETTER SMALL Y
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2bb, 7)];  // MODIFIER LETTER TURNED COMMA...MODIFIER LETTER REVERSED GLOTTAL STOP
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2d0, 2)];  // MODIFIER LETTER TRIANGULAR COLON...MODIFIER LETTER HALF TRIANGULAR COLON
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2e0, 5)];  // MODIFIER LETTER SMALL GAMMA...MODIFIER LETTER SMALL REVERSED GLOTTAL STOP
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2ee, 1)];  // MODIFIER LETTER DOUBLE APOSTROPHE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x370, 4)];  // GREEK CAPITAL LETTER HETA...GREEK SMALL LETTER ARCHAIC SAMPI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x376, 2)];  // GREEK CAPITAL LETTER PAMPHYLIAN DIGAMMA...GREEK SMALL LETTER PAMPHYLIAN DIGAMMA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x37a, 4)];  // GREEK YPOGEGRAMMENI...GREEK SMALL REVERSED DOTTED LUNATE SIGMA SYMBOL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x37f, 1)];  // GREEK CAPITAL LETTER YOT
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x386, 1)];  // GREEK CAPITAL LETTER ALPHA WITH TONOS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x388, 3)];  // GREEK CAPITAL LETTER EPSILON WITH TONOS...GREEK CAPITAL LETTER IOTA WITH TONOS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x38c, 1)];  // GREEK CAPITAL LETTER OMICRON WITH TONOS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x38e, 20)];  // GREEK CAPITAL LETTER UPSILON WITH TONOS...GREEK CAPITAL LETTER RHO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x3a3, 83)];  // GREEK CAPITAL LETTER SIGMA...GREEK LUNATE EPSILON SYMBOL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x3f7, 140)];  // GREEK CAPITAL LETTER SHO...CYRILLIC THOUSANDS SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x48a, 166)];  // CYRILLIC CAPITAL LETTER SHORT I WITH TAIL...CYRILLIC SMALL LETTER EL WITH DESCENDER
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x531, 38)];  // ARMENIAN CAPITAL LETTER AYB...ARMENIAN CAPITAL LETTER FEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x559, 49)];  // ARMENIAN MODIFIER LETTER LEFT HALF RING...ARMENIAN FULL STOP
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x903, 55)];  // DEVANAGARI SIGN VISARGA...DEVANAGARI LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x93b, 1)];  // DEVANAGARI VOWEL SIGN OOE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x93d, 4)];  // DEVANAGARI SIGN AVAGRAHA...DEVANAGARI VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x949, 4)];  // DEVANAGARI VOWEL SIGN CANDRA O...DEVANAGARI VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x94e, 3)];  // DEVANAGARI VOWEL SIGN PRISHTHAMATRA E...DEVANAGARI OM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x958, 10)];  // DEVANAGARI LETTER QA...DEVANAGARI LETTER VOCALIC LL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x964, 29)];  // DEVANAGARI DANDA...BENGALI ANJI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x982, 2)];  // BENGALI SIGN ANUSVARA...BENGALI SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x985, 8)];  // BENGALI LETTER A...BENGALI LETTER VOCALIC L
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x98f, 2)];  // BENGALI LETTER E...BENGALI LETTER AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x993, 22)];  // BENGALI LETTER O...BENGALI LETTER NA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x9aa, 7)];  // BENGALI LETTER PA...BENGALI LETTER RA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x9b2, 1)];  // BENGALI LETTER LA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x9b6, 4)];  // BENGALI LETTER SHA...BENGALI LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x9bd, 4)];  // BENGALI SIGN AVAGRAHA...BENGALI VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x9c7, 2)];  // BENGALI VOWEL SIGN E...BENGALI VOWEL SIGN AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x9cb, 2)];  // BENGALI VOWEL SIGN O...BENGALI VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x9ce, 1)];  // BENGALI LETTER KHANDA TA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x9d7, 1)];  // BENGALI AU LENGTH MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x9dc, 2)];  // BENGALI LETTER RRA...BENGALI LETTER RHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x9df, 3)];  // BENGALI LETTER YYA...BENGALI LETTER VOCALIC LL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x9e6, 12)];  // BENGALI DIGIT ZERO...BENGALI LETTER RA WITH LOWER DIAGONAL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x9f4, 7)];  // BENGALI CURRENCY NUMERATOR ONE...BENGALI ISSHAR
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x9fc, 2)];  // BENGALI LETTER VEDIC ANUSVARA...BENGALI ABBREVIATION SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa03, 1)];  // GURMUKHI SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa05, 6)];  // GURMUKHI LETTER A...GURMUKHI LETTER UU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa0f, 2)];  // GURMUKHI LETTER EE...GURMUKHI LETTER AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa13, 22)];  // GURMUKHI LETTER OO...GURMUKHI LETTER NA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa2a, 7)];  // GURMUKHI LETTER PA...GURMUKHI LETTER RA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa32, 2)];  // GURMUKHI LETTER LA...GURMUKHI LETTER LLA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa35, 2)];  // GURMUKHI LETTER VA...GURMUKHI LETTER SHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa38, 2)];  // GURMUKHI LETTER SA...GURMUKHI LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa3e, 3)];  // GURMUKHI VOWEL SIGN AA...GURMUKHI VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa59, 4)];  // GURMUKHI LETTER KHHA...GURMUKHI LETTER RRA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa5e, 1)];  // GURMUKHI LETTER FA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa66, 10)];  // GURMUKHI DIGIT ZERO...GURMUKHI DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa72, 3)];  // GURMUKHI IRI...GURMUKHI EK ONKAR
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa76, 1)];  // GURMUKHI ABBREVIATION SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa83, 1)];  // GUJARATI SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa85, 9)];  // GUJARATI LETTER A...GUJARATI VOWEL CANDRA E
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa8f, 3)];  // GUJARATI LETTER E...GUJARATI VOWEL CANDRA O
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa93, 22)];  // GUJARATI LETTER O...GUJARATI LETTER NA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaaa, 7)];  // GUJARATI LETTER PA...GUJARATI LETTER RA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xab2, 2)];  // GUJARATI LETTER LA...GUJARATI LETTER LLA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xab5, 5)];  // GUJARATI LETTER VA...GUJARATI LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xabd, 4)];  // GUJARATI SIGN AVAGRAHA...GUJARATI VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xac9, 1)];  // GUJARATI VOWEL SIGN CANDRA O
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xacb, 2)];  // GUJARATI VOWEL SIGN O...GUJARATI VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xad0, 1)];  // GUJARATI OM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xae0, 2)];  // GUJARATI LETTER VOCALIC RR...GUJARATI LETTER VOCALIC LL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xae6, 11)];  // GUJARATI DIGIT ZERO...GUJARATI ABBREVIATION SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaf9, 1)];  // GUJARATI LETTER ZHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb02, 2)];  // ORIYA SIGN ANUSVARA...ORIYA SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb05, 8)];  // ORIYA LETTER A...ORIYA LETTER VOCALIC L
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb0f, 2)];  // ORIYA LETTER E...ORIYA LETTER AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb13, 22)];  // ORIYA LETTER O...ORIYA LETTER NA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb2a, 7)];  // ORIYA LETTER PA...ORIYA LETTER RA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb32, 2)];  // ORIYA LETTER LA...ORIYA LETTER LLA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb35, 5)];  // ORIYA LETTER VA...ORIYA LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb3d, 2)];  // ORIYA SIGN AVAGRAHA...ORIYA VOWEL SIGN AA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb40, 1)];  // ORIYA VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb47, 2)];  // ORIYA VOWEL SIGN E...ORIYA VOWEL SIGN AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb4b, 2)];  // ORIYA VOWEL SIGN O...ORIYA VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb57, 1)];  // ORIYA AU LENGTH MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb5c, 2)];  // ORIYA LETTER RRA...ORIYA LETTER RHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb5f, 3)];  // ORIYA LETTER YYA...ORIYA LETTER VOCALIC LL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb66, 18)];  // ORIYA DIGIT ZERO...ORIYA FRACTION THREE SIXTEENTHS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb83, 1)];  // TAMIL SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb85, 6)];  // TAMIL LETTER A...TAMIL LETTER UU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb8e, 3)];  // TAMIL LETTER E...TAMIL LETTER AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb92, 4)];  // TAMIL LETTER O...TAMIL LETTER KA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb99, 2)];  // TAMIL LETTER NGA...TAMIL LETTER CA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb9c, 1)];  // TAMIL LETTER JA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xb9e, 2)];  // TAMIL LETTER NYA...TAMIL LETTER TTA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xba3, 2)];  // TAMIL LETTER NNA...TAMIL LETTER TA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xba8, 3)];  // TAMIL LETTER NA...TAMIL LETTER PA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xbae, 12)];  // TAMIL LETTER MA...TAMIL LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xbbe, 2)];  // TAMIL VOWEL SIGN AA...TAMIL VOWEL SIGN I
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xbc1, 2)];  // TAMIL VOWEL SIGN U...TAMIL VOWEL SIGN UU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xbc6, 3)];  // TAMIL VOWEL SIGN E...TAMIL VOWEL SIGN AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xbca, 3)];  // TAMIL VOWEL SIGN O...TAMIL VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xbd0, 1)];  // TAMIL OM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xbd7, 1)];  // TAMIL AU LENGTH MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xbe6, 13)];  // TAMIL DIGIT ZERO...TAMIL NUMBER ONE THOUSAND
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc01, 3)];  // TELUGU SIGN CANDRABINDU...TELUGU SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc05, 8)];  // TELUGU LETTER A...TELUGU LETTER VOCALIC L
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc0e, 3)];  // TELUGU LETTER E...TELUGU LETTER AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc12, 23)];  // TELUGU LETTER O...TELUGU LETTER NA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc2a, 16)];  // TELUGU LETTER PA...TELUGU LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc3d, 1)];  // TELUGU SIGN AVAGRAHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc41, 4)];  // TELUGU VOWEL SIGN U...TELUGU VOWEL SIGN VOCALIC RR
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc58, 3)];  // TELUGU LETTER TSA...TELUGU LETTER RRRA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc5d, 1)];  // TELUGU LETTER NAKAARA POLLU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc60, 2)];  // TELUGU LETTER VOCALIC RR...TELUGU LETTER VOCALIC LL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc66, 10)];  // TELUGU DIGIT ZERO...TELUGU DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc77, 1)];  // TELUGU SIGN SIDDHAM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc7f, 2)];  // TELUGU SIGN TUUMU...KANNADA SIGN SPACING CANDRABINDU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc82, 11)];  // KANNADA SIGN ANUSVARA...KANNADA LETTER VOCALIC L
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc8e, 3)];  // KANNADA LETTER E...KANNADA LETTER AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xc92, 23)];  // KANNADA LETTER O...KANNADA LETTER NA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xcaa, 10)];  // KANNADA LETTER PA...KANNADA LETTER LLA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xcb5, 5)];  // KANNADA LETTER VA...KANNADA LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xcbd, 8)];  // KANNADA SIGN AVAGRAHA...KANNADA VOWEL SIGN VOCALIC RR
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xcc6, 3)];  // KANNADA VOWEL SIGN E...KANNADA VOWEL SIGN AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xcca, 2)];  // KANNADA VOWEL SIGN O...KANNADA VOWEL SIGN OO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xcd5, 2)];  // KANNADA LENGTH MARK...KANNADA AI LENGTH MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xcdd, 2)];  // KANNADA LETTER NAKAARA POLLU...KANNADA LETTER FA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xce0, 2)];  // KANNADA LETTER VOCALIC RR...KANNADA LETTER VOCALIC LL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xce6, 10)];  // KANNADA DIGIT ZERO...KANNADA DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xcf1, 3)];  // KANNADA SIGN JIHVAMULIYA...KANNADA SIGN COMBINING ANUSVARA ABOVE RIGHT
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd02, 11)];  // MALAYALAM SIGN ANUSVARA...MALAYALAM LETTER VOCALIC L
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd0e, 3)];  // MALAYALAM LETTER E...MALAYALAM LETTER AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd12, 41)];  // MALAYALAM LETTER O...MALAYALAM LETTER TTTA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd3d, 4)];  // MALAYALAM SIGN AVAGRAHA...MALAYALAM VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd46, 3)];  // MALAYALAM VOWEL SIGN E...MALAYALAM VOWEL SIGN AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd4a, 3)];  // MALAYALAM VOWEL SIGN O...MALAYALAM VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd4e, 2)];  // MALAYALAM LETTER DOT REPH...MALAYALAM SIGN PARA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd54, 14)];  // MALAYALAM LETTER CHILLU M...MALAYALAM LETTER VOCALIC LL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd66, 26)];  // MALAYALAM DIGIT ZERO...MALAYALAM LETTER CHILLU K
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd82, 2)];  // SINHALA SIGN ANUSVARAYA...SINHALA SIGN VISARGAYA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd85, 18)];  // SINHALA LETTER AYANNA...SINHALA LETTER AUYANNA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd9a, 24)];  // SINHALA LETTER ALPAPRAANA KAYANNA...SINHALA LETTER DANTAJA NAYANNA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xdb3, 9)];  // SINHALA LETTER SANYAKA DAYANNA...SINHALA LETTER RAYANNA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xdbd, 1)];  // SINHALA LETTER DANTAJA LAYANNA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xdc0, 7)];  // SINHALA LETTER VAYANNA...SINHALA LETTER FAYANNA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xdcf, 3)];  // SINHALA VOWEL SIGN AELA-PILLA...SINHALA VOWEL SIGN DIGA AEDA-PILLA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xdd8, 8)];  // SINHALA VOWEL SIGN GAETTA-PILLA...SINHALA VOWEL SIGN GAYANUKITTA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xde6, 10)];  // SINHALA LITH DIGIT ZERO...SINHALA LITH DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xdf2, 3)];  // SINHALA VOWEL SIGN DIGA GAETTA-PILLA...SINHALA PUNCTUATION KUNDDALIYA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xe01, 48)];  // THAI CHARACTER KO KAI...THAI CHARACTER SARA A
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xe32, 2)];  // THAI CHARACTER SARA AA...THAI CHARACTER SARA AM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xe40, 7)];  // THAI CHARACTER SARA E...THAI CHARACTER MAIYAMOK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xe4f, 13)];  // THAI CHARACTER FONGMAN...THAI CHARACTER KHOMUT
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xe81, 2)];  // LAO LETTER KO...LAO LETTER KHO SUNG
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xe84, 1)];  // LAO LETTER KHO TAM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xe86, 5)];  // LAO LETTER PALI GHA...LAO LETTER SO TAM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xe8c, 24)];  // LAO LETTER PALI JHA...LAO LETTER LO LING
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xea5, 1)];  // LAO LETTER LO LOOT
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xea7, 10)];  // LAO LETTER WO...LAO VOWEL SIGN A
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xeb2, 2)];  // LAO VOWEL SIGN AA...LAO VOWEL SIGN AM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xebd, 1)];  // LAO SEMIVOWEL SIGN NYO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xec0, 5)];  // LAO VOWEL SIGN E...LAO VOWEL SIGN AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xec6, 1)];  // LAO KO LA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xed0, 10)];  // LAO DIGIT ZERO...LAO DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xedc, 4)];  // LAO HO NO...LAO LETTER KHMU NYO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xf00, 24)];  // TIBETAN SYLLABLE OM...TIBETAN ASTROLOGICAL SIGN SGRA GCAN -CHAR RTAGS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xf1a, 27)];  // TIBETAN SIGN RDEL DKAR GCIG...TIBETAN MARK BSDUS RTAGS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xf36, 1)];  // TIBETAN MARK CARET -DZUD RTAGS BZHI MIG CAN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xf38, 1)];  // TIBETAN MARK CHE MGO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xf3e, 10)];  // TIBETAN SIGN YAR TSHES...TIBETAN LETTER JA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xf49, 36)];  // TIBETAN LETTER NYA...TIBETAN LETTER RRA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xf7f, 1)];  // TIBETAN SIGN RNAM BCAD
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xf85, 1)];  // TIBETAN MARK PALUTA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xf88, 5)];  // TIBETAN SIGN LCE TSA CAN...TIBETAN SIGN INVERTED MCHU CAN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfbe, 8)];  // TIBETAN KU RU KHA...TIBETAN SYMBOL RDO RJE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfc7, 6)];  // TIBETAN SYMBOL RDO RJE RGYA GRAM...TIBETAN SYMBOL NOR BU BZHI -KHYIL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfce, 13)];  // TIBETAN SIGN RDEL NAG RDEL DKAR...TIBETAN MARK TRAILING MCHAN RTAGS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1000, 45)];  // MYANMAR LETTER KA...MYANMAR VOWEL SIGN AA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1031, 1)];  // MYANMAR VOWEL SIGN E
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1038, 1)];  // MYANMAR SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x103b, 2)];  // MYANMAR CONSONANT SIGN MEDIAL YA...MYANMAR CONSONANT SIGN MEDIAL RA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x103f, 25)];  // MYANMAR LETTER GREAT SA...MYANMAR VOWEL SIGN VOCALIC RR
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x105a, 4)];  // MYANMAR LETTER MON NGA...MYANMAR LETTER MON BBE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1061, 16)];  // MYANMAR LETTER SGAW KAREN SHA...MYANMAR LETTER EASTERN PWO KAREN GHWA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1075, 13)];  // MYANMAR LETTER SHAN KA...MYANMAR LETTER SHAN HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1083, 2)];  // MYANMAR VOWEL SIGN SHAN AA...MYANMAR VOWEL SIGN SHAN E
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1087, 6)];  // MYANMAR SIGN SHAN TONE-2...MYANMAR SIGN SHAN COUNCIL TONE-3
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x108e, 15)];  // MYANMAR LETTER RUMAI PALAUNG FA...MYANMAR VOWEL SIGN AITON A
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x109e, 40)];  // MYANMAR SYMBOL SHAN ONE...GEORGIAN CAPITAL LETTER HOE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10c7, 1)];  // GEORGIAN CAPITAL LETTER YN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10cd, 1)];  // GEORGIAN CAPITAL LETTER AEN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10d0, 377)];  // GEORGIAN LETTER AN...ETHIOPIC SYLLABLE QWA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x124a, 4)];  // ETHIOPIC SYLLABLE QWI...ETHIOPIC SYLLABLE QWE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1250, 7)];  // ETHIOPIC SYLLABLE QHA...ETHIOPIC SYLLABLE QHO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1258, 1)];  // ETHIOPIC SYLLABLE QHWA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x125a, 4)];  // ETHIOPIC SYLLABLE QHWI...ETHIOPIC SYLLABLE QHWE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1260, 41)];  // ETHIOPIC SYLLABLE BA...ETHIOPIC SYLLABLE XWA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x128a, 4)];  // ETHIOPIC SYLLABLE XWI...ETHIOPIC SYLLABLE XWE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1290, 33)];  // ETHIOPIC SYLLABLE NA...ETHIOPIC SYLLABLE KWA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x12b2, 4)];  // ETHIOPIC SYLLABLE KWI...ETHIOPIC SYLLABLE KWE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x12b8, 7)];  // ETHIOPIC SYLLABLE KXA...ETHIOPIC SYLLABLE KXO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x12c0, 1)];  // ETHIOPIC SYLLABLE KXWA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x12c2, 4)];  // ETHIOPIC SYLLABLE KXWI...ETHIOPIC SYLLABLE KXWE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x12c8, 15)];  // ETHIOPIC SYLLABLE WA...ETHIOPIC SYLLABLE PHARYNGEAL O
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x12d8, 57)];  // ETHIOPIC SYLLABLE ZA...ETHIOPIC SYLLABLE GWA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1312, 4)];  // ETHIOPIC SYLLABLE GWI...ETHIOPIC SYLLABLE GWE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1318, 67)];  // ETHIOPIC SYLLABLE GGA...ETHIOPIC SYLLABLE FYA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1360, 29)];  // ETHIOPIC SECTION MARK...ETHIOPIC NUMBER TEN THOUSAND
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1380, 16)];  // ETHIOPIC SYLLABLE SEBATBEIT MWA...ETHIOPIC SYLLABLE PWE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x13a0, 86)];  // CHEROKEE LETTER A...CHEROKEE LETTER MV
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x13f8, 6)];  // CHEROKEE SMALL LETTER YE...CHEROKEE SMALL LETTER MV
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1401, 639)];  // CANADIAN SYLLABICS E...CANADIAN SYLLABICS BLACKFOOT W
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1681, 26)];  // OGHAM LETTER BEITH...OGHAM LETTER PEITH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16a0, 89)];  // RUNIC LETTER FEHU FEOH FE F...RUNIC LETTER FRANKS CASKET AESC
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1700, 18)];  // TAGALOG LETTER A...TAGALOG LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1715, 1)];  // TAGALOG SIGN PAMUDPOD
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x171f, 19)];  // TAGALOG LETTER ARCHAIC RA...HANUNOO LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1734, 3)];  // HANUNOO SIGN PAMUDPOD...PHILIPPINE DOUBLE PUNCTUATION
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1740, 18)];  // BUHID LETTER A...BUHID LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1760, 13)];  // TAGBANWA LETTER A...TAGBANWA LETTER YA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x176e, 3)];  // TAGBANWA LETTER LA...TAGBANWA LETTER SA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1780, 52)];  // KHMER LETTER KA...KHMER INDEPENDENT VOWEL QAU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x17b6, 1)];  // KHMER VOWEL SIGN AA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x17be, 8)];  // KHMER VOWEL SIGN OE...KHMER VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x17c7, 2)];  // KHMER SIGN REAHMUK...KHMER SIGN YUUKALEAPINTU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x17d4, 7)];  // KHMER SIGN KHAN...KHMER SIGN KOOMUUT
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x17dc, 1)];  // KHMER SIGN AVAKRAHASANYA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x17e0, 10)];  // KHMER DIGIT ZERO...KHMER DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1810, 10)];  // MONGOLIAN DIGIT ZERO...MONGOLIAN DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1820, 89)];  // MONGOLIAN LETTER A...MONGOLIAN LETTER CHA WITH TWO DOTS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1880, 5)];  // MONGOLIAN LETTER ALI GALI ANUSVARA ONE...MONGOLIAN LETTER ALI GALI INVERTED UBADAMA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1887, 34)];  // MONGOLIAN LETTER ALI GALI A...MONGOLIAN LETTER MANCHU ALI GALI BHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x18aa, 1)];  // MONGOLIAN LETTER MANCHU ALI GALI LHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x18b0, 70)];  // CANADIAN SYLLABICS OY...CANADIAN SYLLABICS CARRIER DENTAL S
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1900, 31)];  // LIMBU VOWEL-CARRIER LETTER...LIMBU LETTER TRA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1923, 4)];  // LIMBU VOWEL SIGN EE...LIMBU VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1929, 3)];  // LIMBU SUBJOINED LETTER YA...LIMBU SUBJOINED LETTER WA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1930, 2)];  // LIMBU SMALL LETTER KA...LIMBU SMALL LETTER NGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1933, 6)];  // LIMBU SMALL LETTER TA...LIMBU SMALL LETTER LA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1946, 40)];  // LIMBU DIGIT ZERO...TAI LE LETTER AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1970, 5)];  // TAI LE LETTER TONE-2...TAI LE LETTER TONE-6
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1980, 44)];  // NEW TAI LUE LETTER HIGH QA...NEW TAI LUE LETTER LOW SUA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x19b0, 26)];  // NEW TAI LUE VOWEL SIGN VOWEL SHORTENER...NEW TAI LUE TONE MARK-2
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x19d0, 11)];  // NEW TAI LUE DIGIT ZERO...NEW TAI LUE THAM DIGIT ONE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1a00, 23)];  // BUGINESE LETTER KA...BUGINESE LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1a19, 2)];  // BUGINESE VOWEL SIGN E...BUGINESE VOWEL SIGN O
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1a1e, 56)];  // BUGINESE PALLAWA...TAI THAM CONSONANT SIGN MEDIAL RA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1a57, 1)];  // TAI THAM CONSONANT SIGN LA TANG LAI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1a61, 1)];  // TAI THAM VOWEL SIGN A
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1a63, 2)];  // TAI THAM VOWEL SIGN AA...TAI THAM VOWEL SIGN TALL AA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1a6d, 6)];  // TAI THAM VOWEL SIGN OY...TAI THAM VOWEL SIGN THAM AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1a80, 10)];  // TAI THAM HORA DIGIT ZERO...TAI THAM HORA DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1a90, 10)];  // TAI THAM THAM DIGIT ZERO...TAI THAM THAM DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1aa0, 14)];  // TAI THAM SIGN WIANG...TAI THAM SIGN CAANG
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1b04, 48)];  // BALINESE SIGN BISAH...BALINESE LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1b35, 1)];  // BALINESE VOWEL SIGN TEDUNG
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1b3b, 1)];  // BALINESE VOWEL SIGN RA REPA TEDUNG
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1b3d, 5)];  // BALINESE VOWEL SIGN LA LENGA TEDUNG...BALINESE VOWEL SIGN TALING REPA TEDUNG
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1b43, 10)];  // BALINESE VOWEL SIGN PEPET TEDUNG...BALINESE LETTER ARCHAIC JNYA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1b4e, 29)];  // BALINESE INVERTED CARIK SIKI...BALINESE MUSICAL SYMBOL DANG GEDE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1b74, 12)];  // BALINESE MUSICAL SYMBOL RIGHT-HAND OPEN DUG...BALINESE PANTI BAWAK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1b82, 32)];  // SUNDANESE SIGN PANGWISAD...SUNDANESE CONSONANT SIGN PAMINGKAL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ba6, 2)];  // SUNDANESE VOWEL SIGN PANAELAENG...SUNDANESE VOWEL SIGN PANOLONG
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1baa, 1)];  // SUNDANESE SIGN PAMAAEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1bae, 56)];  // SUNDANESE LETTER KHA...BATAK LETTER U
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1be7, 1)];  // BATAK VOWEL SIGN E
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1bea, 3)];  // BATAK VOWEL SIGN I...BATAK VOWEL SIGN O
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1bee, 1)];  // BATAK VOWEL SIGN U
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1bf2, 2)];  // BATAK PANGOLAT...BATAK PANONGONAN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1bfc, 48)];  // BATAK SYMBOL BINDU NA METEK...LEPCHA VOWEL SIGN UU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1c34, 2)];  // LEPCHA CONSONANT SIGN NYIN-DO...LEPCHA CONSONANT SIGN KANG
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1c3b, 15)];  // LEPCHA PUNCTUATION TA-ROL...LEPCHA DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1c4d, 62)];  // LEPCHA LETTER TTA...CYRILLIC SMALL LETTER TJE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1c90, 43)];  // GEORGIAN MTAVRULI CAPITAL LETTER AN...GEORGIAN MTAVRULI CAPITAL LETTER AIN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1cbd, 11)];  // GEORGIAN MTAVRULI CAPITAL LETTER AEN...SUNDANESE PUNCTUATION BINDU BA SATANGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1cd3, 1)];  // VEDIC SIGN NIHSHVASA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ce1, 1)];  // VEDIC TONE ATHARVAVEDIC INDEPENDENT SVARITA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ce9, 4)];  // VEDIC SIGN ANUSVARA ANTARGOMUKHA...VEDIC SIGN ANUSVARA VAMAGOMUKHA WITH TAIL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1cee, 6)];  // VEDIC SIGN HEXIFORM LONG ANUSVARA...VEDIC SIGN ROTATED ARDHAVISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1cf5, 3)];  // VEDIC SIGN JIHVAMULIYA...VEDIC SIGN ATIKRAMA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1cfa, 1)];  // VEDIC SIGN DOUBLE ANUSVARA ANTARGOMUKHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d00, 192)];  // LATIN LETTER SMALL CAPITAL A...MODIFIER LETTER SMALL THETA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e00, 278)];  // LATIN CAPITAL LETTER A WITH RING BELOW...GREEK SMALL LETTER EPSILON WITH DASIA AND OXIA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1f18, 6)];  // GREEK CAPITAL LETTER EPSILON WITH PSILI...GREEK CAPITAL LETTER EPSILON WITH DASIA AND OXIA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1f20, 38)];  // GREEK SMALL LETTER ETA WITH PSILI...GREEK SMALL LETTER OMICRON WITH DASIA AND OXIA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1f48, 6)];  // GREEK CAPITAL LETTER OMICRON WITH PSILI...GREEK CAPITAL LETTER OMICRON WITH DASIA AND OXIA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1f50, 8)];  // GREEK SMALL LETTER UPSILON WITH PSILI...GREEK SMALL LETTER UPSILON WITH DASIA AND PERISPOMENI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1f59, 1)];  // GREEK CAPITAL LETTER UPSILON WITH DASIA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1f5b, 1)];  // GREEK CAPITAL LETTER UPSILON WITH DASIA AND VARIA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1f5d, 1)];  // GREEK CAPITAL LETTER UPSILON WITH DASIA AND OXIA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1f5f, 31)];  // GREEK CAPITAL LETTER UPSILON WITH DASIA AND PERISPOMENI...GREEK SMALL LETTER OMEGA WITH OXIA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1f80, 53)];  // GREEK SMALL LETTER ALPHA WITH PSILI AND YPOGEGRAMMENI...GREEK SMALL LETTER ALPHA WITH OXIA AND YPOGEGRAMMENI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1fb6, 7)];  // GREEK SMALL LETTER ALPHA WITH PERISPOMENI...GREEK CAPITAL LETTER ALPHA WITH PROSGEGRAMMENI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1fbe, 1)];  // GREEK PROSGEGRAMMENI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1fc2, 3)];  // GREEK SMALL LETTER ETA WITH VARIA AND YPOGEGRAMMENI...GREEK SMALL LETTER ETA WITH OXIA AND YPOGEGRAMMENI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1fc6, 7)];  // GREEK SMALL LETTER ETA WITH PERISPOMENI...GREEK CAPITAL LETTER ETA WITH PROSGEGRAMMENI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1fd0, 4)];  // GREEK SMALL LETTER IOTA WITH VRACHY...GREEK SMALL LETTER IOTA WITH DIALYTIKA AND OXIA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1fd6, 6)];  // GREEK SMALL LETTER IOTA WITH PERISPOMENI...GREEK CAPITAL LETTER IOTA WITH OXIA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1fe0, 13)];  // GREEK SMALL LETTER UPSILON WITH VRACHY...GREEK CAPITAL LETTER RHO WITH DASIA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ff2, 3)];  // GREEK SMALL LETTER OMEGA WITH VARIA AND YPOGEGRAMMENI...GREEK SMALL LETTER OMEGA WITH OXIA AND YPOGEGRAMMENI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ff6, 7)];  // GREEK SMALL LETTER OMEGA WITH PERISPOMENI...GREEK CAPITAL LETTER OMEGA WITH PROSGEGRAMMENI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x200e, 1)];  // LEFT-TO-RIGHT MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2071, 1)];  // SUPERSCRIPT LATIN SMALL LETTER I
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x207f, 1)];  // SUPERSCRIPT LATIN SMALL LETTER N
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2090, 13)];  // LATIN SUBSCRIPT SMALL LETTER A...LATIN SUBSCRIPT SMALL LETTER T
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2102, 1)];  // DOUBLE-STRUCK CAPITAL C
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2107, 1)];  // EULER CONSTANT
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x210a, 10)];  // SCRIPT SMALL G...SCRIPT SMALL L
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2115, 1)];  // DOUBLE-STRUCK CAPITAL N
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2119, 5)];  // DOUBLE-STRUCK CAPITAL P...DOUBLE-STRUCK CAPITAL R
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2124, 1)];  // DOUBLE-STRUCK CAPITAL Z
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2126, 1)];  // OHM SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2128, 1)];  // BLACK-LETTER CAPITAL Z
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x212a, 4)];  // KELVIN SIGN...BLACK-LETTER CAPITAL C
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x212f, 11)];  // SCRIPT SMALL E...INFORMATION SOURCE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x213c, 4)];  // DOUBLE-STRUCK SMALL PI...DOUBLE-STRUCK CAPITAL PI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2145, 5)];  // DOUBLE-STRUCK ITALIC CAPITAL D...DOUBLE-STRUCK ITALIC SMALL J
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x214e, 2)];  // TURNED SMALL F...SYMBOL FOR SAMARITAN SOURCE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2160, 41)];  // ROMAN NUMERAL ONE...ROMAN NUMERAL ONE HUNDRED THOUSAND
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2336, 69)];  // APL FUNCTIONAL SYMBOL I-BEAM...APL FUNCTIONAL SYMBOL ALPHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2395, 1)];  // APL FUNCTIONAL SYMBOL QUAD
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x249c, 78)];  // PARENTHESIZED LATIN SMALL LETTER A...CIRCLED LATIN SMALL LETTER Z
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x26ac, 1)];  // MEDIUM SMALL WHITE CIRCLE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2800, 256)];  // BRAILLE PATTERN BLANK...BRAILLE PATTERN DOTS-12345678
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2c00, 229)];  // GLAGOLITIC CAPITAL LETTER AZU...COPTIC SYMBOL KAI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2ceb, 4)];  // COPTIC CAPITAL LETTER CRYPTOGRAMMIC SHEI...COPTIC SMALL LETTER CRYPTOGRAMMIC GANGIA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2cf2, 2)];  // COPTIC CAPITAL LETTER BOHAIRIC KHEI...COPTIC SMALL LETTER BOHAIRIC KHEI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2d00, 38)];  // GEORGIAN SMALL LETTER AN...GEORGIAN SMALL LETTER HOE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2d27, 1)];  // GEORGIAN SMALL LETTER YN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2d2d, 1)];  // GEORGIAN SMALL LETTER AEN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2d30, 56)];  // TIFINAGH LETTER YA...TIFINAGH LETTER YO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2d6f, 2)];  // TIFINAGH MODIFIER LETTER LABIALIZATION MARK...TIFINAGH SEPARATOR MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2d80, 23)];  // ETHIOPIC SYLLABLE LOA...ETHIOPIC SYLLABLE GGWE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2da0, 7)];  // ETHIOPIC SYLLABLE SSA...ETHIOPIC SYLLABLE SSO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2da8, 7)];  // ETHIOPIC SYLLABLE CCA...ETHIOPIC SYLLABLE CCO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2db0, 7)];  // ETHIOPIC SYLLABLE ZZA...ETHIOPIC SYLLABLE ZZO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2db8, 7)];  // ETHIOPIC SYLLABLE CCHA...ETHIOPIC SYLLABLE CCHO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2dc0, 7)];  // ETHIOPIC SYLLABLE QYA...ETHIOPIC SYLLABLE QYO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2dc8, 7)];  // ETHIOPIC SYLLABLE KYA...ETHIOPIC SYLLABLE KYO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2dd0, 7)];  // ETHIOPIC SYLLABLE XYA...ETHIOPIC SYLLABLE XYO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2dd8, 7)];  // ETHIOPIC SYLLABLE GYA...ETHIOPIC SYLLABLE GYO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x3005, 3)];  // IDEOGRAPHIC ITERATION MARK...IDEOGRAPHIC NUMBER ZERO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x3021, 9)];  // HANGZHOU NUMERAL ONE...HANGZHOU NUMERAL NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x302e, 2)];  // HANGUL SINGLE DOT TONE MARK...HANGUL DOUBLE DOT TONE MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x3031, 5)];  // VERTICAL KANA REPEAT MARK...VERTICAL KANA REPEAT MARK LOWER HALF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x3038, 5)];  // HANGZHOU NUMERAL TEN...MASU MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x3041, 86)];  // HIRAGANA LETTER SMALL A...HIRAGANA LETTER SMALL KE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x309d, 3)];  // HIRAGANA ITERATION MARK...HIRAGANA DIGRAPH YORI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x30a1, 90)];  // KATAKANA LETTER SMALL A...KATAKANA LETTER VO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x30fc, 4)];  // KATAKANA-HIRAGANA PROLONGED SOUND MARK...KATAKANA DIGRAPH KOTO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x3105, 43)];  // BOPOMOFO LETTER B...BOPOMOFO LETTER NN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x3131, 94)];  // HANGUL LETTER KIYEOK...HANGUL LETTER ARAEAE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x3190, 48)];  // IDEOGRAPHIC ANNOTATION LINKING MARK...BOPOMOFO LETTER AH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x31f0, 45)];  // KATAKANA LETTER SMALL KU...PARENTHESIZED HANGUL CIEUC U
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x3220, 48)];  // PARENTHESIZED IDEOGRAPH ONE...CIRCLED NUMBER EIGHTY ON BLACK SQUARE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x3260, 28)];  // CIRCLED HANGUL KIYEOK...CIRCLED HANGUL HIEUH A
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x327f, 50)];  // KOREAN STANDARD SYMBOL...CIRCLED IDEOGRAPH NIGHT
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x32c0, 12)];  // IDEOGRAPHIC TELEGRAPH SYMBOL FOR JANUARY...IDEOGRAPHIC TELEGRAPH SYMBOL FOR DECEMBER
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x32d0, 167)];  // CIRCLED KATAKANA A...SQUARE PC
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x337b, 99)];  // SQUARE ERA NAME HEISEI...SQUARE WB
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x33e0, 31)];  // IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY ONE...IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY THIRTY-ONE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x3400, 1)];  // <CJK Ideograph Extension A, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x4dbf, 1)];  // <CJK Ideograph Extension A, Last>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x4e00, 1)];  // <CJK Ideograph, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x9fff, 1166)];  // <CJK Ideograph, Last>...YI SYLLABLE YYR
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa4d0, 317)];  // LISU LETTER BA...VAI SYLLABLE LENGTHENER
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa610, 28)];  // VAI SYLLABLE NDOLE FA...VAI SYLLABLE NDOLE DO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa640, 47)];  // CYRILLIC CAPITAL LETTER ZEMLYA...CYRILLIC LETTER MULTIOCULAR O
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa680, 30)];  // CYRILLIC CAPITAL LETTER DWE...MODIFIER LETTER CYRILLIC SOFT SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa6a0, 80)];  // BAMUM LETTER A...BAMUM LETTER KOGHOM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa6f2, 6)];  // BAMUM NJAEMLI...BAMUM QUESTION MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa722, 102)];  // LATIN CAPITAL LETTER EGYPTOLOGICAL ALEF...LATIN SMALL LETTER INSULAR T
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa789, 69)];  // MODIFIER LETTER COLON...LATIN SMALL LETTER S WITH DIAGONAL STROKE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa7d0, 2)];  // LATIN CAPITAL LETTER CLOSED INSULAR G...LATIN SMALL LETTER CLOSED INSULAR G
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa7d3, 1)];  // LATIN SMALL LETTER DOUBLE THORN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa7d5, 8)];  // LATIN SMALL LETTER DOUBLE WYNN...LATIN CAPITAL LETTER LAMBDA WITH STROKE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa7f2, 16)];  // MODIFIER LETTER CAPITAL C...SYLOTI NAGRI LETTER I
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa803, 3)];  // SYLOTI NAGRI LETTER U...SYLOTI NAGRI LETTER O
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa807, 4)];  // SYLOTI NAGRI LETTER KO...SYLOTI NAGRI LETTER GHO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa80c, 25)];  // SYLOTI NAGRI LETTER CO...SYLOTI NAGRI VOWEL SIGN I
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa827, 1)];  // SYLOTI NAGRI VOWEL SIGN OO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa830, 8)];  // NORTH INDIC FRACTION ONE QUARTER...NORTH INDIC PLACEHOLDER MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa840, 52)];  // PHAGS-PA LETTER KA...PHAGS-PA LETTER CANDRABINDU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa880, 68)];  // SAURASHTRA SIGN ANUSVARA...SAURASHTRA VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa8ce, 12)];  // SAURASHTRA DANDA...SAURASHTRA DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa8f2, 13)];  // DEVANAGARI SIGN SPACING CANDRABINDU...DEVANAGARI LETTER AY
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa900, 38)];  // KAYAH LI DIGIT ZERO...KAYAH LI LETTER OO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa92e, 25)];  // KAYAH LI SIGN CWI...REJANG LETTER A
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa952, 2)];  // REJANG CONSONANT SIGN H...REJANG VIRAMA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa95f, 30)];  // REJANG SECTION MARK...HANGUL CHOSEONG SSANGYEORINHIEUH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa983, 48)];  // JAVANESE SIGN WIGNYAN...JAVANESE LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa9b4, 2)];  // JAVANESE VOWEL SIGN TARUNG...JAVANESE VOWEL SIGN TOLONG
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa9ba, 2)];  // JAVANESE VOWEL SIGN TALING...JAVANESE VOWEL SIGN DIRGA MURE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa9be, 16)];  // JAVANESE CONSONANT SIGN PENGKAL...JAVANESE TURNED PADA PISELEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa9cf, 11)];  // JAVANESE PANGRANGKEP...JAVANESE DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa9de, 7)];  // JAVANESE PADA TIRTA TUMETES...MYANMAR LETTER SHAN BHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xa9e6, 25)];  // MYANMAR MODIFIER LETTER SHAN REDUPLICATION...MYANMAR LETTER TAI LAING BHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaa00, 41)];  // CHAM LETTER A...CHAM LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaa2f, 2)];  // CHAM VOWEL SIGN O...CHAM VOWEL SIGN AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaa33, 2)];  // CHAM CONSONANT SIGN YA...CHAM CONSONANT SIGN RA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaa40, 3)];  // CHAM LETTER FINAL K...CHAM LETTER FINAL NG
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaa44, 8)];  // CHAM LETTER FINAL CH...CHAM LETTER FINAL SS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaa4d, 1)];  // CHAM CONSONANT SIGN FINAL H
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaa50, 10)];  // CHAM DIGIT ZERO...CHAM DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaa5c, 32)];  // CHAM PUNCTUATION SPIRAL...MYANMAR SIGN PAO KAREN TONE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaa7d, 51)];  // MYANMAR SIGN TAI LAING TONE-5...TAI VIET LETTER HIGH O
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaab1, 1)];  // TAI VIET VOWEL AA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaab5, 2)];  // TAI VIET VOWEL E...TAI VIET VOWEL O
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaab9, 5)];  // TAI VIET VOWEL UEA...TAI VIET VOWEL AN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaac0, 1)];  // TAI VIET TONE MAI NUENG
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaac2, 1)];  // TAI VIET TONE MAI SONG
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaadb, 17)];  // TAI VIET SYMBOL KON...MEETEI MAYEK VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xaaee, 8)];  // MEETEI MAYEK VOWEL SIGN AU...MEETEI MAYEK VOWEL SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xab01, 6)];  // ETHIOPIC SYLLABLE TTHU...ETHIOPIC SYLLABLE TTHO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xab09, 6)];  // ETHIOPIC SYLLABLE DDHU...ETHIOPIC SYLLABLE DDHO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xab11, 6)];  // ETHIOPIC SYLLABLE DZU...ETHIOPIC SYLLABLE DZO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xab20, 7)];  // ETHIOPIC SYLLABLE CCHHA...ETHIOPIC SYLLABLE CCHHO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xab28, 7)];  // ETHIOPIC SYLLABLE BBA...ETHIOPIC SYLLABLE BBO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xab30, 58)];  // LATIN SMALL LETTER BARRED ALPHA...MODIFIER LETTER SMALL TURNED W
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xab70, 117)];  // CHEROKEE SMALL LETTER A...MEETEI MAYEK VOWEL SIGN INAP
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xabe6, 2)];  // MEETEI MAYEK VOWEL SIGN YENAP...MEETEI MAYEK VOWEL SIGN SOUNAP
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xabe9, 4)];  // MEETEI MAYEK VOWEL SIGN CHEINAP...MEETEI MAYEK LUM IYEK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xabf0, 10)];  // MEETEI MAYEK DIGIT ZERO...MEETEI MAYEK DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xac00, 1)];  // <Hangul Syllable, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd7a3, 1)];  // <Hangul Syllable, Last>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd7b0, 23)];  // HANGUL JUNGSEONG O-YEO...HANGUL JUNGSEONG ARAEA-E
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd7cb, 49)];  // HANGUL JONGSEONG NIEUN-RIEUL...HANGUL JONGSEONG PHIEUPH-THIEUTH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xd800, 1)];  // <Non Private Use High Surrogate, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xdb7f, 2)];  // <Non Private Use High Surrogate, Last>...<Private Use High Surrogate, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xdbff, 2)];  // <Private Use High Surrogate, Last>...<Low Surrogate, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xdfff, 2)];  // <Low Surrogate, Last>...<Private Use, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xf8ff, 367)];  // <Private Use, Last>...CJK COMPATIBILITY IDEOGRAPH-FA6D
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfa70, 106)];  // CJK COMPATIBILITY IDEOGRAPH-FA70...CJK COMPATIBILITY IDEOGRAPH-FAD9
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb00, 7)];  // LATIN SMALL LIGATURE FF...LATIN SMALL LIGATURE ST
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xfb13, 5)];  // ARMENIAN SMALL LIGATURE MEN NOW...ARMENIAN SMALL LIGATURE MEN XEH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xff21, 26)];  // FULLWIDTH LATIN CAPITAL LETTER A...FULLWIDTH LATIN CAPITAL LETTER Z
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xff41, 26)];  // FULLWIDTH LATIN SMALL LETTER A...FULLWIDTH LATIN SMALL LETTER Z
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xff66, 89)];  // HALFWIDTH KATAKANA LETTER WO...HALFWIDTH HANGUL LETTER HIEUH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xffc2, 6)];  // HALFWIDTH HANGUL LETTER A...HALFWIDTH HANGUL LETTER E
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xffca, 6)];  // HALFWIDTH HANGUL LETTER YEO...HALFWIDTH HANGUL LETTER OE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xffd2, 6)];  // HALFWIDTH HANGUL LETTER YO...HALFWIDTH HANGUL LETTER YU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xffda, 3)];  // HALFWIDTH HANGUL LETTER EU...HALFWIDTH HANGUL LETTER I
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10000, 12)];  // LINEAR B SYLLABLE B008 A...LINEAR B SYLLABLE B046 JE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1000d, 26)];  // LINEAR B SYLLABLE B036 JO...LINEAR B SYLLABLE B032 QO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10028, 19)];  // LINEAR B SYLLABLE B060 RA...LINEAR B SYLLABLE B042 WO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1003c, 2)];  // LINEAR B SYLLABLE B017 ZA...LINEAR B SYLLABLE B074 ZE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1003f, 15)];  // LINEAR B SYLLABLE B020 ZO...LINEAR B SYLLABLE B091 TWO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10050, 14)];  // LINEAR B SYMBOL B018...LINEAR B SYMBOL B089
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10080, 123)];  // LINEAR B IDEOGRAM B100 MAN...LINEAR B IDEOGRAM VESSEL B305
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10100, 1)];  // AEGEAN WORD SEPARATOR LINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10102, 1)];  // AEGEAN CHECK MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10107, 45)];  // AEGEAN NUMBER ONE...AEGEAN NUMBER NINETY THOUSAND
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10137, 9)];  // AEGEAN WEIGHT BASE UNIT...AEGEAN MEASURE THIRD SUBUNIT
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1018d, 2)];  // GREEK INDICTION SIGN...NOMISMA SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x101d0, 45)];  // PHAISTOS DISC SIGN PEDESTRIAN...PHAISTOS DISC SIGN WAVY BAND
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10280, 29)];  // LYCIAN LETTER A...LYCIAN LETTER X
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x102a0, 49)];  // CARIAN LETTER A...CARIAN LETTER UUU3
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10300, 36)];  // OLD ITALIC LETTER A...OLD ITALIC NUMERAL FIFTY
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1032d, 30)];  // OLD ITALIC LETTER YE...GOTHIC LETTER NINE HUNDRED
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10350, 38)];  // OLD PERMIC LETTER AN...OLD PERMIC LETTER IA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10380, 30)];  // UGARITIC LETTER ALPA...UGARITIC LETTER SSU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1039f, 37)];  // UGARITIC WORD DIVIDER...OLD PERSIAN SIGN HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x103c8, 14)];  // OLD PERSIAN SIGN AURAMAZDAA...OLD PERSIAN NUMBER HUNDRED
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10400, 158)];  // DESERET CAPITAL LETTER LONG I...OSMANYA LETTER OO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x104a0, 10)];  // OSMANYA DIGIT ZERO...OSMANYA DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x104b0, 36)];  // OSAGE CAPITAL LETTER A...OSAGE CAPITAL LETTER ZHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x104d8, 36)];  // OSAGE SMALL LETTER A...OSAGE SMALL LETTER ZHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10500, 40)];  // ELBASAN LETTER A...ELBASAN LETTER KHE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10530, 52)];  // CAUCASIAN ALBANIAN LETTER ALT...CAUCASIAN ALBANIAN LETTER KIW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1056f, 12)];  // CAUCASIAN ALBANIAN CITATION MARK...VITHKUQI CAPITAL LETTER GA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1057c, 15)];  // VITHKUQI CAPITAL LETTER HA...VITHKUQI CAPITAL LETTER RE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1058c, 7)];  // VITHKUQI CAPITAL LETTER SE...VITHKUQI CAPITAL LETTER XE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10594, 2)];  // VITHKUQI CAPITAL LETTER Y...VITHKUQI CAPITAL LETTER ZE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10597, 11)];  // VITHKUQI SMALL LETTER A...VITHKUQI SMALL LETTER GA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x105a3, 15)];  // VITHKUQI SMALL LETTER HA...VITHKUQI SMALL LETTER RE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x105b3, 7)];  // VITHKUQI SMALL LETTER SE...VITHKUQI SMALL LETTER XE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x105bb, 2)];  // VITHKUQI SMALL LETTER Y...VITHKUQI SMALL LETTER ZE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x105c0, 52)];  // TODHRI LETTER A...TODHRI LETTER OO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10600, 311)];  // LINEAR A SIGN AB001...LINEAR A SIGN A664
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10740, 22)];  // LINEAR A SIGN A701 A...LINEAR A SIGN A732 JE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10760, 8)];  // LINEAR A SIGN A800...LINEAR A SIGN A807
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10780, 6)];  // MODIFIER LETTER SMALL CAPITAL AA...MODIFIER LETTER SMALL B WITH HOOK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10787, 42)];  // MODIFIER LETTER SMALL DZ DIGRAPH...MODIFIER LETTER SMALL V WITH RIGHT HOOK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x107b2, 9)];  // MODIFIER LETTER SMALL CAPITAL Y...MODIFIER LETTER SMALL S WITH CURL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11000, 1)];  // BRAHMI SIGN CANDRABINDU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11002, 54)];  // BRAHMI SIGN VISARGA...BRAHMI LETTER OLD TAMIL NNNA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11047, 7)];  // BRAHMI DANDA...BRAHMI PUNCTUATION LOTUS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11066, 10)];  // BRAHMI DIGIT ZERO...BRAHMI DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11071, 2)];  // BRAHMI LETTER OLD TAMIL SHORT E...BRAHMI LETTER OLD TAMIL SHORT O
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11075, 1)];  // BRAHMI LETTER OLD TAMIL LLA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11082, 49)];  // KAITHI SIGN VISARGA...KAITHI VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x110b7, 2)];  // KAITHI VOWEL SIGN O...KAITHI VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x110bb, 7)];  // KAITHI ABBREVIATION SIGN...KAITHI DOUBLE DANDA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x110cd, 1)];  // KAITHI NUMBER SIGN ABOVE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x110d0, 25)];  // SORA SOMPENG LETTER SAH...SORA SOMPENG LETTER MAE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x110f0, 10)];  // SORA SOMPENG DIGIT ZERO...SORA SOMPENG DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11103, 36)];  // CHAKMA LETTER AA...CHAKMA LETTER HAA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1112c, 1)];  // CHAKMA VOWEL SIGN E
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11136, 18)];  // CHAKMA DIGIT ZERO...CHAKMA LETTER VAA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11150, 35)];  // MAHAJANI LETTER A...MAHAJANI LETTER RRA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11174, 3)];  // MAHAJANI ABBREVIATION SIGN...MAHAJANI LIGATURE SHRI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11182, 52)];  // SHARADA SIGN VISARGA...SHARADA VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x111bf, 10)];  // SHARADA VOWEL SIGN AU...SHARADA SEPARATOR
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x111cd, 2)];  // SHARADA SUTRA MARK...SHARADA VOWEL SIGN PRISHTHAMATRA E
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x111d0, 16)];  // SHARADA DIGIT ZERO...SHARADA SECTION MARK-2
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x111e1, 20)];  // SINHALA ARCHAIC DIGIT ONE...SINHALA ARCHAIC NUMBER ONE THOUSAND
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11200, 18)];  // KHOJKI LETTER A...KHOJKI LETTER JJA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11213, 28)];  // KHOJKI LETTER NYA...KHOJKI VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11232, 2)];  // KHOJKI VOWEL SIGN O...KHOJKI VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11235, 1)];  // KHOJKI SIGN VIRAMA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11238, 6)];  // KHOJKI DANDA...KHOJKI ABBREVIATION SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1123f, 2)];  // KHOJKI LETTER QA...KHOJKI LETTER SHORT I
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11280, 7)];  // MULTANI LETTER A...MULTANI LETTER GA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11288, 1)];  // MULTANI LETTER GHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1128a, 4)];  // MULTANI LETTER CA...MULTANI LETTER JJA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1128f, 15)];  // MULTANI LETTER NYA...MULTANI LETTER BA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1129f, 11)];  // MULTANI LETTER BHA...MULTANI SECTION MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x112b0, 47)];  // KHUDAWADI LETTER A...KHUDAWADI LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x112e0, 3)];  // KHUDAWADI VOWEL SIGN AA...KHUDAWADI VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x112f0, 10)];  // KHUDAWADI DIGIT ZERO...KHUDAWADI DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11302, 2)];  // GRANTHA SIGN ANUSVARA...GRANTHA SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11305, 8)];  // GRANTHA LETTER A...GRANTHA LETTER VOCALIC L
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1130f, 2)];  // GRANTHA LETTER EE...GRANTHA LETTER AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11313, 22)];  // GRANTHA LETTER OO...GRANTHA LETTER NA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1132a, 7)];  // GRANTHA LETTER PA...GRANTHA LETTER RA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11332, 2)];  // GRANTHA LETTER LA...GRANTHA LETTER LLA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11335, 5)];  // GRANTHA LETTER VA...GRANTHA LETTER HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1133d, 3)];  // GRANTHA SIGN AVAGRAHA...GRANTHA VOWEL SIGN I
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11341, 4)];  // GRANTHA VOWEL SIGN U...GRANTHA VOWEL SIGN VOCALIC RR
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11347, 2)];  // GRANTHA VOWEL SIGN EE...GRANTHA VOWEL SIGN AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1134b, 3)];  // GRANTHA VOWEL SIGN OO...GRANTHA SIGN VIRAMA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11350, 1)];  // GRANTHA OM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11357, 1)];  // GRANTHA AU LENGTH MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1135d, 7)];  // GRANTHA SIGN PLUTA...GRANTHA VOWEL SIGN VOCALIC LL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11380, 10)];  // TULU-TIGALARI LETTER A...TULU-TIGALARI LETTER VOCALIC LL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1138b, 1)];  // TULU-TIGALARI LETTER EE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1138e, 1)];  // TULU-TIGALARI LETTER AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11390, 38)];  // TULU-TIGALARI LETTER OO...TULU-TIGALARI LETTER LLLA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x113b7, 4)];  // TULU-TIGALARI SIGN AVAGRAHA...TULU-TIGALARI VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x113c2, 1)];  // TULU-TIGALARI VOWEL SIGN EE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x113c5, 1)];  // TULU-TIGALARI VOWEL SIGN AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x113c7, 4)];  // TULU-TIGALARI VOWEL SIGN OO...TULU-TIGALARI SIGN CANDRA ANUNASIKA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x113cc, 2)];  // TULU-TIGALARI SIGN ANUSVARA...TULU-TIGALARI SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x113cf, 1)];  // TULU-TIGALARI SIGN LOOPED VIRAMA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x113d1, 1)];  // TULU-TIGALARI REPHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x113d3, 3)];  // TULU-TIGALARI SIGN PLUTA...TULU-TIGALARI DOUBLE DANDA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x113d7, 2)];  // TULU-TIGALARI SIGN OM PUSHPIKA...TULU-TIGALARI SIGN SHRII PUSHPIKA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11400, 56)];  // NEWA LETTER A...NEWA VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11440, 2)];  // NEWA VOWEL SIGN O...NEWA VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11445, 1)];  // NEWA SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11447, 21)];  // NEWA SIGN AVAGRAHA...NEWA PLACEHOLDER MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1145d, 1)];  // NEWA INSERTION SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1145f, 3)];  // NEWA LETTER VEDIC ANUSVARA...NEWA SIGN UPADHMANIYA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11480, 51)];  // TIRHUTA ANJI...TIRHUTA VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x114b9, 1)];  // TIRHUTA VOWEL SIGN E
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x114bb, 4)];  // TIRHUTA VOWEL SIGN AI...TIRHUTA VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x114c1, 1)];  // TIRHUTA SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x114c4, 4)];  // TIRHUTA SIGN AVAGRAHA...TIRHUTA OM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x114d0, 10)];  // TIRHUTA DIGIT ZERO...TIRHUTA DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11580, 50)];  // SIDDHAM LETTER A...SIDDHAM VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x115b8, 4)];  // SIDDHAM VOWEL SIGN E...SIDDHAM VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x115be, 1)];  // SIDDHAM SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x115c1, 27)];  // SIDDHAM SIGN SIDDHAM...SIDDHAM LETTER ALTERNATE U
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11600, 51)];  // MODI LETTER A...MODI VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1163b, 2)];  // MODI VOWEL SIGN O...MODI VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1163e, 1)];  // MODI SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11641, 4)];  // MODI DANDA...MODI SIGN HUVA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11650, 10)];  // MODI DIGIT ZERO...MODI DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11680, 43)];  // TAKRI LETTER A...TAKRI LETTER RRA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x116ac, 1)];  // TAKRI SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x116ae, 2)];  // TAKRI VOWEL SIGN I...TAKRI VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x116b6, 1)];  // TAKRI SIGN VIRAMA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x116b8, 2)];  // TAKRI LETTER ARCHAIC KHA...TAKRI ABBREVIATION SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x116c0, 10)];  // TAKRI DIGIT ZERO...TAKRI DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x116d0, 20)];  // MYANMAR PAO DIGIT ZERO...MYANMAR EASTERN PWO KAREN DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11700, 27)];  // AHOM LETTER KA...AHOM LETTER ALTERNATE BA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1171e, 1)];  // AHOM CONSONANT SIGN MEDIAL RA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11720, 2)];  // AHOM VOWEL SIGN A...AHOM VOWEL SIGN AA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11726, 1)];  // AHOM VOWEL SIGN E
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11730, 23)];  // AHOM DIGIT ZERO...AHOM LETTER LLA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11800, 47)];  // DOGRA LETTER A...DOGRA VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11838, 1)];  // DOGRA SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1183b, 1)];  // DOGRA ABBREVIATION SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x118a0, 83)];  // WARANG CITI CAPITAL LETTER NGAA...WARANG CITI NUMBER NINETY
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x118ff, 8)];  // WARANG CITI OM...DIVES AKURU LETTER E
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11909, 1)];  // DIVES AKURU LETTER O
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1190c, 8)];  // DIVES AKURU LETTER KA...DIVES AKURU LETTER JA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11915, 2)];  // DIVES AKURU LETTER NYA...DIVES AKURU LETTER TTA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11918, 30)];  // DIVES AKURU LETTER DDA...DIVES AKURU VOWEL SIGN E
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11937, 2)];  // DIVES AKURU VOWEL SIGN AI...DIVES AKURU VOWEL SIGN O
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1193d, 1)];  // DIVES AKURU SIGN HALANTA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1193f, 4)];  // DIVES AKURU PREFIXED NASAL SIGN...DIVES AKURU MEDIAL RA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11944, 3)];  // DIVES AKURU DOUBLE DANDA...DIVES AKURU END OF TEXT MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11950, 10)];  // DIVES AKURU DIGIT ZERO...DIVES AKURU DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x119a0, 8)];  // NANDINAGARI LETTER A...NANDINAGARI LETTER VOCALIC RR
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x119aa, 42)];  // NANDINAGARI LETTER E...NANDINAGARI VOWEL SIGN II
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x119dc, 4)];  // NANDINAGARI VOWEL SIGN O...NANDINAGARI SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x119e1, 4)];  // NANDINAGARI SIGN AVAGRAHA...NANDINAGARI VOWEL SIGN PRISHTHAMATRA E
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11a00, 1)];  // ZANABAZAR SQUARE LETTER A
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11a07, 2)];  // ZANABAZAR SQUARE VOWEL SIGN AI...ZANABAZAR SQUARE VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11a0b, 40)];  // ZANABAZAR SQUARE LETTER KA...ZANABAZAR SQUARE LETTER KSSA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11a39, 2)];  // ZANABAZAR SQUARE SIGN VISARGA...ZANABAZAR SQUARE CLUSTER-INITIAL LETTER RA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11a3f, 8)];  // ZANABAZAR SQUARE INITIAL HEAD MARK...ZANABAZAR SQUARE CLOSING DOUBLE-LINED HEAD MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11a50, 1)];  // SOYOMBO LETTER A
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11a57, 2)];  // SOYOMBO VOWEL SIGN AI...SOYOMBO VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11a5c, 46)];  // SOYOMBO LETTER KA...SOYOMBO CLUSTER-INITIAL LETTER SA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11a97, 1)];  // SOYOMBO SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11a9a, 9)];  // SOYOMBO MARK TSHEG...SOYOMBO TERMINAL MARK-2
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11ab0, 73)];  // CANADIAN SYLLABICS NATTILIK HI...PAU CIN HAU GLOTTAL STOP FINAL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11b00, 10)];  // DEVANAGARI HEAD MARK...DEVANAGARI SIGN MINDU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11bc0, 34)];  // SUNUWAR LETTER DEVI...SUNUWAR SIGN PVO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11bf0, 10)];  // SUNUWAR DIGIT ZERO...SUNUWAR DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11c00, 9)];  // BHAIKSUKI LETTER A...BHAIKSUKI LETTER VOCALIC L
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11c0a, 38)];  // BHAIKSUKI LETTER E...BHAIKSUKI VOWEL SIGN AA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11c3e, 8)];  // BHAIKSUKI SIGN VISARGA...BHAIKSUKI GAP FILLER-2
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11c50, 29)];  // BHAIKSUKI DIGIT ZERO...BHAIKSUKI HUNDREDS UNIT MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11c70, 32)];  // MARCHEN HEAD MARK...MARCHEN LETTER A
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11ca9, 1)];  // MARCHEN SUBJOINED LETTER YA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11cb1, 1)];  // MARCHEN VOWEL SIGN I
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11cb4, 1)];  // MARCHEN VOWEL SIGN O
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11d00, 7)];  // MASARAM GONDI LETTER A...MASARAM GONDI LETTER E
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11d08, 2)];  // MASARAM GONDI LETTER AI...MASARAM GONDI LETTER O
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11d0b, 38)];  // MASARAM GONDI LETTER AU...MASARAM GONDI LETTER TRA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11d46, 1)];  // MASARAM GONDI REPHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11d50, 10)];  // MASARAM GONDI DIGIT ZERO...MASARAM GONDI DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11d60, 6)];  // GUNJALA GONDI LETTER A...GUNJALA GONDI LETTER UU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11d67, 2)];  // GUNJALA GONDI LETTER EE...GUNJALA GONDI LETTER AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11d6a, 37)];  // GUNJALA GONDI LETTER OO...GUNJALA GONDI VOWEL SIGN UU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11d93, 2)];  // GUNJALA GONDI VOWEL SIGN OO...GUNJALA GONDI VOWEL SIGN AU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11d96, 1)];  // GUNJALA GONDI SIGN VISARGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11d98, 1)];  // GUNJALA GONDI OM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11da0, 10)];  // GUNJALA GONDI DIGIT ZERO...GUNJALA GONDI DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11ee0, 19)];  // MAKASAR LETTER KA...MAKASAR ANGKA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11ef5, 4)];  // MAKASAR VOWEL SIGN E...MAKASAR END OF SECTION
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11f02, 15)];  // KAWI SIGN REPHA...KAWI LETTER O
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11f12, 36)];  // KAWI LETTER KA...KAWI VOWEL SIGN ALTERNATE AA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11f3e, 2)];  // KAWI VOWEL SIGN E...KAWI VOWEL SIGN AI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11f41, 1)];  // KAWI SIGN KILLER
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11f43, 23)];  // KAWI DANDA...KAWI DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11fb0, 1)];  // LISU LETTER YHA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11fc0, 21)];  // TAMIL FRACTION ONE THREE-HUNDRED-AND-TWENTIETH...TAMIL FRACTION DOWNSCALING FACTOR KIIZH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x11fff, 923)];  // TAMIL PUNCTUATION END OF TEXT...CUNEIFORM SIGN U U
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x12400, 111)];  // CUNEIFORM NUMERIC SIGN TWO ASH...CUNEIFORM NUMERIC SIGN NINE U VARIANT FORM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x12470, 5)];  // CUNEIFORM PUNCTUATION SIGN OLD ASSYRIAN WORD DIVIDER...CUNEIFORM PUNCTUATION SIGN DIAGONAL QUADCOLON
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x12480, 196)];  // CUNEIFORM SIGN AB TIMES NUN TENU...CUNEIFORM SIGN ZU5 TIMES THREE DISH TENU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x12f90, 99)];  // CYPRO-MINOAN SIGN CM001...CYPRO-MINOAN SIGN CM302
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x13000, 1088)];  // EGYPTIAN HIEROGLYPH A001...EGYPTIAN HIEROGLYPH END WALLED ENCLOSURE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x13441, 6)];  // EGYPTIAN HIEROGLYPH FULL BLANK...EGYPTIAN HIEROGLYPH WIDE LOST SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x13460, 3995)];  // EGYPTIAN HIEROGLYPH-13460...EGYPTIAN HIEROGLYPH-143FA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x14400, 583)];  // ANATOLIAN HIEROGLYPH A001...ANATOLIAN HIEROGLYPH A530
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16100, 30)];  // GURUNG KHEMA LETTER A...GURUNG KHEMA LETTER SA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1612a, 3)];  // GURUNG KHEMA CONSONANT SIGN MEDIAL YA...GURUNG KHEMA CONSONANT SIGN MEDIAL HA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16130, 10)];  // GURUNG KHEMA DIGIT ZERO...GURUNG KHEMA DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16800, 569)];  // BAMUM LETTER PHASE-A NGKUE MFON...BAMUM LETTER PHASE-F VUEQ
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16a40, 31)];  // MRO LETTER TA...MRO LETTER TEK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16a60, 10)];  // MRO DIGIT ZERO...MRO DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16a6e, 81)];  // MRO DANDA...TANGSA LETTER ZA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16ac0, 10)];  // TANGSA DIGIT ZERO...TANGSA DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16ad0, 30)];  // BASSA VAH LETTER ENNI...BASSA VAH LETTER I
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16af5, 1)];  // BASSA VAH FULL STOP
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16b00, 48)];  // PAHAWH HMONG VOWEL KEEB...PAHAWH HMONG CONSONANT CAU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16b37, 15)];  // PAHAWH HMONG SIGN VOS THOM...PAHAWH HMONG SIGN CIM TSOV ROG
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16b50, 10)];  // PAHAWH HMONG DIGIT ZERO...PAHAWH HMONG DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16b5b, 7)];  // PAHAWH HMONG NUMBER TENS...PAHAWH HMONG NUMBER TRILLIONS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16b63, 21)];  // PAHAWH HMONG SIGN VOS LUB...PAHAWH HMONG SIGN CIM NRES TOS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16b7d, 19)];  // PAHAWH HMONG CLAN SIGN TSHEEJ...PAHAWH HMONG CLAN SIGN VWJ
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16d40, 58)];  // KIRAT RAI SIGN ANUSVARA...KIRAT RAI DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16e40, 91)];  // MEDEFAIDRIN CAPITAL LETTER M...MEDEFAIDRIN EXCLAMATION OH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16f00, 75)];  // MIAO LETTER PA...MIAO LETTER RTE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16f50, 56)];  // MIAO LETTER NASALIZATION...MIAO VOWEL SIGN UI
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16f93, 13)];  // MIAO LETTER TONE-2...MIAO LETTER REFORMED TONE-8
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16fe0, 2)];  // TANGUT ITERATION MARK...NUSHU ITERATION MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16fe3, 1)];  // OLD CHINESE ITERATION MARK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x16ff0, 2)];  // VIETNAMESE ALTERNATE READING MARK CA...VIETNAMESE ALTERNATE READING MARK NHAY
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x17000, 1)];  // <Tangut Ideograph, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x187f7, 1)];  // <Tangut Ideograph, Last>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x18800, 1238)];  // TANGUT COMPONENT-001...KHITAN SMALL SCRIPT CHARACTER-18CD5
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x18cff, 2)];  // KHITAN SMALL SCRIPT CHARACTER-18CFF...<Tangut Ideograph Supplement, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x18d08, 1)];  // <Tangut Ideograph Supplement, Last>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1aff0, 4)];  // KATAKANA LETTER MINNAN TONE-2...KATAKANA LETTER MINNAN TONE-5
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1aff5, 7)];  // KATAKANA LETTER MINNAN TONE-7...KATAKANA LETTER MINNAN NASALIZED TONE-5
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1affd, 2)];  // KATAKANA LETTER MINNAN NASALIZED TONE-7...KATAKANA LETTER MINNAN NASALIZED TONE-8
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1b000, 291)];  // KATAKANA LETTER ARCHAIC E...KATAKANA LETTER ARCHAIC WU
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1b132, 1)];  // HIRAGANA LETTER SMALL KO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1b150, 3)];  // HIRAGANA LETTER SMALL WI...HIRAGANA LETTER SMALL WO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1b155, 1)];  // KATAKANA LETTER SMALL KO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1b164, 4)];  // KATAKANA LETTER SMALL WI...KATAKANA LETTER SMALL N
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1b170, 396)];  // NUSHU CHARACTER-1B170...NUSHU CHARACTER-1B2FB
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1bc00, 107)];  // DUPLOYAN LETTER H...DUPLOYAN LETTER VOCALIC M
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1bc70, 13)];  // DUPLOYAN AFFIX LEFT HORIZONTAL SECANT...DUPLOYAN AFFIX ATTACHED TANGENT HOOK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1bc80, 9)];  // DUPLOYAN AFFIX HIGH ACUTE...DUPLOYAN AFFIX HIGH VERTICAL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1bc90, 10)];  // DUPLOYAN AFFIX LOW ACUTE...DUPLOYAN AFFIX LOW ARROW
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1bc9c, 1)];  // DUPLOYAN SIGN O WITH CROSS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1bc9f, 1)];  // DUPLOYAN PUNCTUATION CHINOOK FULL STOP
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1ccd6, 26)];  // OUTLINED LATIN CAPITAL LETTER A...OUTLINED LATIN CAPITAL LETTER Z
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1cf50, 116)];  // ZNAMENNY NEUME KRYUK...ZNAMENNY NEUME PAUK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d000, 246)];  // BYZANTINE MUSICAL SYMBOL PSILI...BYZANTINE MUSICAL SYMBOL GORGON NEO KATO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d100, 39)];  // MUSICAL SYMBOL SINGLE BARLINE...MUSICAL SYMBOL DRUM CLEF-2
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d129, 62)];  // MUSICAL SYMBOL MULTIPLE MEASURE REST...MUSICAL SYMBOL COMBINING SPRECHGESANG STEM
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d16a, 9)];  // MUSICAL SYMBOL FINGERED TREMOLO-1...MUSICAL SYMBOL COMBINING FLAG-5
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d183, 2)];  // MUSICAL SYMBOL ARPEGGIATO UP...MUSICAL SYMBOL ARPEGGIATO DOWN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d18c, 30)];  // MUSICAL SYMBOL RINFORZANDO...MUSICAL SYMBOL DEGREE SLASH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d1ae, 59)];  // MUSICAL SYMBOL PEDAL MARK...MUSICAL SYMBOL KIEVAN FLAT SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d2c0, 20)];  // KAKTOVIK NUMERAL ZERO...KAKTOVIK NUMERAL NINETEEN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d2e0, 20)];  // MAYAN NUMERAL ZERO...MAYAN NUMERAL NINETEEN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d360, 25)];  // COUNTING ROD UNIT DIGIT ONE...TALLY MARK FIVE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d400, 85)];  // MATHEMATICAL BOLD CAPITAL A...MATHEMATICAL ITALIC SMALL G
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d456, 71)];  // MATHEMATICAL ITALIC SMALL I...MATHEMATICAL SCRIPT CAPITAL A
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d49e, 2)];  // MATHEMATICAL SCRIPT CAPITAL C...MATHEMATICAL SCRIPT CAPITAL D
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d4a2, 1)];  // MATHEMATICAL SCRIPT CAPITAL G
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d4a5, 2)];  // MATHEMATICAL SCRIPT CAPITAL J...MATHEMATICAL SCRIPT CAPITAL K
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d4a9, 4)];  // MATHEMATICAL SCRIPT CAPITAL N...MATHEMATICAL SCRIPT CAPITAL Q
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d4ae, 12)];  // MATHEMATICAL SCRIPT CAPITAL S...MATHEMATICAL SCRIPT SMALL D
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d4bb, 1)];  // MATHEMATICAL SCRIPT SMALL F
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d4bd, 7)];  // MATHEMATICAL SCRIPT SMALL H...MATHEMATICAL SCRIPT SMALL N
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d4c5, 65)];  // MATHEMATICAL SCRIPT SMALL P...MATHEMATICAL FRAKTUR CAPITAL B
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d507, 4)];  // MATHEMATICAL FRAKTUR CAPITAL D...MATHEMATICAL FRAKTUR CAPITAL G
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d50d, 8)];  // MATHEMATICAL FRAKTUR CAPITAL J...MATHEMATICAL FRAKTUR CAPITAL Q
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d516, 7)];  // MATHEMATICAL FRAKTUR CAPITAL S...MATHEMATICAL FRAKTUR CAPITAL Y
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d51e, 28)];  // MATHEMATICAL FRAKTUR SMALL A...MATHEMATICAL DOUBLE-STRUCK CAPITAL B
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d53b, 4)];  // MATHEMATICAL DOUBLE-STRUCK CAPITAL D...MATHEMATICAL DOUBLE-STRUCK CAPITAL G
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d540, 5)];  // MATHEMATICAL DOUBLE-STRUCK CAPITAL I...MATHEMATICAL DOUBLE-STRUCK CAPITAL M
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d546, 1)];  // MATHEMATICAL DOUBLE-STRUCK CAPITAL O
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d54a, 7)];  // MATHEMATICAL DOUBLE-STRUCK CAPITAL S...MATHEMATICAL DOUBLE-STRUCK CAPITAL Y
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d552, 340)];  // MATHEMATICAL DOUBLE-STRUCK SMALL A...MATHEMATICAL ITALIC SMALL DOTLESS J
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d6a8, 25)];  // MATHEMATICAL BOLD CAPITAL ALPHA...MATHEMATICAL BOLD CAPITAL OMEGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d6c2, 25)];  // MATHEMATICAL BOLD SMALL ALPHA...MATHEMATICAL BOLD SMALL OMEGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d6dc, 31)];  // MATHEMATICAL BOLD EPSILON SYMBOL...MATHEMATICAL ITALIC CAPITAL OMEGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d6fc, 25)];  // MATHEMATICAL ITALIC SMALL ALPHA...MATHEMATICAL ITALIC SMALL OMEGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d716, 31)];  // MATHEMATICAL ITALIC EPSILON SYMBOL...MATHEMATICAL BOLD ITALIC CAPITAL OMEGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d736, 25)];  // MATHEMATICAL BOLD ITALIC SMALL ALPHA...MATHEMATICAL BOLD ITALIC SMALL OMEGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d750, 31)];  // MATHEMATICAL BOLD ITALIC EPSILON SYMBOL...MATHEMATICAL SANS-SERIF BOLD CAPITAL OMEGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d770, 25)];  // MATHEMATICAL SANS-SERIF BOLD SMALL ALPHA...MATHEMATICAL SANS-SERIF BOLD SMALL OMEGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d78a, 31)];  // MATHEMATICAL SANS-SERIF BOLD EPSILON SYMBOL...MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL OMEGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d7aa, 25)];  // MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL ALPHA...MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL OMEGA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d7c4, 8)];  // MATHEMATICAL SANS-SERIF BOLD ITALIC EPSILON SYMBOL...MATHEMATICAL BOLD SMALL DIGAMMA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1d800, 512)];  // SIGNWRITING HAND-FIST INDEX...SIGNWRITING HEAD
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1da37, 4)];  // SIGNWRITING AIR BLOW SMALL ROTATIONS...SIGNWRITING BREATH EXHALE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1da6d, 8)];  // SIGNWRITING SHOULDER HIP SPINE...SIGNWRITING TORSO-FLOORPLANE TWISTING
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1da76, 14)];  // SIGNWRITING LIMB COMBINATION...SIGNWRITING LOCATION DEPTH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1da85, 7)];  // SIGNWRITING LOCATION TORSO...SIGNWRITING PARENTHESIS
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1df00, 31)];  // LATIN SMALL LETTER FENG DIGRAPH WITH TRILL...LATIN SMALL LETTER S WITH CURL
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1df25, 6)];  // LATIN SMALL LETTER D WITH MID-HEIGHT LEFT HOOK...LATIN SMALL LETTER T WITH MID-HEIGHT LEFT HOOK
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e030, 62)];  // MODIFIER LETTER CYRILLIC SMALL A...MODIFIER LETTER CYRILLIC SMALL STRAIGHT U WITH STROKE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e100, 45)];  // NYIAKENG PUACHUE HMONG LETTER MA...NYIAKENG PUACHUE HMONG LETTER W
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e137, 7)];  // NYIAKENG PUACHUE HMONG SIGN FOR PERSON...NYIAKENG PUACHUE HMONG SYLLABLE LENGTHENER
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e140, 10)];  // NYIAKENG PUACHUE HMONG DIGIT ZERO...NYIAKENG PUACHUE HMONG DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e14e, 2)];  // NYIAKENG PUACHUE HMONG LOGOGRAM NYAJ...NYIAKENG PUACHUE HMONG CIRCLED CA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e290, 30)];  // TOTO LETTER PA...TOTO LETTER A
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e2c0, 44)];  // WANCHO LETTER AA...WANCHO LETTER YIH
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e2f0, 10)];  // WANCHO DIGIT ZERO...WANCHO DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e4d0, 28)];  // NAG MUNDARI LETTER O...NAG MUNDARI SIGN OJOD
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e4f0, 10)];  // NAG MUNDARI DIGIT ZERO...NAG MUNDARI DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e5d0, 30)];  // OL ONAL LETTER O...OL ONAL LETTER EG
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e5f0, 11)];  // OL ONAL SIGN HODDOND...OL ONAL DIGIT NINE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e5ff, 1)];  // OL ONAL ABBREVIATION SIGN
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e7e0, 7)];  // ETHIOPIC SYLLABLE HHYA...ETHIOPIC SYLLABLE HHYO
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e7e8, 4)];  // ETHIOPIC SYLLABLE GURAGE HHWA...ETHIOPIC SYLLABLE HHWE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e7ed, 2)];  // ETHIOPIC SYLLABLE GURAGE MWI...ETHIOPIC SYLLABLE GURAGE MWEE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1e7f0, 15)];  // ETHIOPIC SYLLABLE GURAGE QWI...ETHIOPIC SYLLABLE GURAGE PWEE
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1f110, 31)];  // PARENTHESIZED LATIN CAPITAL LETTER A...CIRCLED WZ
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1f130, 58)];  // SQUARED LATIN CAPITAL LETTER A...NEGATIVE CIRCLED LATIN CAPITAL LETTER Z
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1f170, 61)];  // NEGATIVE SQUARED LATIN CAPITAL LETTER A...SQUARED VOD
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1f1e6, 29)];  // REGIONAL INDICATOR SYMBOL LETTER A...SQUARED KATAKANA SA
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1f210, 44)];  // SQUARED CJK UNIFIED IDEOGRAPH-624B...SQUARED CJK UNIFIED IDEOGRAPH-914D
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1f240, 9)];  // TORTOISE SHELL BRACKETED CJK UNIFIED IDEOGRAPH-672C...TORTOISE SHELL BRACKETED CJK UNIFIED IDEOGRAPH-6557
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x1f250, 2)];  // CIRCLED IDEOGRAPH ADVANTAGE...CIRCLED IDEOGRAPH ACCEPT
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x20000, 1)];  // <CJK Ideograph Extension B, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2a6df, 1)];  // <CJK Ideograph Extension B, Last>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2a700, 1)];  // <CJK Ideograph Extension C, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2b739, 1)];  // <CJK Ideograph Extension C, Last>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2b740, 1)];  // <CJK Ideograph Extension D, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2b81d, 1)];  // <CJK Ideograph Extension D, Last>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2b820, 1)];  // <CJK Ideograph Extension E, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2cea1, 1)];  // <CJK Ideograph Extension E, Last>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2ceb0, 1)];  // <CJK Ideograph Extension F, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2ebe0, 1)];  // <CJK Ideograph Extension F, Last>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2ebf0, 1)];  // <CJK Ideograph Extension I, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2ee5d, 1)];  // <CJK Ideograph Extension I, Last>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2f800, 542)];  // CJK COMPATIBILITY IDEOGRAPH-2F800...CJK COMPATIBILITY IDEOGRAPH-2FA1D
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x30000, 1)];  // <CJK Ideograph Extension G, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x3134a, 1)];  // <CJK Ideograph Extension G, Last>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x31350, 1)];  // <CJK Ideograph Extension H, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x323af, 1)];  // <CJK Ideograph Extension H, Last>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xf0000, 1)];  // <Plane 15 Private Use, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0xffffd, 1)];  // <Plane 15 Private Use, Last>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x100000, 1)];  // <Plane 16 Private Use, First>
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x10fffd, 1)];  // <Plane 16 Private Use, Last>

        characterSet = mutableCharacterSet;
    });
    return characterSet;
}

+ (NSCharacterSet *)it_unsafeForDisplayCharacters {
    static dispatch_once_t onceToken;
    static NSCharacterSet *unwantedCharacters;
    dispatch_once(&onceToken, ^{
        NSMutableCharacterSet *mutableCharacterSet = [NSMutableCharacterSet new];

        // Add control characters (C0 and C1 controls)
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x0000, 0x0020)]; // C0
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x007F, 0x0080)]; // Delete
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x0080, 0x0020)]; // C1

        // Add bidi control characters
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x202A, 0x0005)]; // LRE to PDF
        [mutableCharacterSet addCharactersInRange:NSMakeRange(0x2066, 0x0004)]; // LRI to PDI

        // Add zero-width and formatting characters
        [mutableCharacterSet addCharactersInString:@"\u200B\u200C\u200D\uFEFF\u00AD\u2060\u2064"];

        unwantedCharacters = mutableCharacterSet;
    });
    return unwantedCharacters;
}

+ (NSCharacterSet *)it_base64Characters {
    static NSCharacterSet *cached;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableCharacterSet *charset = [[NSMutableCharacterSet alloc] init];
        [charset addCharactersInRange:NSMakeRange('A', 26)];
        [charset addCharactersInRange:NSMakeRange('a', 26)];
        [charset addCharactersInRange:NSMakeRange('0', 10)];
        [charset addCharactersInString:@"+/="];
        [charset formUnionWithCharacterSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        cached = charset;

    });
    return cached;
}

+ (NSCharacterSet *)it_urlSafeBse64Characters {
    static NSCharacterSet *cached;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableCharacterSet *charset = [[NSMutableCharacterSet alloc] init];
        [charset addCharactersInRange:NSMakeRange('A', 26)];
        [charset addCharactersInRange:NSMakeRange('z', 26)];
        [charset addCharactersInRange:NSMakeRange('0', 10)];
        [charset addCharactersInString:@"-_="];
        [charset formUnionWithCharacterSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        cached = charset;

    });
    return cached;
}

@end
