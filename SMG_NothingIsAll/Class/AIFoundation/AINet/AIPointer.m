//
//  AIPointer.m
//  SMG_NothingIsAll
//
//  Created by 贾  on 2017/5/20.
//  Copyright © 2017年 XiaoGang. All rights reserved.
//

#import "AIPointer.h"

@interface AIPointer ()

@property (assign, nonatomic) NSInteger pointerId;  //指针地址(Id)

@end

@implementation AIPointer

/**
 *  MARK:--------------------public--------------------
 */
-(BOOL) isEqual:(AIPointer*)object{//重写指针对比地址方法;
    if (POINTERISOK(object)) {
        return (self.pointerId == ((AIPointer*)object).pointerId);
    }
    return false;
}

-(id) content{
    return nil;
}

-(NSInteger)pointerId{
    if (_pointerId == 0) {
        _pointerId = [SMGUtils aiPointer_CreatePointerId];
    }
    return _pointerId;
}

/**
 *  MARK:--------------------NSCoding--------------------
 */
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.pointerId = [aDecoder decodeIntegerForKey:@"pointerId"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:self.pointerId forKey:@"pointerId"];
}

@end
