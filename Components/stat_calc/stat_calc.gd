class_name StatCalc
extends Object
## custom stat calculation for multiplier stats surely
##

var _fstat : float = 0
var _istat : int = 0


## applies sumed_mult and multiplied_mult on stat by: 
##  summing up sumed_mult and multiplying stat by the result
##  multiplying up multiplied_mult and multiplying stat by the result
func apply(stat , sumed_mult : Array  = [1] , multiplied_mult : Array = [1] ): 
	
	var a1 : float = sumed_mult.reduce(func(x,y): return x+y,0)
	print(sumed_mult,a1)
	var b1 : float = multiplied_mult.reduce(func(x,y): return x*y,1)
	print(multiplied_mult,b1)
	return stat * a1 * b1
