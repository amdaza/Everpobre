// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AGTNote.h instead.

#import <CoreData/CoreData.h>
#import "AGTNamedEntity.h"

extern const struct AGTNoteAttributes {
	__unsafe_unretained NSString *text;
} AGTNoteAttributes;

extern const struct AGTNoteRelationships {
	__unsafe_unretained NSString *notebook;
	__unsafe_unretained NSString *photo;
} AGTNoteRelationships;

@class AGTNotebook;
@class AGTPhoto;

@interface AGTNoteID : AGTNamedEntityID {}
@end

@interface _AGTNote : AGTNamedEntity {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AGTNoteID* objectID;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) AGTNotebook *notebook;

//- (BOOL)validateNotebook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) AGTPhoto *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@end

@interface _AGTNote (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (AGTNotebook*)primitiveNotebook;
- (void)setPrimitiveNotebook:(AGTNotebook*)value;

- (AGTPhoto*)primitivePhoto;
- (void)setPrimitivePhoto:(AGTPhoto*)value;

@end
