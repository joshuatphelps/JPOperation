//
//  JPCoreDataImportOperation.h
//  JPOperationBuilder
//
//  Created by Joshua Phelps on 10/4/11.
//  Copyright 2011 Joshua T. Phelps. All rights reserved.
//

#import "JPCoreDataOperation.h"
#import "JPTreeNode.h"

@interface JPCoreDataImportOperation : JPCoreDataOperation
{
	JPTreeNode *_rootNode;
	
	NSLock *_lock;
}

@property (nonatomic, retain) JPTreeNode *rootNode;

-(id)initWithAppDelegate:(NSObject*)appD rootNode:(JPTreeNode*)root;

/*
 *	if multiple operations are accessing the same persistent store, lock before saving data
 */
-(id)initWithAppDelegate:(NSObject*)appD rootNode:(JPTreeNode*)root lock:(NSLock*)lock;

-(void)parseRootNode;

@end
