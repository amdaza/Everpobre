#import "_AGTNotebook.h"

@interface AGTNotebook : _AGTNotebook {}
// Custom logic goes here.

+(instancetype) notebookWithName:(NSString *) name
                         context:(NSManagedObjectContext *) context;

@end
