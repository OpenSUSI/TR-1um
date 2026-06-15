# TR-1um: Copyright 2025 OpenSUSI non-profit organaization 
#
# Original version was made by jun1okamura
# LICENSE: Apache License Version 2.0, January 2004,
#          http://www.apache.org/licenses/
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#
import pya
from .fet       import *
from .diode     import *
from .resistor  import *
from .capacitor import *
from .cont      import *
from .via       import *

# It's a Python class that inherits from the pya.Library class
class tr_1um(pya.Library):

    def __init__(self):
        # Set the description
        self.description = "TR-1um PCell library"

    # Create the PCell declarations
        #
        # MOS DEVICES
        self.layout().register_pcell("fet_p",   pfet())
        self.layout().register_pcell("fet_n",   nfet())
        #
        # DIODE DEVICES
        self.layout().register_pcell("diode_p", diode_p())
        self.layout().register_pcell("diode_n", diode_n())
        #
        # CAP Devices 
        self.layout().register_pcell("moscap",  cap()) # CSIO device
        #
        # RES Devices 
        self.layout().register_pcell("res_diff", res_d()) # Diff resistance
        self.layout().register_pcell("res_poly", res_p()) # Poly resistance
        #
        #　Contacts
        self.layout().register_pcell("cont_g",  cont_po())
        self.layout().register_pcell("cont_p",  cont_p())
        self.layout().register_pcell("cont_n",  cont_n())
        #
        #　Via
        self.layout().register_pcell("via_1",   via_1())
        #
        # Register us with the name "TR-1um".
        self.register("TR-1um")

