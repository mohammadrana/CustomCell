//
//  MRCustomCell.h
//  Test
//
//  Created by Mohammad Masud Rana on 7/9/15.
//  Copyright (c) 2015 codemen. All rights reserved.
//

#import <UIKit/UIKit.h>

// extends UITableViewCell
@interface MRCustomCell : UITableViewCell

// now only showing one label, you can add more yourself
@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UIImageView *likeImage;
@property (nonatomic, strong) UIImageView *videoImage;

@property (nonatomic, strong) UIImageView *nImage;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UILabel *itemNoLabel;

@property (assign) float cellHeight;

@end
