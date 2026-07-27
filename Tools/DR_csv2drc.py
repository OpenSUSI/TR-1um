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
    "WN(R)": "WR",
    "WN(C)": "WC",
    "WN(M)": "WN - WC",
    "AN(C)": "AN & WC",
    "AN(R)": "AN & WR",
    "AN(T)": "ANT",
    "AP(T)": "APT",
    "AR(T)": "ART",
    "AR(S)": "AR",
    "AP+AR": "AP + AR",
    "AP+AC": "AP + AC",
    "AP+AN": "AP + AN",
    "AA+GC+GR": "AA + GC + GR",
    "AP+AN+AC+AR": "AA",
    "AP-GC": "AP - GC",
    "AN-GC": "AN - GC",
    "AP(M)": "AP - DP",
    "AN(M)": "AN - DN",
    "ARN(S)": "ARNS",
    "ARW(S)": "ARWS",
    "PMOS": "AP & GC - ESD",
    "NMOS": "AN & GC - ESD",
    "GC+GR": "GC + GR",
    "GC-AP": "GC - AP",
    "GC-AN": "GC - AN",
    "GC(G)": "GC & AM",
    "GC(R)": "GC & WR",
    "GR(S)": "GRS",
    "CO(L)": "CL",
    "CO(S)": "CS",
    "CO(C)": "CO & WC",
    "CO(CC)": "CO & AC",
    "CO(M)": "COM",
    "CO(B)": "CO & BGM",
    "CO(R)": "CO & WR",
    "CO(RR)": "CO & AR",
    "CO(RRN)": "CO & AR.covering(RRN)",
    "CO(RRW)": "CO & AR.covering(RRW)",
    "CO(RS)": "CR & GR",
    "CO(RSM)": "CRS",
    "CL(RR)": "CL & AR",
    "CO(RS)": "CO & GR",
    "CO(D)": "CO & AD",
    "M1(C)": "M1C",
    "M1(W)": "M1W",
    "V1": "V1 - V1P",
    "V1(P)": "V1P",
    "Endcap": "Endcap",
    "Bevel": "Bevel",
    "TieDown": "TieDown",
    "RR(W)": "AR  - RR",
    "RS(W)": "GR  - RS",
    "RR(L)": "ARW - RR",
    "RS(L)": "RSW - RS",
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
    "V1(P)": "V1P",
    "M1(P)": "M1P",
    "M2(P)": "M2P",
    "": "XXX",
}

# ------------------------------------------------------------
# Print helpers
# ------------------------------------------------------------

def print_Zn(f, rule, func, L1, L2, L3, L4, min, max):
    match func:
        case "Prohibit":
            print(
                "((%-7s) & (%-7s)).output('%-5s:%2s over %2s')"
                % (L1, L2, rule, L4, L3),
                file=f,
            )
            return
        case "Require":
            print(
                "((%-7s) - (%-7s)).output('%-5s:%2s outside %s')"
                % (L1, L2, rule, L3, L4),
                file=f,
            )
            return
        case "Contain":
            print(
                "((%-7s).not_covering(%-6s)).output('%-5s:%2s without %s')"
                % (L1, L2, rule, L3, L4),
                file=f,
            )
            return

    print(rule)

Sn_OVERLAP_OK = ["WN.S4", "WN.AP", "WN.AN", "DP.AP", "DN.AN", "GC.AP", "GC.AN", "APE.CO", "ANE.CO", "V1.CL"] 
Sn_CROSS_NG = ["WN.AP", "WN.AN", "APE.CO", "ANE.CO", "V1.CL"] 

def print_Sn(f, rule, func, L1, L2, L3, L4, min, max):
    if L1 == L2:
        print(
            "(%-7s).drc(             space < %4.1f ).output('%-5s:%2s %s < %4.1f')"
            % (L1, min, rule, L3, func, min),
            file=f,
        )
        return
    elif rule == "M1.SW": # wide metal1 rule
        print(
            "(%-7s).space(%-4.1f).polygons.raw.interacting(%-7s).output('%-5s:%2s-%s %s < %4.1f')"
            % (L2, min, L1, rule, L3, L4, func, min),
            file=f,
        )
        return
    elif L3.startswith(L4) or rule.startswith("PO.M"): # Derived layers spacing to original layers
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
                "((%-7s) & (%-7s)                  ).output('%-5s:%2s overlap %s')"
                % (L1, L2, rule, L3, L4),
                file=f,
            )
        elif rule in Sn_CROSS_NG:
            print(
                "((%-7s).overlapping(%-7s).not_inside(%-7s)).output('%-5s:%2s overlap %s')"
                % (L2, L1, L1, rule, L3, L4),
                file=f,
            )


