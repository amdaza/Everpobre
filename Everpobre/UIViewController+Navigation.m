//
//  UIViewController+Navigation.m
//  Everpobre
//
//  Created by Alicia Daza on 04/04/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

- (UINavigationController *) wrappedInNavigation{
    
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:self];
    return nav;
}

@end
