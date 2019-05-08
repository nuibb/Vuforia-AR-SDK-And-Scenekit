
#import "EpubHelper.h"
#import "DocumentDirectory.h"

@interface EpubHelper ()

@property (nonatomic, strong) XMLHandler *xmlHandler;
@property (nonatomic, strong) DocumentDirectory *documentDirectory;

@end

@implementation EpubHelper

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.xmlHandler=[[XMLHandler alloc] init];
        self.xmlHandler.delegate = self;
    }
    
    return self;
}


//Unzipping the epub file to documents directory
- (void)unzipAndSaveEpubFile:(NSString *)epubFolder name:(NSString *)epubName {
    
    [self.xmlHandler parseXMLFileAt:[[NSBundle mainBundle] pathForResource:@"toc" ofType:@"ncx" inDirectory:@"/button_en/OEBPS"]];
    
}

- (void)finishedParsing:(NSMutableArray *)ePubContents {
    
    _ePubContent = ePubContents;
    
}

@end
