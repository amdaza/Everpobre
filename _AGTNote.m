// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AGTNote.m instead.

#import "_AGTNote.h"

const struct AGTNoteAttributes AGTNoteAttributes = {
	.text = @"text",
};

const struct AGTNoteRelationships AGTNoteRelationships = {
	.notebook = @"notebook",
	.photo = @"photo",
};

@implementation AGTNoteID
@end

@implementation _AGTNote

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Note";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Note" inManagedObjectContext:moc_];
}

- (AGTNoteID*)objectID {
	return (AGTNoteID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic text;

@dynamic notebook;

@dynamic photo;

@end

