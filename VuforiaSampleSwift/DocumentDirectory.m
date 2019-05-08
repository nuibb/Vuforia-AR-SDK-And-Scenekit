//
//  DocumentDirectory.m
//  Infinity World
//
//  Created by nuibb on 12/6/15.
//  Copyright © 2015 nuibb. All rights reserved.
//

#import "DocumentDirectory.h"

@interface DocumentDirectory ()

@property (nonatomic, strong) NSFileManager *fileManager;
@property (nonatomic, strong) NSString *documentDirectory;

@end

@implementation DocumentDirectory

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        self.fileManager = [NSFileManager defaultManager];
        self.documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];

    }
    
    return self;
}

- (void)dealloc {
    self.fileManager = nil;
    self.documentDirectory = nil;
}

- (NSString *)getDocumentDirectory {
    
    return self.documentDirectory;
    
}

- (BOOL)checkEpubFileIfExistsAtPath:(NSString *)path {
    
    if ([self.fileManager fileExistsAtPath:[self.documentDirectory stringByAppendingPathComponent:path]]) {
        
        return YES;
        
    } else {
        
        return NO;
        
    }
}

- (BOOL)checkFileIfExistsAtPath:(NSString *)contentName {
    
    if ([self.fileManager fileExistsAtPath:[self.documentDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@", [contentName componentsSeparatedByString:@"_"][0], contentName]]]) {
 
        return YES;
        
    } else {
        
        return NO;
    }
}

- (void)deleteFileIfExistsAtPath:(NSString *)contentPath {
    
    NSString *path = [self.documentDirectory stringByAppendingPathComponent:contentPath];
    
    if ([self.fileManager fileExistsAtPath:path] && [self.fileManager isDeletableFileAtPath:path]) {
        NSError *error;
        BOOL success = [self.fileManager removeItemAtPath:path error:&error];
        if (!success) {
            //NSLog(@"Error removing file for : %@", error.localizedDescription);
        }
    }
}

- (void)makeFolderForTheSpecificCar:(NSString *)contentName {
    
    NSError *error;
    NSString *folderPath = [self.documentDirectory stringByAppendingPathComponent:contentName];
    
    if (![self.fileManager fileExistsAtPath:folderPath]) {
        [self.fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:NO attributes:nil error:&error];
    }
    
    if (error) {

    }
}

- (NSString *)getDownloadContentPath:(NSString *)contentName {
    
    NSString *folderName = [contentName componentsSeparatedByString:@"_"][0];
    
    [self makeFolderForTheSpecificCar:folderName];
    
    if ([self.fileManager fileExistsAtPath:[self.documentDirectory stringByAppendingPathComponent:folderName]]) {
        
        NSString *zipPath = [NSString stringWithFormat:@"%@/%@.zip", folderName, contentName];
        
        return [self.documentDirectory stringByAppendingPathComponent:zipPath];
        
    }
    
    return @"";
}

-(NSArray *)listOfFilesAtPath:(NSString *)path {
    
    NSArray *directoryContent = [self.fileManager contentsOfDirectoryAtPath:[NSString stringWithFormat:@"%@/%@", self.documentDirectory, path] error:NULL];
    
    return directoryContent;
    
    }

@end