def print_MX(f, rule, func, L1, L2, L3, L4, min, max):
    rule_heading = ""
    match rule:
        case "AC.W1":
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
        case "CR.W2":
            print(
                "(%-7s).drc(         bbox_max < %5.1f ).output('%-5s:%2s Lmin < %5.1f')"
                % (L1, min, rule, L3, min),
                file=f,
            )
            print(
                "(%-7s).drc(         bbox_max > %5.1f ).output('%-5s:%2s Lmax > %5.1f')"
                % (L1, max, rule, L3, max),
                file=f,
            )
            return
        case "GR.W1" | "AR.W1":
            rule_heading = "RES(W)"
            min_check = "Wmin"
            max_check = "Wmax"
        case "GR.L1" | "AR.L1":
            rule_heading = "RES(L)"
            min_check = "Lmin"
            max_check = "Lmax"
        case "AP.WM" | "AN.WM" | "APE.WM" | "ANE.WM":
            rule_heading = "MOS(W)"
            min_check = "Wmin"
            max_check = "Wmax"
        case "AP.LM" | "AN.LM" | "APE.LM" | "ANE.LM":
            rule_heading = "MOS(L)"
            min_check = "Lmin"
            max_check = "Lmax"

    if rule_heading:
        print("# ----- %s -----" % (rule_heading), file=f)
        print(
            "(%-7s).sep((%-7s), 0.1, projection, projecting < %5.1f ).output('%-5s:%2s %s < %5.1f')"
            % (L1, L2, min, rule, L3, min_check, min),
            file=f,
        )
        print(
            "(%-7s).sep((%-7s), 0.1, projection, projecting > %5.1f ).output('%-5s:%2s %s > %5.1f')"
            % (L1, L2, max, rule, L3, max_check, max),
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
        case "Prohibit" | "Require" | "Contain":
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
            if rule in ["CO.SM", "COE.SE"]:
                print(
                    "(%-7s).drc(     sep(%-7s) < %4.1f ).output('%-5s:%2s-%s %s < %4.1f')"
                    % (L1, L2, min, rule, L3, L4, func, min),
                    file=f,
                )
                print(
                    "(%-7s).not_interacting((%s_e + %s_s).raw, 2).output('%-5s:%2s-%s %s != %4.1f or off-center/missing %s')"
                    % (L2, L1, L1, rule, L3, L4, func, max, L3),
                    file=f,
                )
            elif rule in ["CO.GG", "CDE.GC", "CSE.GC"]:
                print(
                    "(%-7s).drc(     sep(%-7s) < %4.1f ).output('%-5s:%2s-%s %s < %4.1f')"
                    % (L1, L2, min, rule, L3, L4, func, min),
                    file=f,
                )
                print(
                    "(%s_ext%d - (%s_e + %s_s + %s).edges).output('%-5s:%2s-%s %s != %4.1f or off-center/missing %s')"
                    % (L2, int(min), L1, L1, L1, rule, L3, L4, func, min, L3),
                    file=f,
                )
            else:
                print(
                    "(%-7s).drc(     sep(%-7s) != %4.1f ).output('%-5s:%2s-%s %s != %4.1f')"
                    % (L1, L2, min, rule, L3, L4, func, min),
                    file=f,
                )
            return
        case "Emin/max":
            print(
                "(%-7s).drc( enclosed(%-7s) < %4.1f ).output('%-5s:%2s-%s Emin < %4.1f')"
                % (L1, L2, min, rule, L3, L4, min),
                file=f,
            )
            print(
                "(%-7s).drc( enclosed(%-7s) > %4.1f ).output('%-5s:%2s-%s Emax > %4.1f')"
                % (L1, L2, max, rule, L3, L4, max),
                file=f,
            )
            return
        case "Emin":
            if rule in ["CR.AT", "COE.APT", "COE.ANT"]:
                print(
                    "(%-7s).edges.enclosed((%-7s), %4.1f, projection).output('%-5s:%2s-%s %s < %4.1f')"
                    % (L1, L2, min, rule, L3, L4, func, min),
                    file=f,
                )
            else:
                print(
                    "(%-7s).drc( enclosed(%-7s) < %4.1f ).output('%-5s:%2s-%s %s < %4.1f')"
                    % (L1, L2, min, rule, L3, L4, func, min),
                    file=f,
                )
            return
        case "Efix":
            if rule == "AC.GC":
                print(
                    "(%-7s).drc(enclosed(%-7s) != %4.1f ).output('%-5s:%2s-%s %s != %4.1f')"
                    % (L1, L2, min, rule, L3, L4, func, min),
                    file=f,
                )
                return
            else:
                print(
                    "(%-7s).edges.not_interacting((%-7s).extended_in(%4.1f).edges).output('%-5s:%2s-%s %s != %4.1f')"
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
#        case "ECmin":
#            print("# ----- MOS(EndCap) -----", file=f)
#            print(
#                "(%-7s).drc( enclosed(%2s, projection, without_touching_edges ) < %4.1f).output('%-5s:%2s Endcap < %4.1f')"
#                % (L1, L2, min, rule, L3, min),
#                file=f,
#            )
#            print("# ", file=f)
#            return
        case "Rect":
            if max > 0:
                print_MX(f, rule, "Wmin/max", L1, L2, L3, L4, min, max)
            elif min > 0:
                print(
                    "(%-7s).drc(             width < %4.1f ).output('%-5s:%2s %s < %4.1f')"
                    % (L1, min, rule, L3, "Wmin", min),
                    file=f,
                )
            print(
                "(%-7s).non_rectangles.output('%-5s:%2s must be a rectangle')"
                % (L1, rule, L3),
                file=f,
            )
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
                "(%-2s.extents - %2s).drc(       area < %4.2f ).output('%-5s:%2s trimmed corner size < %4.2f')"
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
        L3 = row[1].replace(" ", "")
        L4 = row[2].replace(" ", "")
        L1 = L[L3] if L3 in L else L3 # no longer need to define A = A
        L2 = L[L4] if L4 in L else L4 # no longer need to define A = A
        func = row[3].replace(" ", "")

        min = float(row[4]) if row[4] != "" else -1.0
        max = float(row[5]) if row[5] != "" else -1.0

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
