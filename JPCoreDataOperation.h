//
//  JPCoreDataOperation.h
//  JPOperationBuilder
//
//  Created by Joshua Phelps on 10/4/11.
//  Copyright 2011 Joshua T. Phelps. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "JPOperation.h"

@interface JPCoreDataOperation : JPOperation
{
	NSObject * _appDelegate;
	NSManagedObjectContext * _mainContext;
}

@property (nonatomic, readonly) NSManagedObjectContext * mainContext;

-(id)initWithAppDelegate:(NSObject*)appD;

@end
