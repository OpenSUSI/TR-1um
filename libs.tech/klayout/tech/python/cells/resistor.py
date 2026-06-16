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

class res_p(pya.PCellDeclarationHelper):

    def __init__(self):
        # Initialize super class.
        super(res_p, self).__init__()
        #
        self.param("l", self.TypeDouble, "L", default=10.0, unit="um")
        self.param("w", self.TypeDouble, "W", default=2.0,  unit="um")

    def display_text_impl(self):
        # Provide a descriptive text for the cell
        return "res_p(L=" + ('%3f' % self.l) + ",W=" + ('%3f' % self.w) + ")"
    
    def coerce_parameters_impl(self):
        # Check parameters
        if self.w < DR['GR.W1'].min :
            self.w = DR['GR.W1'].min
        elif self.w > DR['GR.W1'].max :
            self.w = DR['GR.W1'].max
        if self.l < DR['GR.L1'].min :
            self.l = DR['GR.L1'].min
        elif self.l > DR['GR.L1'].max :
            self.l = DR['GR.L1'].max

    def produce_impl(self):
        #
        draw_res_p( self.cell, l=self.l, w=self.w, layer = GR_layer )
    #

class res_d(pya.PCellDeclarationHelper):

    def __init__(self):
        # Initialize super class.
        super(res_d, self).__init__()
        #
        self.param("l", self.TypeDouble, "L", default=10.0, unit="um")
        self.param("w", self.TypeDouble, "W", default=2.0,  unit="um")

    def display_text_impl(self):
        # Provide a descriptive text for the cell
        return "res_d(L=" + ('%3f' % self.l) + ",W=" + ('%3f' % self.w) + ")"
    
    def coerce_parameters_impl(self):
        # Check parameters
        if self.w < DR['AR.W1'].min :
            self.w = DR['AR.W1'].min
        elif self.w > DR['AR.W1'].max :
            self.w = DR['AR.W1'].max
        if self.l < DR['AR.L1'].min :
            self.l = DR['AR.L1'].min
        elif self.l > DR['AR.L1'].max :
            self.l = DR['AR.L1'].max

    def produce_impl(self):
        #
        draw_res_d( self.cell, l=self.l, w=self.w )
