#import "Fraction.h"

@implementation Fraction (NSComparisonMethods)
// NSComparisionMethods IMPLEMENTATION (from informal protocol of NSObject)
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
@end
