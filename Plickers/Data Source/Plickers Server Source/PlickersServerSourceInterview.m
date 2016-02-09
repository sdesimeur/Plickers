//
//  PlickersServerSourceInterview.m
//  Plickers
//
//  Created by Michael Selevan on 2/8/16.
//  Copyright © 2016 Michael Selevan. All rights reserved.
//

#import "PlickersServerSourceInterview.h"
#import "PlickersServerApiCommand.h"

@interface PlickersServerSourceInterview ()

@property (nonatomic, readwrite, strong) PlickersServerApiCommand *currentCommand;
@property (nonatomic, readwrite, strong) NSURLSession *serverSession;
@property (nonatomic, readwrite, strong) NSURLSessionDataTask *dataTask;
@property (nonatomic, readwrite, strong) NSMutableData *data;
@property (nonatomic, readwrite, strong) NSMutableArray *commandQueue;

@end

@implementation PlickersServerSourceInterview

- (instancetype)init {
    if (self = [super init]) {
        self.commandQueue = [NSMutableArray new];
    }
    
    return self;
}


- (void)performPlickersApiCommand:(PlickersServerApiCommand *)command {
    if (!self.currentCommand) {
        _currentCommand = command;
        if (!self.serverSession) {
            self.serverSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration] delegate:self delegateQueue:nil];
        }
        
        NSMutableString *apiRequestString = [[NSMutableString alloc] init];
        
        [apiRequestString appendString:[self apiMethodStringForCommandType:[command commandType]]];
        if (command.commandParameters.count > 0) {
            //add any parameters if needed
        }
        
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:apiRequestString relativeToURL:[NSURL URLWithString:@"http://plickers-interview.herokuapp.com"]]];
        self.data = [NSMutableData new];
        self.dataTask = [self.serverSession dataTaskWithRequest:request];
        
        [self.dataTask resume];
    } else {
        [self.commandQueue addObject:command];
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
    if ([self.data length] > 0 && !error) {
        [self.currentCommand receivedData:self.data];
        _currentCommand = nil;
        _dataTask = nil;
        
        if (self.commandQueue.count > 0) {
            PlickersServerApiCommand *nextCommand = [self.commandQueue firstObject];
            [self.commandQueue removeObjectAtIndex:0];
            
            [self performPlickersApiCommand:nextCommand];
        }
    } else {
        //some error handling
    }
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler {
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    [self.data appendData:data];
}

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * __nullable credential))completionHandler {
    completionHandler(NSURLSessionAuthChallengeUseCredential, nil);
}

#pragma mark Private Methods

- (NSString *)apiMethodStringForCommandType:(PlickersServerApiCommandType)commandType {
    switch (commandType) {
        case kPlickersServerApiCommandTypePoll:
            return @"polls";
        default:
            return @"";
    }
}

@end
