#import "Fraction.h"

static int gCounter = 0;	
				// how many instances do we made
				// you can set its value in the [+initialize] methond, which works on the beginnig of the program

//int gCounterAddMethod = 0;	
				// when we do it static we can't see it from FractionMathOps.m
				// now it is not reseting in each call of add: (it is still static but able to extern)
				// it is now in the FractionMathOps.m

int gcd(int u, int v){
	//	greatest common divisor
	int t;

	while( v != 0){
		t = u % v;
		u = v;
		v = t;
	}
	return u;
}

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
	//	reduce fraction
	int divider = gcd(numerator, denominator);
	numerator /= divider;
	denominator /= divider;
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

//CLASS METHODS ------------------------------------------------------------------------------------
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

@end
