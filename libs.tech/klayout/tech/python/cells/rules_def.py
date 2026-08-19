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
        self.L2   = L2
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

DR['WN.W1'] = DRule(   8.0,  -1.0, 'WN','','Wmin' )
DR['WN.S1'] = DRule(   4.0,  -1.0, 'WN','WN','Smin' )
DR['WN.N1'] = DRule(   7.0,  -1.0, 'WN','WN','Nmin' )
DR['WN.S2'] = DRule(   9.5,  -1.0, 'WN(R)','WN(M)','Smin' )
DR['WN.S3'] = DRule(  12.0,  -1.0, 'WN(C)','WN(M)','Smin' )
DR['WN.S4'] = DRule(   9.5,  -1.0, 'WN(R)','WN(C)','Smin' )
DR['WN.S5'] = DRule(   8.0,  -1.0, 'WN(R)','WN(R)','Smin' )
DR['WN.S6'] = DRule(  12.0,  -1.0, 'WN(C)','WN(C)','Smin' )
DR['WN.S7'] = DRule(  12.0,  -1.0, 'WN(M)','WN(M)','Smin' )
DR['WN.AP'] = DRule(   5.0,  -1.0, 'WN','AP','Smin' )
DR['WN.AN'] = DRule(  10.0,  -1.0, 'WN','AN','Smin' )
DR['AR.S1'] = DRule(   4.0,  -1.0, 'AR ','AR','Smin' )
DR['AR.WR'] = DRule(  10.0,  -1.0, 'AR','WN(R)','Emin' )
DR['AN.WR'] = DRule(  10.0,  -1.0, 'AN','WN(R)','Emin' )
DR['AR.AN'] = DRule(   4.0,  -1.0, 'AR','AN','Smin' )
DR['AC.W1'] = DRule(  28.5, 120.0, 'AC','','Rect' )
DR['AC.S1'] = DRule(   6.4,  -1.0, 'AC','AC','Smin' )
DR['AC.WC'] = DRule(   8.0,  -1.0, 'AC','WN(C)','Emin' )
DR['AN.WC'] = DRule(   3.0,  -1.0, 'AN','WN(C)','Emin' )
DR['AC.AN'] = DRule(   2.8,   2.8, 'AC','AN','Sfix' )
DR['AC.GC'] = DRule(   1.4,   1.4, 'AC','GC','Efix' )
DR['AC.R1'] = DRule(   0.0,  -1.0, 'AC','AN(C)','Donut' )
DR['AP.W1'] = DRule(   1.4,  -1.0, 'AP','','Wmin' )
DR['AP.S1'] = DRule(   1.4,  -1.0, 'AP','AP','Smin' )
DR['AP.AN'] = DRule(   2.8,  -1.0, 'AP','AN','Smin' )
DR['AP.WM'] = DRule(   3.4,  60.0, 'PMOS','AP-GC','Wmin/max' )
DR['AP.LM'] = DRule(   1.0,  30.0, 'PMOS','GC-AP','Lmin/max' )
DR['AP.WN'] = DRule(   7.0,  -1.0, 'AP','WN','Emin' )
DR['DP.W1'] = DRule(   3.6,  -1.0, 'DP','','Wmin' )
DR['DP.S1'] = DRule(   1.4,  -1.0, 'DP','DP','Smin' )
DR['DP.AP'] = DRule(   2.8,  -1.0, 'DP','AP(M)','Smin' )
DR['DP.AN'] = DRule(   2.8,  -1.0, 'DP','AN','Smin' )
DR['AN.W1'] = DRule(   1.4,  -1.0, 'AN','','Wmin' )
DR['AN.S1'] = DRule(   1.4,  -1.0, 'AN','AN','Smin' )
DR['AN.AP'] = DRule(   2.8,  -1.0, 'AN','AP','Smin' )
DR['AN.WM'] = DRule(   3.4,  60.0, 'NMOS','AN-GC','Wmin/max' )
DR['AN.LM'] = DRule(   1.0,  30.0, 'NMOS','GC-AN','Lmin/max' )
DR['AN.WN'] = DRule(   5.0,  -1.0, 'AN','WN(M)','Emin' )
DR['DN.W1'] = DRule(   3.6,  -1.0, 'DN','','Wmin' )
DR['DN.S1'] = DRule(   1.4,  -1.0, 'DN','DN','Smin' )
DR['DN.AP'] = DRule(   2.8,  -1.0, 'DN','AP','Smin' )
DR['DN.AN'] = DRule(   2.8,  -1.0, 'DN','AN(M)','Smin' )
DR['GC.W1'] = DRule(   1.0,  -1.0, 'GC','','Wmin' )
DR['GC.S1'] = DRule(   1.2,  -1.0, 'GC','GC','Smin' )
DR['GC.GR'] = DRule(   1.2,  -1.0, 'GC','GR','Smin' )
DR['GA.AP'] = DRule(   0.4,  -1.0, 'GA','AP','Smin' )
DR['GA.AN'] = DRule(   0.4,  -1.0, 'GA','AN','Smin' )
DR['GC.EP'] = DRule(   1.2,  -1.0, 'AP','GC','Emin' )
DR['GC.EN'] = DRule(   1.2,  -1.0, 'AN','GC','Emin' )
DR['GC.E2'] = DRule(   2.4,  -1.0, 'AM','GC','ECmin' )
DR['CO.W1'] = DRule(   1.0,  97.0, 'CO','','Rect' )
DR['CO.WM'] = DRule(   1.0,   1.0, 'CO(M)','','Wfix' )
DR['CO.WB'] = DRule(   1.0,   1.0, 'CO(B)','','Wfix' )
DR['CO.S1'] = DRule(   1.0,  -1.0, 'CO','CO','Smin' )
DR['CO.CL'] = DRule(   1.6,  -1.0, 'CO(L)','CO','Smin' )
DR['CO.SM'] = DRule(   1.0,   1.0, 'CO(M)','CO(M)','Sfix' )
DR['CO.WD'] = DRule(   1.2,   1.2, 'CO(D)','','Wfix' )
DR['CO.SD'] = DRule(   1.2,  -1.0, 'CO(D)','CO','Smin' )
DR['CO.AD'] = DRule(   1.2,  -1.0, 'CO(D)','AP+AN','Emin' )
DR['CO.AP'] = DRule(   0.8,  -1.0, 'CO','AP','Emin' )
DR['CO.AN'] = DRule(   0.8,  -1.0, 'CO','AN','Emin' )
DR['CO.GG'] = DRule(   1.0,   1.0, 'CO(M)','GC','Sfix' )
DR['CO.GC'] = DRule(   0.8,  -1.0, 'CO','GC+GR','Emin' )
DR['AR.W1'] = DRule(   2.8,  20.0, 'RR','RR(W)','Wmin/max' )
DR['AR.L1'] = DRule(  13.0, 100.0, 'RR','RR(L)','Lmin/max' )
DR['AR.GC'] = DRule(   1.0,  -1.0, 'AR','GC','Sfix' )
DR['AR.PW'] = DRule(   2.0,  -1.0, 'GC(R)','','Wmin' )
DR['AR.XY'] = DRule(   1.0,  -1.0, 'AR','Bevel','XYmin' )
DR['GC.R1'] = DRule(   0.0,  -1.0, 'AR','GC(R)','Donut' )
DR['GC.R2'] = DRule(   0.0,  -1.0, 'GC(R)','WN(R)','TieDown' )
DR['GR.W1'] = DRule(   4.0,  20.0, 'RS','RS(W)','Wmin/max' )
DR['GR.L1'] = DRule(  20.0, 100.0, 'RS','RS(L)','Lmin/max' )
DR['GR.S1'] = DRule(   2.0,  -1.0, 'RS','RS','Smin' )
DR['GR.AP'] = DRule(   2.8,  -1.0, 'GR','AP','Smin' )
DR['GR.AN'] = DRule(   2.8,  -1.0, 'GR','AN','Smin' )
DR['CR.W1'] = DRule(   1.0,  -1.0, 'CO(RR)','','Wmin' )
DR['CR.W2'] = DRule(   1.6,  17.6, 'CO(RRW)','','Lmin/max' )
DR['CR.W3'] = DRule(   1.0,   1.0, 'CO(RRN)','','Wfix' )
DR['CR.AR'] = DRule(   0.8,  -1.0, 'CO(RR)','AR','Emin' )
DR['CR.AT'] = DRule(   1.5,  -1.0, 'CO(RR)','AR(T)','Emin' )
DR['CR.ASN'] = DRule(   0.9,  -1.0, 'CO(RRN)','ARN(S)','Efix' )
DR['CR.ASW'] = DRule(   1.2,  -1.0, 'CO(RRW)','ARW(S)','Efix' )
DR['CC.W1'] = DRule(   1.2,   1.2, 'CO(C)','','Wfix' )
DR['CC.S1'] = DRule(   1.2,   1.2, 'CO(C)','CO(C)','SFIX' )
DR['CO.SC'] = DRule(   1.2,  -1.0, 'CO(C)','CO','Smin' )
DR['CC.AC'] = DRule(   2.9,  -1.0, 'CO(C)','AC','Emin' )
DR['CC.AN'] = DRule(   1.2,  -1.0, 'CO(C)','AN','Emin' )
DR['CS.S1'] = DRule(   1.0,   1.0, 'CO(RS)','CO(RS)','SFIX' )
DR['CO.GR'] = DRule(   0.8,  -1.0, 'CO','GR','Emin' )
DR['CO.GS'] = DRule(   1.5,   1.5, 'CO(RSM)','GR(S)','Efix' )
DR['M1.W1'] = DRule(   1.8,  -1.0, 'M1','','Wmin' )
DR['M1.W2'] = DRule(  10.0,  -1.0, 'M1(W)','','WMIN' )
DR['M1.S1'] = DRule(   1.4,  -1.0, 'M1','M1','Smin' )
DR['M1.SC'] = DRule(  10.0,  10.0, 'ANC','M1C','Smin/Smax' )
DR['M1.CO'] = DRule(   0.8,  -1.0, 'M1','CO','Fmin' )
DR['M1.CC'] = DRule(   1.3,  -1.0, 'M1','CO(CC)','Fmin' )
DR['M1.CL'] = DRule(   1.2,  -1.0, 'M1','CO(L)','Fmin' )
DR['M1.SW'] = DRule(   2.0,  -1.0, 'M1(W)','M1','Smin' )
DR['V1.W1'] = DRule(   1.4,   1.4, 'V1(S)','','Wfix' )
DR['V1.WP'] = DRule(  60.0,  -1.0, 'V1(P)','','Wmin' )
DR['V1.S1'] = DRule(   1.5,  -1.0, 'V1','V1','Smin' )
DR['V1.M1'] = DRule(   1.0,  -1.0, 'V1','M1','Emin' )
DR['V1.GA'] = DRule(   1.2,  -1.0, 'V1','GA','Smin' )
DR['V1.CO'] = DRule(   1.0,  -1.0, 'V1','CO','Smin' )
DR['V1.CL'] = DRule(   1.4,  -1.0, 'V1','CO(L)','Smin' )
DR['M2.W1'] = DRule(   3.0,  -1.0, 'M2','','Wmin' )
DR['M2.S1'] = DRule(   2.0,  -1.0, 'M2','M2','Smin' )
DR['M2.V1'] = DRule(   1.0,  -1.0, 'M2','V1','Fmin' )
DR['M1.SCR'] = DRule(   5.0,  -1.0, 'M1(S)','M1','Smin' )
DR['M2.SCR'] = DRule(   5.0,  -1.0, 'M2(S)','M2','Smin' )
DR['APE.WM'] = DRule(  11.0,  60.0, 'PMOSE','APE-GC','Wmin/max' )
DR['APE.LM'] = DRule(   2.0,  30.0, 'PMOSE','GC-APE','Lmin/max' )
DR['APE.AN'] = DRule(  10.0,  -1.0, 'APE','AN','Smin' )
DR['APE.XY'] = DRule(   1.4,  -1.0, 'APE','Bevel','XYmin' )
DR['APE.CO'] = DRule(   2.0,  -1.0, 'APE','CO','Smin' )
DR['ANE.WM'] = DRule(  11.0,  60.0, 'NMOSE','ANE-GC','Wmin/max' )
DR['ANE.LM'] = DRule(   2.0,  30.0, 'NMOSE','GC-ANE','Lmin/max' )
DR['ANE.AP'] = DRule(  10.0,  -1.0, 'ANE','AP','Smin' )
DR['ANE.XY'] = DRule(   1.4,  -1.0, 'ANE','Bevel','XYmin' )
DR['ANE.CO'] = DRule(   2.0,  -1.0, 'ANE','CO','Smin' )
DR['COE.W1'] = DRule(   3.0,   3.0, 'CO(E) ','','Wfix' )
DR['COE.S1'] = DRule(   1.6,  -1.0, 'CO(E) ','CO','Smin' )
DR['COE.SE'] = DRule(   1.6,   1.6, 'CO(E) ','CO(E)','Sfix' )
DR['CDE.GC'] = DRule(   7.0,  -1.0, 'CD(E)','GC','Sfix' )
DR['CSE.GC'] = DRule(   3.0,  -1.0, 'CS(E)','GC','Sfix' )
DR['COE.AP'] = DRule(   2.5,  -1.0, 'CO(E) ','AP','Emin' )
DR['COE.AN'] = DRule(   2.5,  -1.0, 'CO(E) ','AN','Emin' )
DR['COE.APT'] = DRule(   4.0,  -1.0, 'CO(E) ','AP(T)','Emin' )
DR['COE.ANT'] = DRule(   4.0,  -1.0, 'CO(E) ','AN(T)','Emin' )
DR['PO.W1'] = DRule(  10.0,  -1.0, 'PO','','Rect' )
DR['PO.S1'] = DRule(  20.0,  -1.0, 'PO','PO','Smin' )
DR['PP.W1'] = DRule(  70.0,  -1.0, 'PP','','Wmin' )
DR['PP.S1'] = DRule(  64.0,  -1.0, 'PP','PP','Smin' )
DR['M1.PO'] = DRule(  10.0,  -1.0, 'M1','PO','Fmin' )
DR['M2.PO'] = DRule(  10.0,  -1.0, 'M2','PO','Fmin' )
DR['M1.V1P'] = DRule(  15.0,  -1.0, 'M1','V1(P)','Fmin' )
DR['M2.V1P'] = DRule(  15.0,  -1.0, 'M2','V1(P)','Fmin' )
DR['M1P.AA'] = DRule(  14.0,  -1.0, 'M1(P)','AA','Smin' )
DR['M2P.AA'] = DRule(  14.0,  -1.0, 'M2(P)','AA','Smin' )
DR['M1P.GA'] = DRule(  14.0,  -1.0, 'M1(P)','GA','Smin' )
DR['M2P.GA'] = DRule(  14.0,  -1.0, 'M2(P)','GA','Smin' )
DR['M1P.M1'] = DRule(  14.0,  -1.0, 'M1(P)','M1','Smin' )
DR['M2P.M2'] = DRule(  14.0,  -1.0, 'M2(P)','M2','Smin' )
DR['M1P.PE'] = DRule(  14.0,  40.0, 'M1(P)','M1','Ext' )
DR['M2P.PE'] = DRule(  14.0,  40.0, 'M2(P)','M2','Ext' )
DR['M2.PW'] = DRule(  40.0,  -1.0, 'M2','','EXTW' )
DR['M1.PW'] = DRule(  40.0,  -1.0, 'M2','','EXTW' )
DR['GC.ANT'] = DRule(   0.0,  -1.0, 'GC','','ANTE' )
