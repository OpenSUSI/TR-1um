#!/usr/bin/env python3
# ------------------------------------------------------------
# TR-1um DRC v0.001
# Original version was made by jun1okamura from TokaiRika's document
# LICENSE: Apache License Version 2.0, January 2004,
#          http://www.apache.org/licenses/
#
# Usage:
#   ./DR_csv2drc.py ../libs.tech/klayout/drc/run.drc
# ------------------------------------------------------------

import sys
import csv

# ------------------------------------------------------------
# Default files
# ------------------------------------------------------------

IFILE = "../Document/TR-1um_Drawing_Layer_DR_Table.csv"
HFILE = "./DR_csv2drc.head"

# ------------------------------------------------------------
# Translator
# ------------------------------------------------------------

L = {
    "WN": "WN",
    "WN(R)": "WR",
    "WN(C)": "WC",
    "WN(M)": "WN - WC",
    "AP": "AP",
    "AN": "AN",
    "AN(C)": "AN & WC",
    "AN(R)": "AN & WR",
    "AR": "AR",
    "AR(T)": "AR, projection, two_sides_allowed",
    "AR(S)": "AR",
    "AC": "AC",
    "AP+AR": "AP + AR",
    "AP+AC": "AP + AC",
    "AP+AN": "AP + AN",
    "AA+GC+GR": "AA + GC + GR",
    "AP+AN+AC+AR": "AA",
    "AP-GC": "AP - GC",
    "AN-GC": "AN - GC",
    "AP(M)": "AP - DP",
    "AN(M)": "AN - DN",
    "PMOS": "AP & GC",
    "NMOS": "AN & GC",
    "DP": "DP",
    "DN": "DN",
    "GC+GR": "GC + GR",
    "GC": "GC",
    "GC-AP": "GC - AP",
    "GC-AN": "GC - AN",
    "GR": "GR",
    "GC(G)": "GC & AM",
    "GC(R)": "GC & WR",
    "CO": "CO",
    "CO(L)": "CL",
    "CO(S)": "CS",
    "CO(C)": "CO & WC",
    "CO(CC)": "CO & AC",
    "CO(M)": "CO & AM",
    "CO(B)": "CO & BG",
    "CO(G)": "CO & GM",
    "CO(R)": "CO & WR",
    "CO(RR)": "CO & AR",
    "CL(RR)": "CL & AR",
    "CO(D)": "CO & AD",
    "M1": "M1",
    "M1(C)": "M1C",
    "M1(W)": "M1W",
    "V1": "V1 - V1P",
    "V1(P)": "V1P",
    "M2": "M2",
    "Endcap": "Endcap",
    "Bevel": "Bevel",
    "TieDown": "TieDown",
    "RR": "RR",
    "RS": "RS",
    "RR(L)": "AR  - RR",
    "RS(L)": "GR  - RS",
    "RR(W)": "ARW - RR",
    "RS(W)": "RSW - RS",
    "APE": "MPE",
    "ANE": "MNE",
    "PMOSE": "MPE & GC",
    "NMOSE": "MNE & GC",
    "APE-GC": "MPE - GC",
    "ANE-GC": "MNE - GC",
    "GC-APE": "GC - MPE",
    "GC-ANE": "GC - MNE",
    "CO(E)": "COE",
    "CD(E)": "COD",
    "CS(E)": "COS",
    "PO": "PO",
    "V1(P)": "V1P",
    "M1(P)": "M1P",
    "M2(P)": "M2P",
    "": "XXX",
}

# ------------------------------------------------------------
# Print helpers
# ------------------------------------------------------------

def print_Zn(f, rule, func, L1, L2, L3, L4, min, max):
    match L1:
        case "WR" | "WC":
            print(
                "(%-7s).covering(%-5s).output('%-5s:%2s not in %2s')"
                % (L1, L2, rule, L4, L3),
                file=f,
            )
            return
        case "CO" | "PO":
            print(
                "(%2s - ( %-12s )).output('%-5s:%2s not on %s')"
                % (L1, L2, rule, L3, L4),
                file=f,
            )
            return

    match L3:
        case "V1":
            print(
                "((%-7s) - (%-6s)).output('%-5s:%2s not on %s')"
                % (L1, L2, rule, L3, L4),
                file=f,
            )
            return

    print(rule)

Sn_OVERLAP_OK = ["WN.S4", "WN.AP", "WN.AN", "DP.AP", "DN.AN", "GC.AP", "GC.AN", "APE.CO", "ANE.CO", "PO.M1", "PO.M2", "V1.CL"] 

