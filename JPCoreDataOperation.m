//
//  JPCoreDataOperation.m
//  JPOperationBuilder
//
//  Created by Joshua Phelps on 10/4/11.
//  Copyright 2011 Joshua T. Phelps. All rights reserved.
//

#import "JPCoreDataOperation.h"

@interface JPCoreDataOperation(private)

-(NSManagedObjectContext*)newContextToMainStore;

@end

@implementation JPCoreDataOperation

@synthesize mainContext = _mainContext;

-(id)initWithAppDelegate:(NSObject*)appD
{
	self = [super init];
	if(self)
	{
		_appDelegate = [appD retain];
		_mainContext = [[self newContextToMainStore] retain];
	}
	return self;
}

-(void)dealloc
{
	[_appDelegate release];
	[_mainContext release];
	[super dealloc];
}

-(NSManagedObjectContext*)newContextToMainStore
{
	NSPersistentStoreCoordinator *coord = nil;
	
	NSAssert([_appDelegate respondsToSelector:@selector(persistentStoreCoordinator)], @"Invalid app delegate", nil);
	
	coord = [(id)_appDelegate persistentStoreCoordinator];
	
	NSManagedObjectContext *moc = [[NSManagedObjectContext alloc]init];
	[moc setPersistentStoreCoordinator:coord];
	return [moc autorelease];
}

-(void)main
{
	
}

@end
