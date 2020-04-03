//
//  BookShelf.m
//  设计模式
//
//  Created by sunxiaobin on 2020/3/31.
//  Copyright © 2020 sunxb. All rights reserved.
//

#import "BookShelf.h"
#import "BookShelfIterator.h"
#import "Book.h"
#import "BookShelfOperator.h"

@interface BookShelf ()
@property (nonatomic, strong) NSMutableArray * books;
@end

@implementation BookShelf

#pragma mark - public
- (void)addBook:(Book *)book {
    if (!book || ![book isKindOfClass:[Book class]]) return;
    if (self.maxCount != 0 && self.maxCount == self.books.count) {
        NSLog(@"达到最大的储存限制!!");
        return;
    }
    [self.books addObject:book];
}

- (void)removeBookAtIndex:(NSInteger)index {
    if (index < 0 || index >= self.books.count) return;
    [self.books removeObjectAtIndex:index];
}

- (NSInteger)getLength {
    return self.books.count;
}
- (Book *)bookAtIndex:(NSInteger)index {
    if (index < 0 || index >= self.books.count) return nil;
    return self.books[index];
}

#pragma mark - protocol
- (id<Iterator>)iterator {
    return [[BookShelfIterator alloc] initWithBookShelf:self];
}

- (id<Operator>)operate {
    return [[BookShelfOperator alloc] initWithBookShelf:self];
}

#pragma mark - lazy load
- (NSMutableArray *)books {
    if (!_books) {
        _books = [NSMutableArray new];
    }
    return _books;
}

- (void)dealloc {
    NSLog(@"BookShelf dealloc");
}


@end
