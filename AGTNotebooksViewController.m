//
//  AGTNotebooksViewController.m
//  Everpobre
//
//  Created by Fernando Rodríguez Romero on 02/04/14.
//  Copyright (c) 2014 Agbo. All rights reserved.
//

#import "AGTNotebooksViewController.h"
#import "AGTNotebook.h"
#import "AGTNotebookViewCell.h"

@interface AGTNotebooksViewController ()

@end

@implementation AGTNotebooksViewController

#pragma mark - View Lifecycle

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.title = @"Everpobre";
    
    // Create button with target and actiondd
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem: UIBarButtonSystemItemAdd
                                  target: self
                                  action: @selector(addNotebook:)];
    
    // Add buttons to navigation bar
    // Add button
    self.navigationItem.rightBarButtonItem = addButton;
    // Edit button
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    // Subscribe to proximity sensor notifies
    UIDevice *dev = [UIDevice currentDevice];
    
    if ([self hasProximitySensor]) {
        [dev setProximityMonitoringEnabled: YES];
        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        
        [center addObserver: self
                   selector: @selector(proximityStateDidChange:)
                       name: UIDeviceProximityStateDidChangeNotification
                     object: nil];
    }
    
    // Register nib
    UINib *cellNib = [UINib nibWithNibName: @"AGTNotebookCellView"
                                    bundle:nil];
    [self.tableView registerNib: cellNib
         forCellReuseIdentifier: [AGTNotebookViewCell cellId]];
}

-(void) viewWillDisappear:(BOOL)animated{
    // Unsuscribe from proximity sensor notifies
    [super viewWillDisappear:animated];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}


#pragma mark - Actions

-(void)addNotebook:(id) sender{
    
    // New AGTNotebook instance
    //AGTNotebook *nb =
    [AGTNotebook notebookWithName: @"New Notebook"
                          context: self.fetchedResultsController.managedObjectContext];
}

#pragma mark - Data Source

-(void) tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle //Add or delete
    forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Check what notebook
        AGTNotebook *del = [self.fetchedResultsController objectAtIndexPath:indexPath];
        // Remove from model
        [self.fetchedResultsController.managedObjectContext deleteObject:del];
    }
}

- (UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Check notebook
    AGTNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Create cell
    //static NSString *cellId = @"cellId";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    AGTNotebookViewCell *cell = [tableView dequeueReusableCellWithIdentifier: [AGTNotebookViewCell cellId]];
    /*
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle
                                      reuseIdentifier: cellId];
    }
    */
    
    // Syncronize notebook with cell
    /*
    cell.textLabel.text = nb.name;
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateStyle = NSDateFormatterMediumStyle;
    cell.detailTextLabel.text = [fmt stringFromDate:nb.modificationDate];
     */
    cell.nameView.text = nb.name;
    cell.numberOfNotesView.text = [NSString stringWithFormat: @"%lu", (unsigned long)nb.notes.count];
    
    // Return cell
    return cell;
}

#pragma mark - TableView Delegate
- (CGFloat) tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [AGTNotebookViewCell cellHeight];
}


#pragma mark - Proximity Sensor

-(BOOL)hasProximitySensor{
    
    UIDevice *dev =[UIDevice currentDevice];
    BOOL oldValue = [dev isProximityMonitoringEnabled];
    [dev setProximityMonitoringEnabled:!oldValue];
    BOOL newValue = [dev isProximityMonitoringEnabled];
    
    [dev setProximityMonitoringEnabled:oldValue];
    
    return (oldValue != newValue);
}

// Notification -> UIDeviceProximityStateDidChangeNotification
-(void) proximityStateDidChange:(NSNotification *) notification{
    
    [self.fetchedResultsController.managedObjectContext.undoManager undo];
    
}


@end