def print_Sn(f, rule, func, L1, L2, L3, L4, min, max):
    if L1 == L2:
        print(
            "(%-7s).drc(             space < %4.1f ).output('%-5s:%2s %s < %4.1f')"
            % (L1, min, rule, L3, func, min),
            file=f,
        )
        return
    elif L3.startswith(L4): # Derived layers spacing to original layers
        print(
            "(%-7s).drc(sep(%-7s, transparent) < %4.1f ).output('%-5s:%2s-%s %s < %4.1f')"
            % (L1, L2, min, rule, L3, L4, func, min),
            file=f,
        )
        return
    else:
        print(
            "(%-7s).drc(      sep(%-7s) < %4.1f ).output('%-5s:%2s-%s %s < %4.1f')"
            % (L1, L2, min, rule, L3, L4, func, min),
            file=f,
        )
        if not (rule in Sn_OVERLAP_OK):
            print(
                "((%-7s) &  (%-7s)                 ).output('%-5s:%2s overlap %s')"
                % (L1, L2, rule, L3, L4),
                file=f,
            )


def print_MX(f, rule, func, L1, L2, L3, L4, min, max):
    match rule:
        case "AC.W1" | "CR.W2":
            print(
                "(%-7s).drc(           width <  %5.1f ).output('%-5s:%2s Wmin < %5.1f')"
                % (L1, min, rule, L3, min),
                file=f,
            )
            print(
                "(%-7s).drc(           width >  %5.1f ).output('%-5s:%2s Wmax > %5.1f')"
                % (L1, max, rule, L3, max),
                file=f,
            )
            return
        case "GR.W1" | "AR.W1":
            print("# ----- RES(W) -----", file=f)
            print(
                "(%-7s).sep((%-7s), 0.1, projection, projecting < %5.1f ).output('%-5s:%2s Wmin < %5.1f')"
                % (L1, L2, min, rule, L3, min),
                file=f,
            )
            print(
                "(%-7s).sep((%-7s), 0.1, projection, projecting > %5.1f ).output('%-5s:%2s Wmax > %5.1f')"
                % (L1, L2, max, rule, L3, max),
                file=f,
            )
            print("# ", file=f)
            return
        case "GR.L1" | "AR.L1":
            print("# ----- RES(L) -----", file=f)
            print(
                "(%-7s).sep((%-7s), 0.1, projection, projecting < %5.1f ).output('%-5s:%2s Lmin < %5.1f')"
                % (L1, L2, min, rule, L3, min),
                file=f,
            )
            print(
                "(%-7s).sep((%-7s), 0.1, projection, projecting > %5.1f ).output('%-5s:%2s Lmax > %5.1f')"
                % (L1, L2, max, rule, L3, max),
                file=f,
            )
            print("# ", file=f)
            return
        case "AP.WM" | "AN.WM" | "APE.WM" | "ANE.WM":
            print("# ----- MOS(W) -----", file=f)
            print(
                "(%-7s).sep((%-7s), 0.1, projection, projecting < %5.1f ).output('%-5s:%2s Wmin < %5.1f')"
                % (L1, L2, min, rule, L3, min),
                file=f,
            )
            print(
                "(%-7s).sep((%-7s), 0.1, projection, projecting > %5.1f ).output('%-5s:%2s Wmax > %5.1f')"
                % (L1, L2, max, rule, L3, max),
                file=f,
            )
            print("# ", file=f)
            return
        case "AP.LM" | "AN.LM" | "APE.LM" | "ANE.LM":
            print("# ----- MOS(L) -----", file=f)
            print(
                "(%-7s).sep((%-7s), 0.1, projection, projecting < %5.1f ).output('%-5s:%2s Lmin < %5.1f')"
                % (L1, L2, min, rule, L3, min),
                file=f,
            )
            print(
                "(%-7s).sep((%-7s), 0.1, projection, projecting > %5.1f ).output('%-5s:%2s Lmax > %5.1f')"
                % (L1, L2, max, rule, L3, max),
                file=f,
            )
            print("# ", file=f)
            return

    print(rule, func)

# ------------------------------------------------------------
# Generate one DRC line
# ------------------------------------------------------------

