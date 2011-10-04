//
//  JPCoreDataImportOperation.m
//  JPOperationBuilder
//
//  Created by Joshua Phelps on 10/4/11.
//  Copyright 2011 Joshua T. Phelps. All rights reserved.
//

#import "JPCoreDataImportOperation.h"

@implementation JPCoreDataImportOperation

@synthesize rootNode = _rootNode;

-(id)initWithAppDelegate:(NSObject*)appD rootNode:(JPTreeNode*)root
{
	self = [super initWithAppDelegate:appD];
	if(self)
	{
		_rootNode = [root retain];
	}
	return self;
}

-(id)initWithAppDelegate:(NSObject*)appD rootNode:(JPTreeNode*)root lock:(NSLock*)lock
{
	self = [self initWithAppDelegate:appD rootNode:root];
	if(self)
	{
		_lock = [lock retain];
	}
	return self;
}

-(void)dealloc
{
	if(_lock) [_lock release];
	
	[_rootNode release];
	[super dealloc];
}

-(void)parseRootNode
{
	//should be subclassed
}

-(void)main
{
	[self parseRootNode];
	
	NSError *error = nil;
	NSManagedObjectContext *context = self.mainContext;
	
	if(_lock) [_lock lock];
	if(![context save:&error])
	{
		[_lock unlock];
		NSLog(@"Error saving");
		return;
	}
	
	[_lock unlock];
	
	if(self.delegate && [self.delegate respondsToSelector:@selector(jpOperationHasCompleted:)])
	{
		[self.delegate jpOperationHasCompleted:self];
	}
	
}

@end
