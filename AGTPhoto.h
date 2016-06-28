#import "_AGTPhoto.h"

@import UIKit;

@interface AGTPhoto : _AGTPhoto {}

@property(nonatomic, strong) UIImage *image;

+(instancetype) photoWithImage:(UIImage *) image
                       context:(NSManagedObjectContext *) context;
@end