//
//  FirstCollectionViewCell.m
//  FilmAPP
//
//  Created by 金颀超 on 15/9/17.
//  Copyright (c) 2015年 金颀超. All rights reserved.
//

#import "FirstCollectionViewCell.h"

@implementation FirstCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        [self addSubview:_imageView];
    }
    
    return self;
}

- (void)setImageString:(NSString *)imageString {
    
    if (_imageString != imageString) {
        [_imageString release];
        _imageString = [imageString copy];
        
        //设置
        _imageView.image = [UIImage imageNamed:_imageString];
    }
    
}
@end
