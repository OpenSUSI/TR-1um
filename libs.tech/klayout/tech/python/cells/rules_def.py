#
# TR-1um: Copyright 2025 OpenSUSI non-profit organaization 
#
# Original version was made by jun1okamura
# LICENSE: Apache License Version 2.0, January 2004,
#          http://www.apache.org/licenses/
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
#
class DRule():
    def __init__(self, min: float, max: float, L1: str, L2: str, func: str) -> None:
        self.min  = min
        self.max  = max      
        self.L1   = L1
        self.L1   = L2
        self.func = func

    def min(self) :
        return self.min

    def max(self) :
        return self.max

    def L1(self) :
        return self.L1

    def L2(self) :
        return self.L2

    def func(self) :
        return self.func

# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
class Design_Rule( DRule ):
    #
    def __init__(self) -> None:
        self._dict = {}

    def __setitem__(self, key, desc: DRule) :
        if not isinstance(key, str):
            raise Exception()
        #
        # Prohibit Overwrite
        #
        if key in self._dict :
            raise KeyError(f"Key '{key}' already exists. Overwriting is not allowed.")
        #        
        self._dict[key]  = desc

    def __getitem__(self, key) :
        if not isinstance(key, str):
            raise Exception()
        return self._dict[key]

    @property
    def min(self, key) :
        return self._dict[key].min
    
    @property
    def max(self, key) :
        return self._dict[key].max
    
    @property
    def L1(self, key) :
        return self._dict[key].L1
    
    @property
    def L2(self, key) :
        return self._dict[key].L2
    
    @property
    def func(self, key) :
        return self._dict[key].func
    
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
DR = Design_Rule()
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 

