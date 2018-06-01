#import "Fraction.h"

static int gCounter = 0;	// how many instances do we made
				// you can set its value in the [+initialize] methond, which works on the beginnig of the program

//int gCounterAddMethod = 0;	// when we do it static we can't see it from FractionMathOps.m
				// now it is not reseting in each call of add: (it is still static but able to extern)
				// it is now in the FractionMathOps.m

@implementation Fraction
// I have to implement all methods from Fraction.h

@synthesize numerator, denominator;

-(void) print: (BOOL) ifReduce{
	// if reduce
	if(ifReduce){
		[self reduce];
	}

	// mixed number
	if(numerator > denominator){
		int n = numerator, d = denominator;
		int integer = n / d;
		n -= (integer * d);

		//if integer != 0 and fraction = 0 display only integer
		if(n == 0){
			printf("%d\n", integer);
		}
		else{
			printf("%d %d/%d\n", integer, n, d);
		}	
	}

	//if fraction = 0 display only 0
	else if(numerator == 0){
		printf("0\n");
	}
	else{
		printf("%d/%d\n", numerator, denominator);	
	}
}

-(void) reduce{
	int divider = (numerator < denominator)? numerator : denominator;

	// to reduce by -1 if possible
	if(numerator < 0 && denominator < 0){
		numerator *= -1;
		denominator *= -1;
	}

	if(divider < 0){
		divider *= -1; // to change sign of divider
	}

	while(divider > 1){
		if( numerator % divider == 0 && denominator % divider == 0 ){
			numerator /= divider;
			denominator /= divider;
			return;
		}
		else{
			divider--;
		}
	}
}

-(double) toNumber{
	if(denominator == 0){
		return NAN;	
	}
	else{
		return (double)numerator/denominator;	
	}
}

-(void) setTo: (int) n over: (int) d{
	numerator = n;
	denominator = d;
}

//INIT
-(id) initWith: (int) n over: (int) d{
	self = [super init];
	
	if (self) {
		[self setTo: n over: d];
	}
	return self;
}

-(id) init{
	//we overwrite init becouse we want to have some default values in out object
	return [self initWith: 0 over: 0];
}

//CLASS METHODS
+(Fraction *) allocF{
	//we do not overwritte alloc method
	
	//extern int gCounter;	//we do not must to make it because variable is in the top of this file	
	gCounter++;	
	
	return [self alloc];
}

+(int) count{
	//extern int gCounter;	//we do not must to make it because variable is in the top of this file
	return gCounter;
}

+(void) setCounter: (int) c{
	gCounter = c;
}

/*+(void) initialize{
	// this metod is send only once to each class, on the program begining
	// it can for example set value of static class variable as follows	
	
	gCounter = 1;
}*/

/*+(int) countAddMethodCalls{				//it is in FractionMathOps.m
	// it returns amound of add: method calls
	return gCounterAddMethod;
}*/


// NSComparisionMethods IMPLEMENTATION
/* It works quit propery form this place, but I move it to FractionNSCompariosonMethods.m
-(BOOL) isEqualTo: (id) object{
	if( [self toNumber] == [object toNumber]){
		return true;
	}
	else{
		return false;
	}
}

-(BOOL) isLessThanOrEqualTo: (id) object{
	if( [self toNumber] <= [object toNumber] ){
		return true;
	}
	else{
		return false;
	}
}

-(BOOL) isLessThan: (id) object{
	if( [self toNumber] < [object toNumber] ){
		return true;
	}
	else{
		return false;
	}
}

-(BOOL) isGreaterThanOrEqualTo: (id) object{
	if( ! [self isLessThan: object] ){
		return true;
	}
	else{
		return false;
	}
}

-(BOOL) isGreaterThan: (id) object{
	if( ! [self isLessThanOrEqualTo: object] ){
		return true;
	}
	else{
		return false;
	}
}

-(BOOL) isNotEqualTo: (id) object{
	if( ! [self isEqual: object] ){
		return true;
	}
	else{
		return false;
	}
}
*/

@end
