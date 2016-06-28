#import "AGTNotebook.h"

@interface AGTNotebook ()

+ (NSArray *) observableKeyNames;

@end

@implementation AGTNotebook

+ (NSArray *) observableKeyNames {
    return @[@"creationDate", @"name", @"notes"];
}

+(instancetype) notebookWithName:(NSString *) name
                         context:(NSManagedObjectContext *) context{
    AGTNotebook *nb = [NSEntityDescription insertNewObjectForEntityForName:[AGTNotebook entityName] inManagedObjectContext:context];
    
    nb.name = name;
    nb.creationDate = [NSDate date];
    nb.modificationDate = [NSDate date];
    
    return nb;
}

#pragma mark - KVO

-(void) setupKVO{
    NSArray *keys = [AGTNotebook observableKeyNames];
    
    for (NSString *key in keys) {
        [self addObserver: self
               forKeyPath: key
                  options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context: NULL];
    }
}

- (void) tearDownKVO{
    NSArray *keys = [AGTNotebook observableKeyNames];
    
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

@end


