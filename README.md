# GEBEncoding
GEBEncoding是一个 beencodeing 的OC 函数库。

### 使用方法

```

-(void)testCase{
    NSDictionary * dict = @{@"inputs.sourceType":@(1998),@"inputs.data":@(2000)};
    NSData * encodeData = [GEBEncoding encodedDataFromObject:dict];
    NSLog(@"encodeData = %@",encodeData);
    
    id decodeData = [GEBEncoding objectFromEncodedData:encodeData];
    
    NSLog(@"decodeData = %@",decodeData);
    NSLog(@"decodeData class = %@",[decodeData class]);
    NSLog(@"inputs.sourceType = %@",[decodeData objectAtIndex:1]);
}

```

运行结果
```
2018-06-11 17:50:45.990442+0800 GEBEncodingTest[5353:3486429] encodeData = <6431313a 696e7075 74732e64 61746169 32303030 6531373a 696e7075 74732e73 6f757263 65547970 65693139 39386565>
2018-06-11 17:50:45.990779+0800 GEBEncodingTest[5353:3486429] decodeData = {
    inputs.data = 2000;
    inputs.sourceType = 1998;
}
2018-06-11 17:50:45.990878+0800 GEBEncodingTest[5353:3486429] decodeData class = OrderedDictionary
2018-06-11 17:50:45.990952+0800 GEBEncodingTest[5353:3486429] inputs.sourceType = 1998

```

### 头文件函数列表

```
#import <Foundation/Foundation.h>
#import "OrderedDictionary.h"

typedef enum {
	GEBEncodedStringType = -1,
	GEBEncodedDataType = 0
} GEBEncodedType;

typedef GEBEncodedType (^GEBEncodedTypeAdvisor)(NSArray *keyStack);

//  BEncoding
//
//  This class is not intended to be instantiated. Its a 'utility' class, and
//  as such you simply call the class methods as required when you need them.
//
//  The BEncoding class can encode and decode data to and from bencoded byte
//  data as defined here: http://wiki.theory.org/BitTorrentSpecification

@interface GEBEncoding : NSObject { }

//  +(NSData *)encodeDataFromObject:(id)object
//
//  This method to returns an NSData object that contains the bencoded
//  representation of the object that you send. You can send complex structures
//  such as an NSDictionary that contains NSArrays, NSNumbers and NSStrings, and
//  the encoder will correctly serialise the data in the expected way.
//
//  Supports NSData, NSString, NSNumber, NSArray and NSDictionary objects.
//
//  NSStrings are encoded as NSData objects as there is no way to differentiate
//  between the two when decoding.
//
//  NSNumbers are encoded and decoded with their longLongValue.
//
//  NSDictionary keys must be NSStrings.

+(NSData *)encodedDataFromObject:(id)object;

//  +(id)objectFromEncodedData:(NSData *)sourceData;
//
//  This method returns an NSObject of the type that is serialised in the bencoded
//  sourceData.
//
//  Bad data should not cause any problems, however if it is unable to deserialise
//  anything from the source, it may return a nil, which you need to check for.

+(id)objectFromEncodedData:(NSData *)sourceData;

+(id)objectFromEncodedData:(NSData *)sourceData withTypeAdvisor:(GEBEncodedTypeAdvisor)typeAdvisor;

@end
```
