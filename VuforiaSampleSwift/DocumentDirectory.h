//
//  DocumentDirectory.h
//  Infinity World
//
//  Created by nuibb on 12/6/15.
//  Copyright © 2015 nuibb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DocumentDirectory : NSObject

-(NSString *)getDocumentDirectory;
-(NSArray *)listOfFilesAtPath:(NSString *)path;
-(NSString *) getDownloadContentPath:(NSString *)contentName;
-(BOOL)checkEpubFileIfExistsAtPath:(NSString *)path;
-(BOOL)checkFileIfExistsAtPath:(NSString *)contentName;
-(void)deleteFileIfExistsAtPath:(NSString *)contentPath;

@end
