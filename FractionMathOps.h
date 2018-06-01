#import "Fraction.h"

@interface Fraction (MathOps)

// I can't add here any instance variables (in category)
// If I must to do this make some subclass

// subclasses will inherit thise methods form category

// ARTHMETIC category
-(Fraction *) add: (Fraction *) f;
-(Fraction *) subtract: (Fraction *) f;
-(Fraction *) multiply: (Fraction *) f;
-(Fraction *) divide: (Fraction *) f;
-(Fraction *) invert;

//getters
+(int) countAddMethodCalls;
@end
