//
//  FontFamilyModel.h
//  字体类型列表
//
//  Created by gary.liu on 17/4/20.
//  Copyright © 2017年 刘林飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FontFamilyModel : NSObject

@property (nonatomic, copy) NSString *familyName;
@property (nonatomic, strong) NSMutableArray *fontNames;

@end
