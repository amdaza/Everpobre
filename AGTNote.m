#import "AGTNote.h"

@interface AGTNote ()

+ (NSArray *) observableKeyNames;

@end

@implementation AGTNote

+ (NSArray *) observableKeyNames {
    return @[@"creationDate", @"name", @"notebook", @"photo"];
}


// Custom logic goes here.
+(instancetype) noteWithName: (NSString *) name
                    notebook: (AGTNotebook *) notebook
                     context: (NSManagedObjectContext *) context{
    AGTNote *n = [NSEntityDescription insertNewObjectForEntityForName:[AGTNote entityName] inManagedObjectContext:context];
    
    n.name = name;
    n.creationDate = [NSDate date];
    n.modificationDate = [NSDate date];
    n.notebook = notebook;
    
    return n;
}

/* Already implemented in super class

#pragma mark - KVO

-(void) setupKVO{
    NSArray *keys = [AGTNote observableKeyNames];
    
    for (NSString *key in keys) {
        [self addObserver: self
               forKeyPath: key
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
    }
}

- (void) tearDownKVO{
    NSArray *keys = [AGTNote observableKeyNames];
    
    for (NSString *key in keys) {
        [self removeObserver: self
                  forKeyPath: key];
    }
}

- (void) observeValueForKeyPath:(NSString *)keyPath
                       ofObject:(id)object
                         change:(NSDictionary<NSString *,id> *)change
                        context:(void *)context{
    self.modificationDate = [NSDate date];
}


#pragma mark - LifeCycle

-(void) awakeFromInsert {
    //Once in object life cycle (first time created)
    [super awakeFromInsert];
    [self setupKVO];
}


- (void) awakeFromFetch{
    //Several times in object life cycle, when is called from a search
    [super awakeFromFetch];
    [self setupKVO];
}

- (void) willTurnIntoFault{
    [super willTurnIntoFault];
    [self tearDownKVO];
}
*/

@end
