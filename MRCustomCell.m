//
//  MRCustomCell.m
//  Test
//
//  Created by Mohammad Masud Rana on 7/9/15.
//  Copyright (c) 2015 Mohammad Masud Rana. All rights reserved.
//

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

#import "MRCustomCell.h"
#import "Global.h"

@implementation MRCustomCell

@synthesize descriptionLabel = _descriptionLabel;
@synthesize image = _image;
@synthesize likeImage = _likeImage;
@synthesize titleLabel = _titleLabel;
@synthesize cellHeight = _cellHeight;
@synthesize itemNoLabel = _itemNoLabel;
@synthesize videoImage = _videoImage;
@synthesize nImage = _nImage;



-(UIImage *)adjustImageSizeWhenCropping:(UIImage *)image
{
    float actualHeight = image.size.height;
    
    float actualWidth = image.size.width;

    float ratio=screenWidth/actualWidth;
    actualHeight = actualHeight*ratio;
    
    CGRect rect = CGRectMake(0.0, 0.0, screenWidth, actualHeight);
    // UIGraphicsBeginImageContext(rect.size);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 1.0);
    [image drawInRect:rect];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
//
//- (UIImage *)scaleImage:(UIImage *)originalImage toSize:(CGSize)size
//{
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGContextRef context = CGBitmapContextCreate(NULL, size.width, size.height, 8, 0, colorSpace, kCGImageAlphaPremultipliedLast);
//    CGContextClearRect(context, CGRectMake(0, 0, size.width, size.height));
//    
//    if (originalImage.imageOrientation == UIImageOrientationRight) {
//        CGContextRotateCTM(context, -M_PI_2);
//        CGContextTranslateCTM(context, -size.height, 0.0f);
//        CGContextDrawImage(context, CGRectMake(0, 0, size.height, size.width), originalImage.CGImage);
//    } else {
//        CGContextDrawImage(context, CGRectMake(0, 0, size.width, size.height), originalImage.CGImage);
//    }
//    
//    CGImageRef scaledImage = CGBitmapContextCreateImage(context);
//    CGColorSpaceRelease(colorSpace);
//    CGContextRelease(context);
//    
//    UIImage *image = [UIImage imageWithCGImage:scaledImage];
//    CGImageRelease(scaledImage);
//    
//    return image;
//}
//
//- (CGSize)estimateNewSize:(CGSize)newSize forImage:(UIImage *)image
//{
//    if (image.size.width > image.size.height) {
//        newSize = CGSizeMake((image.size.width/image.size.height) * newSize.height, newSize.height);
//    } else {
//        newSize = CGSizeMake(newSize.width, (image.size.height/image.size.width) * newSize.width);
//    }
//    
//    return newSize;
//}
//
//- (UIImage *)scaleImage:(UIImage *)image proportionallyToSize:(CGSize)newSize
//{
//    return [self scaleImage:image toSize:[self estimateNewSize:newSize forImage:image]]; // Added missing ]
//}
//
//- (UIImage *)scaleImageWithData:(NSData *)imageData proportionallyToSize:(CGSize)newSize
//{
//    UIImage *image = [UIImage imageWithData:imageData]; // image was unknown
//    return [self scaleImage:[UIImage imageWithData:imageData] toSize:[self estimateNewSize:newSize forImage:image]];
//}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // configure control(s)

        NSString *whichScreen = [[NSUserDefaults standardUserDefaults] objectForKey:@"ScreenName"];
        
        if ([whichScreen isEqualToString:@"category"]) {
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
                self.cellHeight = 140;
            }
            else{
                self.cellHeight = 180;
            }
            
            self.image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, self.cellHeight - 48)];
            //self.image.image = [self adjustImageSizeWhenCropping:self.image.image];
            //self.image.image = [self scaleImage:self.image.image proportionallyToSize:CGSizeMake(screenWidth, 92)];
            //self.image.image = [self imageWithImage:self.image.image scaledToSize:CGSizeMake(screenWidth, 92)];
            self.image.contentMode = UIViewContentModeScaleAspectFill;
            self.image.clipsToBounds = YES;
            [self addSubview:self.image];
            
            self.nImage = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth - (self.image.bounds.size.height/1.73), 0, self.image.bounds.size.height/1.73, self.image.bounds.size.height/2)];
            self.nImage.contentMode = UIViewContentModeScaleToFill;
            self.nImage.clipsToBounds = YES;
            [self addSubview:self.nImage];
            
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(26, self.cellHeight - 47, screenWidth - (26 + 65), 29)];
            self.titleLabel.textColor = [UIColor colorWithRed:254.0/255.0 green:83.0/255.0 blue:57.0/255.0 alpha:1.0];
            //self.titleLabel.backgroundColor = [UIColor blueColor];
            self.titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
            self.titleLabel.numberOfLines = 1;
            [self addSubview:self.titleLabel];
            
            self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(26, self.cellHeight - 25, screenWidth - (26 + 65), 20.0f)];
            self.descriptionLabel.textColor = [UIColor blackColor];
            //self.descriptionLabel.backgroundColor = [UIColor blueColor];
            self.descriptionLabel.font = [UIFont boldSystemFontOfSize:10.0f];
            self.descriptionLabel.numberOfLines = 1;
            [self addSubview:self.descriptionLabel];
            
            self.itemNoLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth - 65, self.cellHeight - 36, 50, 21.0f)];
            self.itemNoLabel.textColor = [UIColor colorWithRed:254.0/255.0 green:83.0/255.0 blue:57.0/255.0 alpha:1.0];
            self.itemNoLabel.textAlignment = NSTextAlignmentRight;
            //self.itemNoLabel.backgroundColor = [UIColor blueColor];
            self.itemNoLabel.font = [UIFont boldSystemFontOfSize:14.0f];
            [self addSubview:self.itemNoLabel];
        }
        else if ([whichScreen isEqualToString:@"categoryItem"]) {
            self.cellHeight = 80;
            
            self.image = [[UIImageView alloc] initWithFrame:CGRectMake(self.cellHeight*0.05, self.cellHeight*0.05, screenWidth*0.3, self.cellHeight*0.9)];
            self.image.contentMode = UIViewContentModeScaleAspectFill;
            self.image.clipsToBounds = YES;
            [self addSubview:self.image];
            
            self.nImage = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth - (self.image.bounds.size.height/1.73), 0, self.image.bounds.size.height/1.73, self.image.bounds.size.height/2)];
            self.nImage.contentMode = UIViewContentModeScaleToFill;
            self.nImage.clipsToBounds = YES;
            [self addSubview:self.nImage];
            
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.33, self.cellHeight*0.05 , screenWidth*0.46, self.cellHeight*0.9)];
            self.titleLabel.textColor = [UIColor colorWithRed:254.0/255.0 green:83.0/255.0 blue:57.0/255.0 alpha:1.0];
            self.titleLabel.contentMode = UIViewContentModeCenter;
            self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
            self.titleLabel.numberOfLines = 0;
            //self.titleLabel.backgroundColor = [UIColor blueColor];
            self.titleLabel.font = [UIFont boldSystemFontOfSize:14.0 * fontSize];
            [self addSubview:self.titleLabel];
            
            self.videoImage = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth - 35, self.cellHeight/2 - 10, 25, 20)];
            self.videoImage.contentMode = UIViewContentModeScaleAspectFit;
            self.videoImage.clipsToBounds = YES;
            [self addSubview:self.videoImage];
            
            self.likeImage = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth - 60, self.cellHeight/2 - 10, 20, 20)];
            self.likeImage.contentMode = UIViewContentModeScaleAspectFit;
            self.likeImage.clipsToBounds = YES;
            [self addSubview:self.likeImage];
        }
        else if ([whichScreen isEqualToString:@"videoItem"]) {
            self.cellHeight = 80;
            self.image = [[UIImageView alloc] initWithFrame:CGRectMake(self.cellHeight*0.05, self.cellHeight*0.05, screenWidth*0.3, self.cellHeight*0.9)];
            self.image.contentMode = UIViewContentModeScaleAspectFill;
            self.image.clipsToBounds = YES;
            [self addSubview:self.image];
            
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.35, self.cellHeight/2 - 11, screenWidth*0.65, 20)];
            self.titleLabel.textColor = [UIColor colorWithRed:254.0/255.0 green:83.0/255.0 blue:57.0/255.0 alpha:1.0];
            //self.titleLabel.backgroundColor = [UIColor blueColor];
            self.titleLabel.font = [UIFont boldSystemFontOfSize:14.0 * fontSize];
            [self addSubview:self.titleLabel];
            
            self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.35, self.cellHeight/2 + 8, screenWidth*0.65, 16)];
            self.descriptionLabel.textColor = [UIColor blackColor];
            //self.descriptionLabel.backgroundColor = [UIColor blueColor];
            self.descriptionLabel.font = [UIFont boldSystemFontOfSize:10.0f];
            [self addSubview:self.descriptionLabel];
            
            
        }
        else if ([whichScreen isEqualToString:@"favoriteItem"]) {
            self.cellHeight = 80;
            self.image = [[UIImageView alloc] initWithFrame:CGRectMake(self.cellHeight*0.05, self.cellHeight*0.05, screenWidth*0.3, self.cellHeight*0.9)];
            self.image.contentMode = UIViewContentModeScaleAspectFill;
            self.image.clipsToBounds = YES;
            [self addSubview:self.image];
            
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth*0.33, self.cellHeight*0.05 , screenWidth*0.55, self.cellHeight*0.9)];
            self.titleLabel.textColor = [UIColor colorWithRed:254.0/255.0 green:83.0/255.0 blue:57.0/255.0 alpha:1.0];
            self.titleLabel.contentMode = UIViewContentModeCenter;
            self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
            self.titleLabel.numberOfLines = 0;
            //self.titleLabel.backgroundColor = [UIColor blueColor];
            self.titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
            [self addSubview:self.titleLabel];
            
            self.videoImage = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth - 35, self.cellHeight/2 - 10, 25, 20)];
            self.videoImage.contentMode = UIViewContentModeScaleAspectFit;
            self.videoImage.clipsToBounds = YES;
            [self addSubview:self.videoImage];
        }
        
    }
    return self;
}

@end
