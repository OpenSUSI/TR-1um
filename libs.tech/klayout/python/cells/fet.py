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

class pfet(pya.PCellDeclarationHelper):

    def __init__(self):
        # Initialize super class.
        super(pfet, self).__init__()
        #
        self.param("type", self.TypeString, "Type",   default="PFET")
        #
        self.param("l", self.TypeDouble, "Length",    default=DR['GC.W1'].min, unit="um")
        self.param("w", self.TypeDouble, "Width",     default=DR['AP.WM'].min, unit="um")
        self.param("n", self.TypeInt,    "Gates",   default=1)
        self.param("cont_between_gates", self.TypeBoolean,    "Contact between gates?",   default=True)
        self.param("y0",self.TypeString, "Y0(b/c/t)", default='c')


    def display_text_impl(self):
        # Provide a descriptive text for the cell
        return "pfet(L=" + ('%.3f' % self.l) + ",W=" + ('%.3f' % self.w) + ")"
    
    def coerce_parameters_impl(self):
        # Check parameters
        if self.w < DR['AP.WM'].min :
            self.w = DR['AP.WM'].min
        elif self.w > DR['AP.WM'].max :
            self.w = DR['AP.WM'].max
        if self.l < DR['AP.LM'].min :
            self.l = DR['AP.LM'].min
        elif self.l > DR['AP.LM'].max :
            self.l = DR['AP.LM'].max
        if self.n < 1 :
            self.n = 1
        if self.cont_between_gates != True and self.cont_between_gates != False :
            self.cont_between_gates = True
        if self.y0 != 'c' and self.y0 != 'b' and self.y0 != 't' :
            self.y0 = 'c'

    '''
    def can_create_from_shape_impl(self):
        # OPTIONAL: Implement the "Create PCell from shape" protocol: we can use any shape which
        # has a finite bounding box
        print("Shape:" + self.shape.is_box() or self.shape.is_polygon() or self.shape.is_path())
        return self.shape.is_box() or self.shape.is_polygon() or self.shape.is_path()

    def parameters_from_shape_impl(self):
        # OPTIONAL: Implement the "Create PCell from shape" protocol:
        # bounding box width and layer
        print(self.layout.get_info(self.layer))
        self.b = self.shape.bbox().width() * self.shape.bbox().height()
    
    def transformation_from_shape_impl(self):
        # OPTIONAL: Implement the "Create PCell from shape" protocol: we use the center of the shape's
        # bounding box to determine the transformation
        return pya.Trans(self.shape.bbox().center())
    '''   
    def produce_impl(self):
        #
        draw_fet( self.cell, l=self.l, w=self.w, fnum=self.n, cont_between_gates=self.cont_between_gates, y_0=self.y0, e_cap = DR['GC.EP'].min, layer=AP_layer)
        #
      
class nfet(pya.PCellDeclarationHelper):

    def __init__(self):
        # Initialize super class.
        super(nfet, self).__init__()
        #
        self.param("type", self.TypeString, "Type", default="NFET")
        #
        self.param("l", self.TypeDouble, "Length",    default=DR['GC.W1'].min, unit="um")
        self.param("w", self.TypeDouble, "Width",     default=DR['AN.WM'].min, unit="um")
        self.param("n", self.TypeInt,    "Gates",   default=1)
        self.param("cont_between_gates", self.TypeBoolean,    "Contact between gates?",   default=True)
        self.param("y0",self.TypeString, "Y0(b/c/t)", default='c')

    def display_text_impl(self):
        # Provide a descriptive text for the cell
        return "nfet(L=" + ('%.3f' % self.l) + ",W=" + ('%.3f' % self.w) + ")"
 
    def coerce_parameters_impl(self):
        # Check parameters
        if self.w < DR['AN.WM'].min :
            self.w = DR['AN.WM'].min
        elif self.w > DR['AN.WM'].max :
            self.w = DR['AN.WM'].max
        if self.l < DR['AN.LM'].min :
            self.l = DR['AN.LM'].min
        elif self.l > DR['AN.LM'].max :
            self.l = DR['AN.LM'].max
        if self.n < 1 :
            self.n = 1
        if self.cont_between_gates != True and self.cont_between_gates != False :
            self.cont_between_gates = True
        if self.y0 != 'c' and self.y0 != 'b' and self.y0 != 't' :
            self.y0 = 'c'

    def produce_impl(self):
        #
        draw_fet( self.cell, l=self.l, w=self.w, fnum=self.n, cont_between_gates=self.cont_between_gates, y_0=self.y0, e_cap = DR['GC.EN'].min, layer=AN_layer)
        #       
