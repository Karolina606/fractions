#import <Foundation/Foundation.h>

@interface Fraction: NSObject {

	int numerator;
	int denominator;
}

@property int numerator, denominator;

// instance methods -------------------------------------
-(void) print: (BOOL) ifReduce;
-(void) reduce;
-(double) toNumber;
-(void) setTo: (int) n over: (int) d;
-(id) initWith: (int) n over: (int) d;

// class method ------------------------------------------
+(Fraction *) allocF;
+(int) count;
+(void) setCounter: (int) c;
+(Fraction *) sumOfFractionArray: (NSArray *) array;

@end
