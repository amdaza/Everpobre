//
//  AGTNotebookViewCell.m
//  Everpobre
//
//  Created by Alicia Daza on 05/04/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import "AGTNotebookViewCell.h"

@implementation AGTNotebookViewCell



+ (NSString *) cellId{
    return NSStringFromClass(self);
}

+ (CGFloat) cellHeight{
    return 60.6f;
}

// ??

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
