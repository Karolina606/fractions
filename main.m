//	Program to deal with fractions
//	Author: Karolina Nogacka
#import <Foundation/Foundation.h>
#import "Fraction.h"
#import "FractionMathOps.h"	//without it program sitll work but it give warning "Fraction may not respond add:..."
#import "FractionComparision.h"

int main(int argc, char const * argv[]){
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	//typedef
	typedef Fraction * FractionObj;	//pattern: "(typedef)(what type we want to replace)(new name of type)"

	FractionObj fraction1 = [[Fraction allocF] init];	//it works thanks typedef	
	Fraction * fraction2 = [[Fraction allocF] init];
	Fraction * fraction3;
	float n, d;
	
	//fraction 1
	printf("FRACTION1------------------------\n");
	printf("Give me an numerator (fraction1): ");
	scanf("%f", &n);
	[fraction1 setNumerator: n];
	
	printf("Give me a denominator (fraction1): ");
	scanf("%f", &d);
	[fraction1 setDenominator: d];
	
	printf("Your fraction (fraction1): ");
	[fraction1 print: NO];	
	
	printf("After reduce (fraction1): ");
	[fraction1 print: YES];

	printf("To number (fraction1): %.2f\n\n", [fraction1 toNumber]);

	//fraction 2
	printf("FRACTION2------------------------\n");
	printf("Give me an numerator (fraction2): ");
	scanf("%f", &n);
	[fraction2 setNumerator: n];
	
	printf("Give me a denominator (fraction2): ");
	scanf("%f", &d);
	[fraction2 setDenominator: d];
	
	printf("Your fraction (fraction2): ");
	[fraction2 print: NO];	
	
	printf("After reduce (fraction2): ");
	[fraction2 print: YES];

	printf("To number (fraction2): %.2f\n\n", [fraction2 toNumber]);
	
	//math on fractions
	printf("ADD------------------------------\n");
	printf("fraction1 + fraction2: ");
	fraction3 = [fraction1 add: fraction2];
	fraction3 = [fraction1 add: fraction2];		//we do it secound time, because we want so check countAddMethodCalls:
	[fraction3 print: NO];
	
	printf("SUBTRACT-------------------------\n");
	printf("fraction1 - fraction2: ");
	fraction3 = [fraction1 subtract: fraction2];
	[fraction3 print: NO];

	printf("MULTIPLY-------------------------\n");
	printf("fraction1 * fraction2: ");
	fraction3 = [fraction1 multiply: fraction2];
	[fraction3 print: NO];
	
	printf("DIVIDE---------------------------\n");
	printf("fraction1 / fraction2: ");
	fraction3 = [fraction1 divide: fraction2];
	[fraction3 print: NO];

	printf("COMPARASION-----------------------\n");
	printf("Is fraction1 equal fraction2: %i\n", [fraction1 isEqualTo: fraction2]? 1 : 0);
	printf("Compare fraction1 and fraction2: %i\n", [fraction1 compareF: fraction2]);
	// from NSComparisonMethods - informal protocol of class NSObject
	printf("Is fraction1 less than or equal to fraction2: %i\n", [fraction1 isLessThanOrEqualTo: fraction2]? 1 : 0);
	printf("Is fraction1 greater than fraction2: %i\n", [fraction1 isGreaterThan: fraction2]? 1 : 0);
	

	printf("\n");	

	//FRACTION 4 - init with values
	Fraction * fraction4 = [[Fraction allocF] initWith: 4 over: 5];

	//data encapsulation
	fraction4.numerator = 3;	// it works only for subclasses, but it will be give a warning
	fraction4.denominator = 8;	// it works only for subclasses, but it will be give a warning
	printf("FRACTION4------------------------\n");
	printf("fraction4: ");
	[fraction4 print: NO];

	//INVERT METHOD from catalog (MathOps)
	fraction4 = [fraction4 invert];
	printf("fraction4 invert: ");
	[fraction4 print: NO];
	
	printf("\n");
	
	//STATIC VARIABLE COUNTS ALLOCATED INSTANCES
	//we have three instances allocated with allocF and one with alloc(by add: method)
	printf("Fraction allocated: %i\n", [Fraction count]);
	
	Fraction *a, *b, *c;
	a = [[Fraction allocF] init];
	b = [[Fraction allocF] init];
	c = [[Fraction allocF] init];

	printf("Fraction allocated (after adding 3): %i\n", [Fraction count]);
	
	[a release];
	[b release];
	[c release];
	
	//STATIC VARIABLE COUNTS ADD: METHOD CALLS
	printf("Add method calls: %i\n\n", [Fraction countAddMethodCalls]);
	
	//SIZEOF
	printf("Size of Fraction: %li\n", sizeof(Fraction));
	printf("Size of int: %li\n", sizeof(int));
	printf("Size of float: %li\n", sizeof(float));
	printf("Size of double: %li\n\n", sizeof(double));

	NSArray * fractionArray = [NSArray arrayWithObjects: (Fraction *) fraction1, (Fraction *) fraction2, (Fraction *) fraction4, nil];
	Fraction * sumFraction = [Fraction sumOfFractionArray: fractionArray];
	printf("Sum of farction1, fraction2, fraction4:\n ");
	[sumFraction print: NO];

	// NSString format with %@ --> display Fraction
	printf("\n");
	NSLog(@"%@", fraction1);

	//RELEASE
	[fraction1 release];
	[fraction2 release];
	[fraction3 release];
	[fraction4 release];
	[sumFraction release];
	[pool drain];
	return 0;
}
