//
//  TocOfEpub.h
//  Nissan Manual
//
//  Created by Mohammad Masud on 3/11/13.
//  Copyright (c) 2013 metaio GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TocOfEpub : NSObject

@property (nonatomic, strong, readwrite) NSString *title;
@property (nonatomic, strong, readwrite) NSString *html_link;
@property (nonatomic, strong, readwrite) NSString *search;
@property NSInteger index;

@end
