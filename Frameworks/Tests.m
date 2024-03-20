#import <GCDWebServer/GCDWebServer.h>
#import <XCTest/XCTest.h>

#pragma clang diagnostic ignored "-Weverything"  // Prevent "messaging to unqualified id" warnings

@interface Tests : XCTestCase
@end

@implementation Tests

- (void)testWebServer {
  ReadiumGCDWebServer* server = [[ReadiumGCDWebServer alloc] init];
  XCTAssertNotNil(server);
}

- (void)testDAVServer {
  ReadiumGCDWebDAVServer* server = [[ReadiumGCDWebDAVServer alloc] init];
  XCTAssertNotNil(server);
}

- (void)testWebUploader {
  ReadiumGCDWebUploader* server = [[ReadiumGCDWebUploader alloc] init];
  XCTAssertNotNil(server);
}

- (void)testPaths {
  XCTAssertEqualObjects(ReadiumGCDWebServerNormalizePath(@""), @"");
  XCTAssertEqualObjects(ReadiumGCDWebServerNormalizePath(@"/foo/"), @"/foo");
  XCTAssertEqualObjects(ReadiumGCDWebServerNormalizePath(@"foo/bar"), @"foo/bar");
  XCTAssertEqualObjects(ReadiumGCDWebServerNormalizePath(@"foo//bar"), @"foo/bar");
  XCTAssertEqualObjects(ReadiumGCDWebServerNormalizePath(@"foo/bar//"), @"foo/bar");
  XCTAssertEqualObjects(ReadiumGCDWebServerNormalizePath(@"foo/./bar"), @"foo/bar");
  XCTAssertEqualObjects(ReadiumGCDWebServerNormalizePath(@"foo/bar/."), @"foo/bar");
  XCTAssertEqualObjects(ReadiumGCDWebServerNormalizePath(@"foo/../bar"), @"bar");
  XCTAssertEqualObjects(ReadiumGCDWebServerNormalizePath(@"/foo/../bar"), @"/bar");
  XCTAssertEqualObjects(ReadiumGCDWebServerNormalizePath(@"/foo/.."), @"/");
  XCTAssertEqualObjects(ReadiumGCDWebServerNormalizePath(@"/.."), @"/");
  XCTAssertEqualObjects(ReadiumGCDWebServerNormalizePath(@"."), @"");
  XCTAssertEqualObjects(ReadiumGCDWebServerNormalizePath(@".."), @"");
  XCTAssertEqualObjects(ReadiumGCDWebServerNormalizePath(@"../.."), @"");
}

@end
