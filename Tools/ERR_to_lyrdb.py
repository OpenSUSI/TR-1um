#! /usr/bin/env python3
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# TR-1um DRC v0.001 
# Original version was made by jun1okamura from TokaiRika's document 
# LICENSE: Apache License Version 2.0, January 2004,
#          http://www.apache.org/licenses/
# ----- ------ ----- 
#　Reference: https://www.klayout.de/rdb_format.html
#
#  ./ERR_to_lyrdb.py DRC.err OUTPUT.lyrdb
#
import sys
from   xml.dom.minidom import parseString
import xml.etree.ElementTree as ET
import pprint as pp
#
args  = sys.argv
root  = ET.Element('report-database')

if len(args) > 2 :
    ifile = args[1]
    ofile = args[2]
else : 
    ifile = args[1]
    ofile = None
#
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# tag
tag_list = ['waived','red','green','blue','yellow','important']
err_list = []
item_dic = {}

# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# tags
#
def xml_tag( ) :
    #
    child = ET.SubElement(root, 'tags')
    #
    for tag in tag_list :
        ET.SubElement(child, 'tag')
        ET.SubElement(child, 'name').text = '%s' % tag
        ET.SubElement(child, 'description')

# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# categories
#
def xml_category( ) :
    #
    child = ET.SubElement(root, 'categories')
    #
    for cell, err_name in item_dic.keys() :
        category = ET.SubElement(child, 'category')
        ET.SubElement(category, 'name').text = '%s' % err_name
        ET.SubElement(category, 'description')
#        ET.SubElement(category, 'categories')

# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# categories
#
def xml_cell( ) :
    #
    child = ET.SubElement(root, 'cells')
    #
    cell_list = set()
    for cellname, err_name in item_dic.keys() :
        if cellname not in cell_list:
            cell_list.add(cellname)
            cell = ET.SubElement(child, 'cell')
            ET.SubElement(cell, 'name').text = '%s' % cellname
            ET.SubElement(cell, 'layout-name')
            ET.SubElement(cell, 'references')

# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# Items
#
def box2polygon( box ) :
    return( (box[0], box[1], box[0], box[3], box[2], box[3], box[2], box[1]) )

# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# Items
#
def xml_items( ) :
    #
    items = ET.SubElement(root, 'items')
    #
    for err_key, err_data in item_dic.items() :
        cell, err_name = err_key
        for data in err_data :
            item  = ET.SubElement(items, 'item')
            ET.SubElement(item, 'tags')
            ET.SubElement(item, 'category').text = "'%s'" % err_name
            ET.SubElement(item, 'cell').text = '%s' % cell
            ET.SubElement(item, 'visited').text = 'false'
            ET.SubElement(item, 'multiplicity').text = '1'
            ET.SubElement(item, 'comment')
            ET.SubElement(item, 'image')
            values = ET.SubElement(item, 'values')
            # ET.SubElement(values, 'value').text = 'edge: (%-.3f, %-.3f ;%-.3f, %-.3f)' % data 
            ET.SubElement(values, 'value').text = 'polygon: (%-.3f, %-.3f ;%-.3f, %-.3f ;%-.3f, %-.3f ;%-.3f, %-.3f)' % box2polygon( data )

# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# Print head
#
def print_xml( name ) :
    #
    ET.SubElement(root, 'description')
    ET.SubElement(root, 'original-file')
    ET.SubElement(root, 'generator').text = "script='%s'" % name
    ET.SubElement(root, 'top-cell')
    #
    xml_tag( )
    xml_category( )
    xml_cell( )
    xml_items()
    #
    doc = parseString(ET.tostring(root, 'utf-8'))
    doc.writexml(out_file, encoding='utf-8', newl='\n', indent='', addindent='  ')

# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# parse line
#
def parse_line( line ) :
    global SKIP
    global CELL
    global RULE
    global item_dic
    global err_list
    #
    w = line.split()
    if not w : 
        if err_list != [] :
            try:
                item_dic[(CELL, RULE)] = err_list
            except:
                print(f"err_list {err_list}")
            err_list = [] 
        return
    elif w[0][0] == '=' or w[0][0] == '-' :
        return
    elif w[0] == 'Rule' :
        RULE = " ".join(w[4:])
        err_list = []
        SKIP = 2
        return
    elif w[0] == 'Cell' :
        CELL = w[3]
        SKIP = 10
        return
    elif w[0] == 'Shape' :
        SKIP = 2
        return
    elif line[0].isdigit() :  # check first byte of line rather than first byte of first word
        try:
            err_list.append( (float(w[2]),float(w[3]),float(w[4]),float(w[5])) )
        except:
            print(f"Unexpected format: {line}")
        return

# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# Main routine
#
err_file  = open( ifile, "r", encoding="utf8")
#
if ofile == None :
    out_file = sys.stdout
else :
    out_file  = open( ofile, "w", encoding="utf8")
#
# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# READLINE
#
SKIP = 0    # # of Skip lines 
#
while True :
    line = err_file.readline()
    if not line:                # EOF
        break
    elif SKIP > 0 :
        SKIP = SKIP - 1         # SKIP count down
        continue
    #
    else :
        parse_line( line )

# ----- ------ ----- ----- ------ ----- ----- ------ ----- 
# OUTPUT
print_xml( args[0] )

pp.pprint(list(item_dic.keys()), indent=4)
exit
