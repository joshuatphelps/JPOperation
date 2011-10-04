//
//  JPOperation.h
//  JPOperationBuilder
//
//  Created by Joshua Phelps on 10/4/11.
//  Copyright 2011 Joshua T. Phelps. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JPOperation;

@interface JPOperation : NSOperation

@property (nonatomic, retain) id <NSObject, JPOperation> delegate;

@end

@protocol JPOperation <NSObject>

@optional
-(void)jpOperationHasStarted:(JPOperation*)op;
-(void)jpOperation:(JPOperation*)op postedProgress:(NSNumber*)progress;
-(void)jpOperationHasCompleted:(JPOperation*)op;

@end

