//
//  EpubManager.h
//  Infinity World
//
//  Created by nuibb on 11/30/15.
//  Copyright © 2015 nuibb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EpubManager : NSObject

- (instancetype)initWithIdentifier:(NSString *)identifier;

- (NSMutableArray *) getEpubContents;
- (NSString *) getEpubDirectory;
- (NSString *) getEpubFile;

@end
