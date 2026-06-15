# TR-1um: Copyright 2025 OpenSUSI non-profit organaization 
#
# Original version was made by jun1okamura
# LICENSE: Apache License Version 2.0, January 2004,
#          http://www.apache.org/licenses/
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#
import pya
from .layers_def import *
from .rules_def  import *
from .util       import *
   
class via_1(pya.PCellDeclarationHelper):

    def __init__(self):
        # Initialize super class.
        super(via_1, self).__init__()
        #
        self.Wmin = DR['V1.W1'].min + 2 * DR['V1.M1'].min
        #
        self.param("x",  self.TypeInt,    "X(um)",     default=self.Wmin)
        self.param("y",  self.TypeInt,    "Y(um)",     default=self.Wmin)
        self.param("x0", self.TypeString, "X0(l/c/r)", default='c')
        self.param("y0", self.TypeString, "Y0(b/c/t)", default='c')

    def display_text_impl(self):
        # Provide a descriptive text for the cell
        return "via_1(X:" + ('%3d' % self.x) + ",Y:" + ('%3d' % self.y) + ")"
    
    def coerce_parameters_impl(self):
        # Check parameters
        if self.x < self.Wmin :
            self.x = self.Wmin
        if self.y < self.Wmin :
            self.y = self.Wmin
        if self.x0 != 'c' and self.x0 != 'l' and self.x0 != 'r' :
            self.x0 = 'c'
        if self.y0 != 'c' and self.y0 != 'b' and self.y0 != 't' :
            self.y0 = 'c'

    def produce_impl(self):
        #
        draw_acont( self.cell, 
                    co_w   = DR['V1.W1'].min, 
                    co_s   = DR['V1.S1'].min, 
                    co_e   = DR['V1.M1'].min,
                    x_size = self.x, 
                    y_size = self.y, 
                    x_0    = self.x0, 
                    y_0    = self.y0, 
                    layer  = V1_layer )
        #
        draw_metal( self.cell, 
                    co_w   = DR['V1.W1'].min, 
                    co_s   = DR['V1.S1'].min, 
                    co_e   = DR['V1.M1'].min,
                    x_size = self.x, 
                    y_size = self.y, 
                    x_0    = self.x0, 
                    y_0    = self.y0, 
                    layer  = M1_layer)
        #
        draw_metal( self.cell, 
                    co_w   = DR['V1.W1'].min, 
                    co_s   = DR['V1.S1'].min, 
                    co_e   = DR['M2.V1'].min,
                    x_size = self.x, 
                    y_size = self.y, 
                    x_0    = self.x0, 
                    y_0    = self.y0, 
                    layer  = M2_layer)