DR['WN.Z1'] = DRule(   0.0,  -1.0, 'WN(R)','AP+AC','None' )
DR['WN.Z2'] = DRule(   0.0,  -1.0, 'WN(C)','AP+AR','None' )
DR['CO.Z1'] = DRule(   0.0,  -1.0, 'CO','AA+GC+GR','None' )
DR['CO.Z3'] = DRule(   0.0,  -1.0, 'CO','M1','None' )
DR['V1.Z1'] = DRule(   0.0,  -1.0, 'V1','M1','None' )
DR['V1.Z2'] = DRule(   0.0,  -1.0, 'V1','M2','None' )
DR['PO.Z1'] = DRule(   0.0,  -1.0, 'PO','M1','None' )
DR['PO.Z2'] = DRule(   0.0,  -1.0, 'PO','M2','None' )
DR['PO.Z3'] = DRule(   0.0,  -1.0, 'PO','V1(P)','Exist' )
DR['WN.W1'] = DRule(   8.0,  -1.0, 'WN','','Wmin' )
DR['WN.S1'] = DRule(  12.0,  -1.0, 'WN','WN','Smin' )
DR['WN.S2'] = DRule(   9.5,  -1.0, 'WN','WN(R)','Smin' )
DR['WN.S3'] = DRule(  12.0,  -1.0, 'WN','WN(C)','Smin' )
DR['WN.S4'] = DRule(   9.5,  -1.0, 'WN(R)','WN(C)','Smin' )
DR['WN.S5'] = DRule(   8.0,  -1.0, 'WN(R)','WN(R)','Smin' )
DR['WN.S6'] = DRule(  12.0,  -1.0, 'WN(C)','WN(C)','Smin' )
DR['WN.AP'] = DRule(   5.0,  -1.0, 'WN','AP','Smin' )
DR['WN.AN'] = DRule(  10.0,  -1.0, 'WN','AN','Smin' )
DR['AR.S1'] = DRule(   4.0,  -1.0, 'AR ','AR','Smin' )
DR['AR.WR'] = DRule(  10.0,  -1.0, 'AR','WN(R)','Emin' )
DR['AN.WR'] = DRule(   5.0,  -1.0, 'AN','WN(R)','Emin' )
DR['AR.AN'] = DRule(   4.0,  -1.0, 'AR','AN','Smin' )
DR['AC.W1'] = DRule(  28.5, 120.0, 'AC','','Wmin/max' )
DR['AN.WC'] = DRule(   3.0,  -1.0, 'AN','WN(C)','Emin' )
DR['AC.AN'] = DRule(   2.8,  -1.0, 'AC','AN','Smin' )
DR['AC.GC'] = DRule(   1.4,  -1.0, 'AC','GC','Emin' )
DR['AC.R1'] = DRule(   0.0,  -1.0, 'AC','AN(C)','Donut' )
DR['AP.W1'] = DRule(   1.4,  -1.0, 'AP','','Wmin' )
DR['AP.S1'] = DRule(   1.4,  -1.0, 'AP','AP','Smin' )
DR['AP.AN'] = DRule(   2.8,  -1.0, 'AP','AN','Smin' )
DR['AP.WM'] = DRule(   3.4,  60.0, 'PMOS','AP-GC','Wmin/max' )
DR['AP.LM'] = DRule(   1.0,  30.0, 'PMOS','GC-AN','Lmin/max' )
DR['AP.WN'] = DRule(   7.0,  -1.0, 'AP','WN','Emin' )
DR['DP.W1'] = DRule(   2.8,  -1.0, 'DP','','Wmin' )
DR['DP.AP'] = DRule(   2.8,  -1.0, 'DP','AP','Smin' )
DR['DP.AN'] = DRule(   2.8,  -1.0, 'DP','AN','Smin' )
DR['AN.W1'] = DRule(   1.4,  -1.0, 'AN','','Wmin' )
DR['AN.S1'] = DRule(   1.4,  -1.0, 'AN','AN','Smin' )
DR['AN.AP'] = DRule(   2.8,  -1.0, 'AN','AP','Smin' )
DR['AN.WM'] = DRule(   3.4,  60.0, 'NMOS','AN-GC','Wmin/max' )
DR['AN.LM'] = DRule(   1.0,  30.0, 'NMOS','GC-AN','Lmin/max' )
DR['AN.WN'] = DRule(   5.0,  -1.0, 'AN','WN(M)','Emin' )
DR['DN.W1'] = DRule(   2.8,  -1.0, 'DN','','Wmin' )
DR['DN.AP'] = DRule(   2.8,  -1.0, 'DN','AP','Smin' )
DR['DN.AN'] = DRule(   2.8,  -1.0, 'DN','AN','Smin' )
DR['GC.W1'] = DRule(   1.0,  30.0, 'GC','','Wmin' )
DR['GC.S1'] = DRule(   1.2,  -1.0, 'GC','GC','Smin' )
DR['GC.AP'] = DRule(   0.4,  -1.0, 'GC','AP','Smin' )
DR['GC.AN'] = DRule(   0.4,  -1.0, 'GC','AN','Smin' )
DR['GC.EP'] = DRule(   1.2,  -1.0, 'PMOS','GC','ECmin' )
DR['GC.EN'] = DRule(   1.2,  -1.0, 'NMOS','GC','ECmin' )
DR['CO.W1'] = DRule(   1.0,  -1.0, 'CO','','Wmin' )
DR['CO.S1'] = DRule(   1.0,  -1.0, 'CO','CO','Smin' )
DR['CO.WD'] = DRule(   1.2,  -1.0, 'CO(D)','','Wfix' )
DR['CO.AD'] = DRule(   1.2,  -1.0, 'CO(D)','AP+AN','Emin' )
DR['CO.AP'] = DRule(   0.8,  -1.0, 'CO','AP','Emin' )
DR['CO.AN'] = DRule(   0.8,  -1.0, 'CO','AN','Emin' )
DR['CO.GG'] = DRule(   1.0,  -1.0, 'CO','GC(G)','Smin' )
DR['CO.GC'] = DRule(   0.8,  -1.0, 'CO','GC+GR','Emin' )
DR['AR.W1'] = DRule(   2.8,  20.0, 'RR','RR(L)','Wmin/max' )
DR['AR.L1'] = DRule(  13.0, 100.0, 'RR','RR(W)','Lmin/max' )
DR['AR.GC'] = DRule(   1.0,  -1.0, 'GC','AR','Smin' )
DR['AR.PW'] = DRule(   2.0,  -1.0, 'GC(R)','','Wmin' )
DR['AR.XY'] = DRule(   1.0,  -1.0, 'AR','Bevel','XYmin' )
DR['GC.R1'] = DRule(   0.0,  -1.0, 'AR','GC(R)','Donut' )
DR['GC.R2'] = DRule(   0.0,  -1.0, 'GC(R)','WN(R)','TieDown' )
DR['GR.W1'] = DRule(   4.0,  20.0, 'RS','RS(L)','Wmin/max' )
DR['GR.L1'] = DRule(  20.0, 100.0, 'RS','RS(W)','Lmin/max' )
DR['GR.S1'] = DRule(   2.0,  -1.0, 'RS','RS','Smin' )
DR['CR.W1'] = DRule(   1.0,  -1.0, 'CO(RR)','','Wmin' )
DR['CR.W2'] = DRule(   1.0,  97.5, 'CL(RR)','','Wmin/max' )
DR['CR.AT'] = DRule(   1.5,  -1.0, 'CO(RR)','AR(T)','Emin' )
DR['CR.AS'] = DRule(   1.0,  -1.0, 'CO(RR)','AR(S)','Emin' )
DR['CC.W1'] = DRule(   1.2,  -1.0, 'CO(C)','','Wmin' )
DR['CC.S1'] = DRule(   1.2,  -1.0, 'CO(C)','CO(C)','Smin' )
DR['CC.AC'] = DRule(   2.9,  -1.0, 'CO(C)','AC','Emin' )
DR['CC.AN'] = DRule(   1.2,  -1.0, 'CO(C)','AN','Emin' )
DR['M1.W1'] = DRule(   1.8,  -1.0, 'M1','','Wmin' )
DR['M1.S1'] = DRule(   1.4,  -1.0, 'M1','M1','Smin' )
DR['M1.SC'] = DRule(  10.0,  -1.0, 'M1(C)','M1(C)','Smin' )
DR['M1.CO'] = DRule(   0.8,  -1.0, 'M1','CO(S)','Fmin' )
DR['M1.CC'] = DRule(   1.2,  -1.0, 'M1','CO(C)','Fmin' )
DR['M1.CL'] = DRule(   1.2,  -1.0, 'M1','CO(L)','Fmin' )
DR['M1.SW'] = DRule(   2.0,  -1.0, 'M1(W)','M1','Smin' )
DR['V1.W1'] = DRule(   1.4,  -1.0, 'V1','','Wfix' )
DR['V1.S1'] = DRule(   1.5,  -1.0, 'V1','V1','Smin' )
DR['V1.M1'] = DRule(   1.0,  -1.0, 'V1','M1','Emin' )
DR['V1.GC'] = DRule(   1.2,  -1.0, 'V1','GC','Smin' )
DR['V1.CO'] = DRule(   1.0,  -1.0, 'V1','CO','Smin' )
DR['V1.CL'] = DRule(   1.4,  -1.0, 'V1','CO(L)','Smin' )
DR['M2.W1'] = DRule(   3.0,  -1.0, 'M2','','Wmin' )
DR['M2.S1'] = DRule(   2.0,  -1.0, 'M2','M2','Smin' )
DR['M2.V1'] = DRule(   1.0,  -1.0, 'M2','V1','Fmin' )
DR['APE.WM'] = DRule(  11.0,  60.0, 'PMOSE','APE-GC','Wmin/max' )
DR['APE.LM'] = DRule(   2.0,  30.0, 'PMOSE','GC-ANE','Lmin/max' )
DR['APE.AN'] = DRule(  10.0,  -1.0, 'APE','AN','Smin' )
DR['APE.XY'] = DRule(   1.4,  -1.0, 'APE','Bevel','XYmin' )
DR['APE.CO'] = DRule(   2.0,  -1.0, 'APE','CO','Smin' )
DR['ANE.WM'] = DRule(  11.0,  60.0, 'NMOSE','ANE-GC','Wmin/max' )
DR['ANE.LM'] = DRule(   2.0,  30.0, 'NMOSE','GC-ANE','Lmin/max' )
DR['ANE.AP'] = DRule(  10.0,  -1.0, 'ANE','AP','Smin' )
DR['ANE.XY'] = DRule(   1.4,  -1.0, 'ANE','Bevel','XYmin' )
DR['ANE.CO'] = DRule(   2.0,  -1.0, 'ANE','CO','Smin' )
DR['COE.W1'] = DRule(   3.0,  -1.0, 'CO(E) ','','Wfix' )
DR['COE.S1'] = DRule(   1.6,  -1.0, 'CO(E) ','CO(E) ','Smin' )
DR['CDE.GC'] = DRule(   7.0,  -1.0, 'CD(E)','GC','Smin' )
DR['CSE.GC'] = DRule(   3.0,  -1.0, 'CS(E)','GC','Smin' )
DR['COE.AP'] = DRule(   4.0,  -1.0, 'CO(E) ','AP','Emin' )
DR['COE.AN'] = DRule(   4.0,  -1.0, 'CO(E) ','AN','Emin' )
DR['PO.W1'] = DRule(  70.0,  -1.0, 'PO','','Wmin' )
DR['PO.S1'] = DRule(  64.0,  -1.0, 'PO','PO','Smin' )
DR['M2.PO'] = DRule(   5.0,  -1.0, 'M2(P)','PO','Fmin' )
DR['M1.PO'] = DRule(   5.0,  -1.0, 'M1(P)','PO','Fmin' )
DR['PO.V1'] = DRule(  10.0,  -1.0, 'PO','V1(P)','Emin' )
DR['PO.AP'] = DRule(  14.0,  -1.0, 'PO','AP','Smin' )
DR['PO.AN'] = DRule(  14.0,  -1.0, 'PO','AN','Smin' )
DR['PO.GC'] = DRule(  14.0,  -1.0, 'PO','GC','Smin' )
DR['PO.M1'] = DRule(  14.0,  -1.0, 'PO','M1','Smin' )
DR['PO.M2'] = DRule(  14.0,  -1.0, 'PO','M2','Smin' )
DR['M2.PE'] = DRule(  19.0,  -1.0, 'M2','','EXTL' )
DR['M2.PW'] = DRule(  40.0,  -1.0, 'M2','','EXTW' )
DR['M1.PE'] = DRule(  19.0,  -1.0, 'M2','','EXTL' )
DR['M1.PW'] = DRule(  40.0,  -1.0, 'M2','','EXTW' )
DR['GC.ANT'] = DRule(   0.0,  -1.0, 'GC+GR','','ANT' )
