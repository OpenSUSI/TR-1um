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

class cont_po(pya.PCellDeclarationHelper):

    def __init__(self):
        # Initialize super class.
        super(cont_po, self).__init__()
        #
        self.Wmin = DR['CO.W1'].min + 2 * DR['CO.GC'].min
        #
        self.param("x",  self.TypeDouble, "X(um)",     default=self.Wmin)
        self.param("y",  self.TypeDouble, "Y(um)",     default=self.Wmin)
        self.param("x0", self.TypeString, "X0(l/c/r)", default='c')
        self.param("y0", self.TypeString, "Y0(b/c/t)", default='c')

    def display_text_impl(self):
        # Provide a descriptive text for the cell
        return "cont_po(X:" + ('%3f' % self.x) + ",Y:" + ('%3f' % self.y) + ")"
    
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
        draw_acont( self.cell, x_size=self.x, y_size=self.y, x_0 = self.x0, y_0  = self.y0, 
                   co_e = DR['CO.AP'].min, layer = CO_layer )
        #
        draw_metal( self.cell, x_size = self.x, y_size = self.y, x_0=self.x0, y_0 = self.y0,layer=GC_layer)
        draw_metal( self.cell, x_size = self.x, y_size = self.y, x_0=self.x0, y_0 = self.y0,layer=M1_layer, keep = False)
      
class cont_p(pya.PCellDeclarationHelper):

    def __init__(self):
        # Initialize super class.
        super(cont_p, self).__init__()
        #
        self.Wmin = DR['CO.W1'].min + 2 * DR['CO.AP'].min
        self.Smin = DR['AP.AN'].min
        self.Bmin = 2 * (self.Wmin + self.Smin)
        self.Dmin = self.Wmin + self.Bmin
        self.Enc  = DR['CO.AP'].min
        #
        self.param("x",    self.TypeDouble,  "X(um)",     default=self.Wmin)
        self.param("y",    self.TypeDouble,  "Y(um)",     default=self.Wmin)
        self.param("x0",   self.TypeString,  "X0(l/c/r)", default='c')
        self.param("y0",   self.TypeString,  "Y0(b/c/t)", default='c')
        self.param("hole", self.TypeBoolean, "T/F",       default=False)

    def display_text_impl(self):
        # Provide a descriptive text for the cell
        return "cont_p(X:" + ('%3d' % self.x) + ",Y:" + ('%3d' % self.y) + ")"
    
    def coerce_parameters_impl(self):
        # Check parameters
        if self.hole == False :
            if self.x < self.Wmin :
                self.x = self.Wmin
            if self.y < self.Wmin :
                self.y = self.Wmin
            if self.x0 != 'c' and self.x0 != 'l' and self.x0 != 'r' :
                self.x0 = 'c'
            if self.y0 != 'c' and self.y0 != 'b' and self.y0 != 't' :
                self.y0 = 'c'
        else :
            if self.x < self.Dmin :
                self.x = self.Dmin
            if self.y < self.Dmin :
                self.y = self.Dmin

    def produce_impl(self):
        #
        if self.hole == True :
            draw_hole ( self.cell, l = self.x - self.Bmin, w = self.y - self.Bmin, thick = self.Wmin, sep = self.Smin, layer = AP_layer )
            draw_hole ( self.cell, l = self.x - self.Bmin, w = self.y - self.Bmin, thick = self.Wmin, sep = self.Smin, layer = M1_layer )
            draw_dcont( self.cell, l = self.x - self.Bmin, w = self.y - self.Bmin, co_e = self.Enc, ac_an = self.Smin, inlet = 0 )
        #
        else :            
            draw_acont( self.cell, x_size=self.x, y_size=self.y, x_0 = self.x0, y_0  = self.y0, 
                    co_e = self.Enc, layer = CO_layer )
            #
            draw_metal( self.cell, x_size = self.x, y_size = self.y, x_0=self.x0, y_0 = self.y0,layer=AP_layer)
            draw_metal( self.cell, x_size = self.x, y_size = self.y, x_0=self.x0, y_0 = self.y0,layer=M1_layer, keep = False)
   
class cont_n(pya.PCellDeclarationHelper):

    def __init__(self):
        # Initialize super class.
        super(cont_n, self).__init__()
        #
        self.Wmin = DR['CO.W1'].min + 2 * DR['CO.AP'].min
        self.Smin = DR['AP.AN'].min
        self.Bmin = 2 * (self.Wmin + self.Smin)
        self.Dmin = self.Wmin + self.Bmin
        self.Enc  = DR['CO.AP'].min
        #
        self.param("x",    self.TypeDouble,  "X(um)",     default=self.Wmin)
        self.param("y",    self.TypeDouble,  "Y(um)",     default=self.Wmin)
        self.param("x0",   self.TypeString,  "X0(l/c/r)", default='c')
        self.param("y0",   self.TypeString,  "Y0(b/c/t)", default='c')
        self.param("hole", self.TypeBoolean, "T/F",       default=False)

    def display_text_impl(self):
        # Provide a descriptive text for the cell
        return "cont_n(X:" + ('%3d' % self.x) + ",Y:" + ('%3d' % self.y) + ")"
    
    def coerce_parameters_impl(self):
        # Check parameters
        if self.hole == False :
            if self.x < self.Wmin :
                self.x = self.Wmin
            if self.y < self.Wmin :
                self.y = self.Wmin
            if self.x0 != 'c' and self.x0 != 'l' and self.x0 != 'r' :
                self.x0 = 'c'
            if self.y0 != 'c' and self.y0 != 'b' and self.y0 != 't' :
                self.y0 = 'c'
        else :
            if self.x < self.Dmin :
                self.x = self.Dmin
            if self.y < self.Dmin :
                self.y = self.Dmin

    def produce_impl(self):
        #
        if self.hole == True :
            draw_hole ( self.cell, l = self.x - self.Bmin, w = self.y - self.Bmin, thick = self.Wmin, sep = self.Smin, layer = AN_layer )
            draw_hole ( self.cell, l = self.x - self.Bmin, w = self.y - self.Bmin, thick = self.Wmin, sep = self.Smin, layer = M1_layer )
            draw_dcont( self.cell, l = self.x - self.Bmin, w = self.y - self.Bmin, co_e = self.Enc, ac_an = self.Smin, inlet = 0 )
        #
        else :            
            draw_acont( self.cell, x_size=self.x, y_size=self.y, x_0 = self.x0, y_0  = self.y0, 
                    co_e = self.Enc, layer = CO_layer )
            #
            draw_metal( self.cell, x_size = self.x, y_size = self.y, x_0=self.x0, y_0 = self.y0,layer=AN_layer)
            draw_metal( self.cell, x_size = self.x, y_size = self.y, x_0=self.x0, y_0 = self.y0,layer=M1_layer, keep = False)
