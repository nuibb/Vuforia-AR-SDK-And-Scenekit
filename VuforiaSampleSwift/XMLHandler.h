

#import <Foundation/Foundation.h>


@protocol XMLHandlerDelegate <NSObject>

@optional

- (void)finishedParsing:(NSMutableArray *)ePubContents;

@end


@interface XMLHandler : NSObject <NSXMLParserDelegate>

@property (nonatomic, weak) IBOutlet id <XMLHandlerDelegate> delegate;
- (void)parseXMLFileAt:(NSString *)strPath;

@end
