// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AGTNotebook.h instead.

#import <CoreData/CoreData.h>
#import "AGTNamedEntity.h"

extern const struct AGTNotebookRelationships {
	__unsafe_unretained NSString *notes;
} AGTNotebookRelationships;

@class AGTNote;

@interface AGTNotebookID : AGTNamedEntityID {}
@end

@interface _AGTNotebook : AGTNamedEntity {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AGTNotebookID* objectID;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _AGTNotebook (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(AGTNote*)value_;
- (void)removeNotesObject:(AGTNote*)value_;

@end

@interface _AGTNotebook (CoreDataGeneratedPrimitiveAccessors)

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
