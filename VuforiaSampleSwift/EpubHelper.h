

#import <Foundation/Foundation.h>
#import "XMLHandler.h"
#import <UIKit/UIKit.h>



@interface EpubHelper : NSObject  <XMLHandlerDelegate>

- (void)unzipAndSaveEpubFile:(NSString *)epubFolder name:(NSString *)epubName;
@property (nonatomic, strong, readonly) NSMutableArray *ePubContent;

@end

