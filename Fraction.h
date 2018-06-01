#import <Foundation/Foundation.h>

@interface Fraction: NSObject {

	int numerator;
	int denominator;
}

@property int numerator, denominator;

-(void) print: (BOOL) ifReduce;
-(void) reduce;
-(double) toNumber;
-(void) setTo: (int) n over: (int) d;
-(id) initWith: (int) n over: (int) d;

// class method
+(Fraction *) allocF;
+(int) count;
+(void) setCounter: (int) c;
//+(int) countAddMethodCalls;	//it is in FractionMathOps.h

@end