def gen_drc(f, rule, func, L1, L2, L3, L4, min, max):
    match func:
        case "None":
            print_Zn(f, rule, func, L1, L2, L3, L4, min, max)
            return
        case "Exist":
            print(
                "(%-7s).not_covering(%-5s).output('%-5s:%2s not_covering %2s')"
                % (L1, L2, rule, L4, L3),
                file=f,
            )
            return
        case "Wmin":
            print(
                "(%-7s).drc(             width < %4.1f ).output('%-5s:%2s %s < %4.1f')"
                % (L1, min, rule, L3, func, min),
                file=f,
            )
            return
        case "Wfix":
            print(
                "(%-7s).drc(             width < %4.1f ).output('%-5s:%2s %s < %4.1f')"
                % (L1, min, rule, L3, func, min),
                file=f,
            )
            print(
                "(%-7s).drc(          bbox_min < %4.1f ).output('%-5s:%2s bbox_min < %4.1f')"
                % (L1, min, rule, L3, min),
                file=f,
            )
            print(
                "(%-7s).drc(          bbox_max > %4.1f ).output('%-5s:%2s bbox_max > %4.1f')"
                % (L1, min, rule, L3, min),
                file=f,
            )
            return
        case "Wmin/max" | "Lmin/max":
            print_MX(f, rule, func, L1, L2, L3, L4, min, max)
            return
        case "Smin":
            print_Sn(f, rule, func, L1, L2, L3, L4, min, max)
            return
        case "Sfix":
            print(
                "(%-7s).drc(     sep(%-7s) != %4.1f ).output('%-5s:%2s-%s %s != %4.1f')"
                % (L1, L2, min, rule, L3, L4, func, min),
                file=f,
            )
            return
        case "Emin":
            print(
                "(%-7s).drc( enclosed(%-7s) < %4.1f ).output('%-5s:%2s-%s %s < %4.1f')"
                % (L1, L2, min, rule, L3, L4, func, min),
                file=f,
            )
            return
        case "Efix":
            print(
                "(%-7s).drc(enclosed(%-7s) != %4.1f ).output('%-5s:%2s-%s %s != %4.1f')"
                % (L1, L2, min, rule, L3, L4, func, min),
                file=f,
            )
            return
        case "Fmin":
            print(
                "(%-7s).drc(enclosing(%-7s) < %4.1f ).output('%-5s:%2s-%s %s < %4.1f')"
                % (L1, L2, min, rule, L3, L4, func, min),
                file=f,
            )
            return
        case "ECmin":
            print("# ----- MOS(EndCap) -----", file=f)
            print(
                "(%-7s).drc( enclosed(%2s, projection, without_touching_edges ) < %4.1f).output('%-5s:%2s Endcap < %4.1f')"
                % (L1, L2, min, rule, L3, min),
                file=f,
            )
            print("# ", file=f)
            return
        case "Donut":
            print("# ----- Surrounded -----", file=f)
            print(
                "(%-2s - (%-7s).holes                   ).output('%-5s:%2s must surrounded %s')"
                % (L1, L2, rule, L3, L4),
                file=f,
            )
            print("# ", file=f)
            return
        case "TieDown":
            print("# ----- TieDown -----", file=f)
            print(
                "((%-7s) - antenna_check((%-2s), GC, 0.0)).output('%-5s:%2s must tie down to %s')"
                % (L1, L2, rule, L3, L4),
                file=f,
            )
            print("# ", file=f)
            return
        case "ANTE":
            print("# ----- Floating Gate -----", file=f)
            print(
                "( GC_FL ).output('%-5s:%2s must electrically connect to Substrate')"
                % (rule, L3),
                file=f,
            )
            print("# ", file=f)
            return
        case "XYmin":
            print("# ----- Beveling -----", file=f)
            print(
                "(%-7s).drc( primary.edges.count != 8 ).output('%-5s:%2s shape NOT Octagon')"
                % (L1, rule, L3),
                file=f,
            )
            print(
                "(%-2s.extents - %2s).drc(       area < %4.2f ).output('%-5s:%2s trimed corner size < %4.2f')"
                % (L1, L1, (min ** 2) / 2, rule, L3, (min ** 2) / 2),
                file=f,
            )
            print("# ", file=f)
            return

    print(rule, func)

# ------------------------------------------------------------
# Read one CSV row
# ------------------------------------------------------------

def read_line(f, row):
    if row[0] == "#":
        print("# ----- ----- ----- ----- ----- ----- ----- ----- ", file=f)
        print("# NOTICE: THIS IS AUTO-GENERATED by DRC_csv2drc.py", file=f)
        print("# NOTICE: DO NOT EDIT DIRECTLY", file=f)
        print("# ----- ----- ----- ----- ----- ----- ----- ----- ", file=f)
        print("# %-s" % row[1], file=f)
        print("#", file=f)

    elif row[0] == "Rule":
        return

    elif row[4] == "???":
        return

    else:
        rule = row[0].replace(" ", "")
        L1 = L[row[1].replace(" ", "")]
        L2 = L[row[2].replace(" ", "")]
        L3 = row[1].replace(" ", "")
        L4 = row[2].replace(" ", "")
        func = row[3].replace(" ", "")

        min = float(row[4])
        if row[5] == "":
            max = -1.0
        else:
            max = float(row[5])

        gen_drc(f, rule, func, L1, L2, L3, L4, min, max)
        return

# ------------------------------------------------------------
# Print header
# ------------------------------------------------------------

def print_head(ifile, ofile):
    head = ifile.read()
    print("%s" % head, file=ofile)

# ------------------------------------------------------------
# Main
# ------------------------------------------------------------

def main():
    args = sys.argv

    if len(args) > 1:
        ofile = args[1]
    else:
        ofile = None

    head_file = open(HFILE, "r", encoding="utf8")
    csv_file = open(IFILE, "r", encoding="utf8")

    if ofile is None:
        drc_file = sys.stdout
    else:
        drc_file = open(ofile, "w", encoding="utf8")

    print_head(head_file, drc_file)

    reader = csv.reader(
        csv_file,
        delimiter=",",
        doublequote=True,
        lineterminator="\r\n",
        quotechar='"',
        skipinitialspace=True,
    )

    for row in reader:
        if row[0] != "":
            read_line(drc_file, row)

    head_file.close()
    csv_file.close()
    drc_file.close()


if __name__ == "__main__":
    main()
