//
//  SWButton.h
//  SWBase
//
//  Created by willow on 2018/2/23.
//  Copyright © 2018年 swiftwhale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWButton : UIButton

typedef NS_ENUM(NSInteger,SWButtonStyle){
    SWButtonStyleSolid,
    SWButtonStyleHollow
};

+ (SWButton *)buttonWithTitle:(NSString *)title fontsize:(CGFloat)size color:(UIColor *)color sytle:(SWButtonStyle)style fView:(UIView *)fview;

@end
