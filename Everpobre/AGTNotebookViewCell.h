//
//  AGTNotebookViewCell.h
//  Everpobre
//
//  Created by Alicia Daza on 05/04/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGTNotebookViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *nameView;

@property (nonatomic, strong) IBOutlet UILabel *numberOfNotesView;

+ (NSString *) cellId;

+ (CGFloat) cellHeight;

@end
