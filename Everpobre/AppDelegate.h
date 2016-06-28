//
//  AppDelegate.h
//  Everpobre
//
//  Created by Alicia Daza on 20/03/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AGTSimpleCoreDataStack;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AGTSimpleCoreDataStack *model;

@end

