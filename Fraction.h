#import <Foundation/Foundation.h>

@interface Fraction: NSObject {

	int numerator;
	int denominator;
}

@property int numerator, denominator;

// ################## instance methods #####################

-(void) print: (BOOL) ifReduce;
	// -(void) print: 		prints a fraction
	// Arguments:		
	//		ifReduce		if fraction should be reduced
	// Return:
	//		void

-(void) reduce;
	// -(void) reduce: 		changes fraction to double value
	// Arguments:		
	//		void		
	// Return:
	//		void

-(double) toNumber;
	// -(double) toNumber: 	changes fraction to double value
	// Arguments:		
	//		void		
	// Return:
	//		fraction in double value

-(void) setTo: (int) n over: (int) d;
	// -(void) setTo: (int) n over: (int) d			sets fractions numerator and denominator
	// Arguments:		
	//		n:		numerator
	//		d		denominator
	// Return:
	//		void

-(id) initWith: (int) n over: (int) d;
	// -(id) initWith: (int) n over: (int) d			inits fraction with numerator and denominator
	// Arguments:		
	//		n:		numerator
	//		d		denominator
	// Return:
	//		pointer to allocated Fraction instance

// ################## class methods #####################
+(Fraction *) allocF;
	// +(Fraction *) allocF			allocated fraction instance and initializes it
	// Arguments:		
	//		void
	// Return:
	//		pointer to allocated Fraction instance

+(int) count;
	// +(int) count					count allocated fractions
	// Arguments:		
	//		void
	// Return:
	//		integer value of allocated fractions

+(void) setCounter: (int) c;
	// +(int) setCounter			sets counter of allocated instances of Fraction class
	// Arguments:		
	//		void
	// Return:
	//		integer value of allocated fractions


+(Fraction *) sumOfFractionArray: (NSArray *) array;
	// +(Fraction *) sumOfFractionArray: (NSArray *) array				sums all fractions from array
	// Arguments:		
	//		array:		array of Fraction instances
	// Return:
	//		pointer to Fraction instance with sum

@end
