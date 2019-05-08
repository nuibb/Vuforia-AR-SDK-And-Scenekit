//
//  EpubManager.m
//  Infinity World
//
//  Created by nuibb on 11/30/15.
//  Copyright © 2015 nuibb. All rights reserved.
//

#import "EpubManager.h"
#import "EpubHelper.h"

@interface EpubManager ()

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *car;
@property (nonatomic, strong) EpubHelper *epubHelper;

@end

@implementation EpubManager

- (instancetype)initWithIdentifier:(NSString *)identifier
{
    self = [super init];
    if (self) {
        self.epubHelper = [EpubHelper new];
        self.identifier = identifier;
    }
    
    return self;
}

- (NSMutableArray *) getEpubContents {
    [self.epubHelper unzipAndSaveEpubFile:[self getEpubDirectory] name:[self getEpubFile]];
    
    return self.epubHelper.ePubContent;
}

- (NSString *) getEpubDirectory {
    return [NSString stringWithFormat:@"%@/%@_%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"selected_car"], [[NSUserDefaults standardUserDefaults] objectForKey:@"selected_car"], [[NSUserDefaults standardUserDefaults] objectForKey:@"current_language"]];
}

- (NSString *) getEpubFile {
    
    if ([self.identifier isEqualToString:@"BUTTON"]) {
        
        return [NSString stringWithFormat:@"button_%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"current_language"]];
        
    } else if ([self.identifier isEqualToString:@"QRG"]) {
        
        return [NSString stringWithFormat:@"homepage_%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"current_language"]];
        
    } else if ([self.identifier isEqualToString:@"TYRE"]) {
        
        return [NSString stringWithFormat:@"tyre_%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"current_language"]];
        
    } else if ([self.identifier isEqualToString:@"WARRANTY"]) {
        
        return [NSString stringWithFormat:@"warranty_%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"current_language"]];
        
    } else if ([self.identifier isEqualToString:@"INFO"]) {
        
        return [NSString stringWithFormat:@"info_%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"current_language"]];
        
    } else if ([self.identifier isEqualToString:@"ENGINE"]) {
        
        return [NSString stringWithFormat:@"engine_%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"current_language"]];
        
    } else if ([self.identifier isEqualToString:@"WARNING LIGHTS"]) {
        
        return [NSString stringWithFormat:@"combimeter_%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"current_language"]];
        
    }
    
    return nil;
}

@end
