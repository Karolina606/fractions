#import "FractionMathOps.h"

static int gCounterAddMethod = 0;
//extern int gCounterAddMethod;

//ARTHMETIC actions

@implementation Fraction (MathOps)

// I do not need to implement all methods from FractionMathOps.h

-(Fraction *) add: (Fraction *) f{
	gCounterAddMethod++;
	Fraction * fraction = [[Fraction alloc] init];
	fraction.numerator = self.numerator * f.denominator + f.numerator * self.denominator;
	fraction.denominator = self.denominator * f.denominator;
	[fraction reduce];
	
	return fraction;
}

-(Fraction *) subtract: (Fraction *) f{
	Fraction * fraction = [[Fraction alloc] init];
	fraction.numerator = self.numerator * f.denominator - f.numerator * self.denominator;
	fraction.denominator = self.denominator * f.denominator;
	[fraction reduce];
	
	return fraction;
}

-(Fraction *) multiply: (Fraction *) f{
	Fraction * fraction = [[Fraction alloc] init];
	fraction.numerator = self.numerator * f.numerator;
	fraction.denominator = self.denominator * f.denominator;
	[fraction reduce];
	
	return fraction;
}

-(Fraction *) divide: (Fraction *) f{
	Fraction * fraction = [[Fraction alloc] init];
	if(f.numerator == 0){
		NSLog(@"You cannot divide by 0");
	}
	else{
		fraction.numerator = self.numerator * f.denominator;
		fraction.denominator = self.denominator * f.numerator;
		[fraction reduce];
	}
	return fraction;
}

-(Fraction *) invert{
	return [[Fraction alloc] initWith: self.denominator over: self.numerator];
}

// getters
+(int) countAddMethodCalls{
	// it returns amound of add: method calls
	return gCounterAddMethod;
}
@end
