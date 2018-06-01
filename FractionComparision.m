#import "FractionComparision.h"

@implementation Fraction (Comparision)
-(BOOL) isEqualTo: (Fraction *) f{
	if( [self toNumber] == [f toNumber]){
		return true;
	}
	else{
		return false;
	}
}

-(int) compareF: (Fraction *) f{
	if([self toNumber] < [f toNumber]){
		return -1;
	}
	else if([self toNumber] == [f toNumber]){
		return 0;
	}
	else{
		return 1;
	}
}
@end
