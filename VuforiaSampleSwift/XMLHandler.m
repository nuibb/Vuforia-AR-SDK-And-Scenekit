

#import "XMLHandler.h"
#import "TocOfEpub.h"

@interface XMLHandler ()

@property (nonatomic, strong) NSXMLParser *parser;
@property (nonatomic, strong) NSMutableArray *tocArray;
@property (nonatomic, strong) NSMutableString *title;
@property (nonatomic, strong) NSMutableString *search;
@property (nonatomic, strong) TocOfEpub *toc;
@property BOOL startElement;
@property BOOL searchElement;
@property NSInteger i;

@end


@implementation XMLHandler

- (void)parseXMLFileAt:(NSString*)path {
    
    _tocArray = [[NSMutableArray alloc] init];
    _parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]];
    _parser.delegate = self;
    [_parser parse];
    _i = 0;
    
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    
    //	NSLog(@"Error Occured : %@",[parseError description]);
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {

    if ([elementName isEqualToString:@"navPoint"]) {
        _toc = [[TocOfEpub alloc] init];
    } else if ([elementName isEqualToString:@"content"]) {
        _toc.html_link = [attributeDict valueForKey:@"src"];
    } else if ([elementName isEqualToString:@"text"]) {
        _title = [[NSMutableString alloc] init];
        _startElement = true;
    } else if ([elementName isEqualToString:@"search"]) {
        _search = [[NSMutableString alloc] init];
        _searchElement = true;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if(_startElement) {
        [_title appendString:string];
    } else if (_searchElement) {
        [_search appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"navPoint"]) {
        _toc.index = _i++;
        [_tocArray addObject:_toc];
    } else if ([elementName isEqualToString:@"text"]) {
        _startElement = false;
        _toc.title = _title;
    } else if([elementName isEqualToString:@"search"]) {
        _searchElement = false;
        _toc.search = _search;
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    [self.delegate finishedParsing:_tocArray];
}

@end
