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

class cap(pya.PCellDeclarationHelper):

    def __init__(self):
        # Initialize super class.
        super(cap, self).__init__()
        #
        self.param("x", self.TypeDouble, "X", default=10.0, unit="um")
        self.param("y", self.TypeDouble, "Y", default=2.0,  unit="um")

    def display_text_impl(self):
        # Provide a descriptive text for the cell
        return "moscap(X=" + ('%3f' % self.x) + ",Y=" + ('%3f' % self.y) + ")"
    
    def coerce_parameters_impl(self):
        # Check parameters
        if self.x < DR['AC.W1'].min :
            self.x = DR['AC.W1'].min
        elif self.x > DR['AC.W1'].max :
            self.x = DR['AC.W1'].max
        if self.y < DR['AC.W1'].min :
            self.y = DR['AC.W1'].min
        elif self.y > DR['AC.W1'].max :
            self.y = DR['AC.W1'].max

    def produce_impl(self):
        #
        draw_cap( self.cell, l=self.x, w=self.y )
