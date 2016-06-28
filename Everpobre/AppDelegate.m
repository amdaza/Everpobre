//
//  AppDelegate.m
//  Everpobre
//
//  Created by Alicia Daza on 20/03/16.
//  Copyright © 2016 Alicia Daza. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTSimpleCoreDataStack.h"
#import "AGTNote.h"
#import "AGTNotebook.h"
#import "Settings.h"
#import "AGTNotebooksViewController.h"
#import "UIViewController+Navigation.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //Create Core Data stack instance
    self.model = [AGTSimpleCoreDataStack coreDataStackWithModelName:@"EverModel"];
    
    //[self playWithData];
    
    [self autoSave];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[AGTNotebook entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:AGTNamedEntityAttributes.modificationDate
                                                          ascending:NO],
                            [NSSortDescriptor sortDescriptorWithKey:AGTNamedEntityAttributes.name
                                                          ascending:YES]];
    NSFetchedResultsController *results = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                              managedObjectContext:self.model.context
                                                                                sectionNameKeyPath:nil
                                                                                         cacheName:nil];
    
    AGTNotebooksViewController *nbVC = [[AGTNotebooksViewController alloc]
                                        initWithFetchedResultsController:results
                                        style:UITableViewStylePlain];
    /* Before nav category
    UINavigationController *navVC = [[UINavigationController alloc]
                                     initWithRootViewController: nbVC];
    
    self.window.rootViewController = navVC;
    */
    
    self.window.rootViewController = [nbVC wrappedInNavigation];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    //Save
    [self save];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    //Save
    [self save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"Sayonara baby");
}


#pragma mark - Utils

- (void) playWithData{
    
    /*
     //OLD MODE
    //Create note
    NSManagedObject *note = [NSEntityDescription
                             insertNewObjectForEntityForName:@"Note"
                             inManagedObjectContext:self.model.context];
    
    //Assign values to properties using KVC
    [note setValue: @"WWDC" forKey: @"name"];
    [note setValue: [NSDate date] forKey: @"creationDate"];
    
    NSLog(@"Name is %@.", [note valueForKey:@"name"]);
    NSLog(@"Object is %@.", note);
     */
    
    /*
     //BEFORE MOGENERATOR
    
    //Create note
    Note *n = [NSEntityDescription
               insertNewObjectForEntityForName: @"Note"
        inManagedObjectContext:self.model.context];
    
    
    
    n.creationDate = [NSDate date];
    n.name = @"Hi Core Data";
    
    //Create notebook
    Notebook *nb = [Notebook notebookWithName:@"Mi libreta"
                                      context:self.model.context];
    
    //Add note to notebook
    n.notebook = nb;
     
     */
    
    //Create data for save
    AGTNotebook *novios = [AGTNotebook notebookWithName: @"Ex-novios para el recuerdo"
                                                context: self.model.context];
    
    /*AGTNote *pepe =*/ [AGTNote noteWithName: @"Pepe"
                                 notebook: novios
                                  context: self.model.context];
    
    AGTNote *paco = [AGTNote noteWithName: @"Paco"
                                 notebook: novios
                                  context: self.model.context];
    
    //Search
    NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName: [AGTNote entityName]];
    
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:AGTNamedEntityAttributes.name
                                                          ascending:YES],
                            [NSSortDescriptor sortDescriptorWithKey:AGTNamedEntityAttributes.modificationDate
                                                          ascending:NO]];
    NSError * error = nil;
    
    NSArray *results =  [self.model.context executeFetchRequest:req
                                                          error:&error];
    
    if(results == nil) {
        NSLog(@"Error al buscar: %@", results);
    } else {
        //NSLog(@"search success");
        
        NSLog(@"Results %@", results);
    }
    
    //Remove
    [self.model.context deleteObject:paco];
    
    //Save
    [self save];
    
    
}

- (void) save {
    [self.model saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar %s \n\n%@", __func__, error);
    }];
}

- (void) autoSave{
    
    if (AUTO_SAVE){
        
        NSLog(@"Executing autoSave");
        
        [self save];
        
        [self performSelector:@selector(autoSave)
                   withObject:nil
                   afterDelay:AUTO_SAVE_DELAY_IN_SECONDS];
    }

}


@end





