#import "AGTNamedEntity.h"

@interface AGTNamedEntity ()

+ (NSArray *) observableKeyNames;

@end

@implementation AGTNamedEntity

#pragma mark - Class methods

+ (NSArray *) observableKeyNames{
    return @[@"name", @"creationDate"];
}

#pragma mark - KVO

-(void) setupKVO{
    NSArray *keys = [[self class] observableKeyNames];
    
    for (NSString *key in keys) {
        [self addObserver: self
               forKeyPath: key
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
    }
}

- (void) tearDownKVO{
    NSArray *keys = [[self class] observableKeyNames];
    
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
