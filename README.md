# 240032P1_ExParcial_Q1_2017-18

## Examen parcial Curs 2017-18 Q1 Problema 1

1. Using the mesh file Circlemesh02 we define a temperature for each node
   according to the function

   	$f(x,y) = \dfrac{20(x^2+y^2)}{\sqrt{x^2 + y^2 + 0.01}}$

   (a) Compute the interpolated temperature associated to the point $p =
   (-0.6,0.6)$ and the triangle it belongs. Which is the relative error when
   comparing the interpolated temperature and the one assigned by the function?

   |  numTrig  |  T\(p\)  | RelError   |
   |:---------:|:--------:|:----------:|
   | 25        | 1.7013e+01| 9.4262e-03|

   (Hint: for node 35 the temperature value is 3.8437e-01).

   (b) If we assign to each triangle the temperature value at its barycenter.
   The triangle with maximum temperature and its value is:


   |  numTrig  |  Temp      |
   |:---------:|:----------:|
   | 27        | 1.7985e+01 |

   (Hint: for element 37 the temperature value is 1.2465e+01).
