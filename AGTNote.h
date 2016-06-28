#import "_AGTNote.h"

@interface AGTNote : _AGTNote {}
// Custom logic goes here.

+(instancetype) noteWithName: (NSString *)name
                    notebook: (AGTNotebook *) notebook
                     context: (NSManagedObjectContext *) context;


@end
