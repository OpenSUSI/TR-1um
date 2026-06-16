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

class diode_p(pya.PCellDeclarationHelper):

    def __init__(self):
        # Initialize super class.
        super(diode_p, self).__init__()
        #
        self.Wmin = DR['CO.WD'].min + 2 * DR['CO.AD'].min
        #
        self.param("x",  self.TypeDouble, "X(um)",     default=self.Wmin)
        self.param("y",  self.TypeDouble, "Y(um)",     default=self.Wmin)

    def display_text_impl(self):
        # Provide a descriptive text for the cell
        return "diode_p(X:" + ('%3f' % self.x) + ",Y:" + ('%3f' % self.y) + ")"
    
    def coerce_parameters_impl(self):
        # Check parameters
        if self.x < self.Wmin :
            self.x = self.Wmin
        if self.y < self.Wmin :
            self.y = self.Wmin

    def produce_impl(self):
        #
        draw_acont( self.cell, x_size=self.x, y_size=self.y, 
                   co_w = DR['CO.WD'].min, co_e = DR['CO.AD'].min, layer = CO_layer )
        #
        draw_metal( self.cell, x_size = self.x, y_size = self.y, co_e = DR['CO.AD'].min, co_w = DR['CO.WD'].min, layer = AP_layer)
        draw_metal( self.cell, x_size = self.x, y_size = self.y, co_e = DR['M1.CL'].min, co_w = DR['CO.WD'].min, layer = M1_layer, keep=False)

class diode_n(pya.PCellDeclarationHelper):

    def __init__(self):
        # Initialize super class.
        super(diode_n, self).__init__()
        #
        self.Wmin = DR['CO.WD'].min + 2 * DR['CO.AD'].min
        #
        self.param("x",  self.TypeDouble, "X(um)",     default=self.Wmin)
        self.param("y",  self.TypeDouble, "Y(um)",     default=self.Wmin)

    def display_text_impl(self):
        # Provide a descriptive text for the cell
        return "diode_n(X:" + ('%3f' % self.x) + ",Y:" + ('%3f' % self.y) + ")"
    
    def coerce_parameters_impl(self):
        # Check parameters
        if self.x < self.Wmin :
            self.x = self.Wmin
        if self.y < self.Wmin :
            self.y = self.Wmin

    def produce_impl(self):
        #
        draw_acont( self.cell, x_size=self.x, y_size=self.y,
                   co_w = DR['CO.WD'].min, co_e = DR['CO.AD'].min, layer = CO_layer )
        #
        draw_metal( self.cell, x_size = self.x, y_size = self.y, co_e = DR['CO.AD'].min, co_w = DR['CO.WD'].min, layer = AN_layer)
        draw_metal( self.cell, x_size = self.x, y_size = self.y, co_e = DR['M1.CL'].min, co_w = DR['CO.WD'].min, layer = M1_layer, keep=False)
