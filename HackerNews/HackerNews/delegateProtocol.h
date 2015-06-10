//
//  delegateProtocol.h
//  HackerNews
//
//  Created by Michael McKinney on 6/9/15.
//  Copyright (c) 2015 Michael McKinney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Story.h"

//@class Story;
@protocol delegateProtocol <NSObject>
@required
-(void)selectedStory:(Story *)story;
@end
@interface delegateProtocol : NSObject

@end