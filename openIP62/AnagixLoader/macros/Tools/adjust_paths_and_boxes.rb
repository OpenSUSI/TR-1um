module MyMacro
  include RBA

class AdjustPaths
  include RBA

  def adjust_paths cell, args
    return if cell.is_library_cell
    puts "*** Adjust Paths for '#{cell.name}"
    layout = cell.layout
    path_layer = layer_index(args[:path_layer])
    layout.layer_indexes.each{|layer|
      source_layer = layout.get_info(layer).layer
      next if path_layer && source_layer != -1 && path_layer != source_layer 
      paths = 0
      cell.shapes(layer).each{|shape|
        if shape.is_path?
          path = shape.path
          # path.width = [(path.width*args[:path_scale]).to_i, args[:path_min]].max
          path.width = (path.width*args[:path_scale]).to_i
          path.width = args[:path_min] if args[:path_min]  && path.width < args[:path_min]
          shape.path = path if args[:path_max] && path.width < args[:path_max]
          paths = paths + 1
        elsif shape.is_box?
          box = shape.box
          if path = box2path(box, args)
            shape.path = path
          end
        end
      }
      puts "paths=#{paths} for layer:#{args[:path_layer]}" if paths>0
    }

    child_cells = []
    cell.each_child_cell{|id| child_cells << id}
    child_cells.each{|id|
      c = cell.layout.cell(id)
      #puts c.name
      adjust_paths c, args
    }
  end
  def current_cellview
    app = RBA::Application.instance
    mw = app.main_window
    lv = mw.current_view
    if lv == nil
      raise "No view selected"
    end
    cv = lv.active_cellview
    if !cv.is_valid?
      raise "No cell or no layout found"
    end
    layout = cv.layout
    @grid ||= app.get_config('grid-micron').to_f
    @grid_db = (@grid/layout.dbu.round(3)).to_i
    puts "grid_db = #{@grid_db}"
    [cv, lv]
  end
  def box2path box, args
    x1, y1 = [box.p1.x, box.p1.y]
    x2, y2 = [box.p2.x, box.p2.y]
    if x2 - x1 > y2 - y1
      return nil if y2 - y1 > args[:path_max]
      spine = [Point.new(x1, (y1+y2)/2), Point.new(x2, (y1+y2)/2)]
      width = y2 - y1
    else
      return nil if x2 - x1 > args[:path_max]
      spine = [Point.new(y1, (x1+x2)/2), Point.new(y2, (x1+x2)/2)]
      width = x2 - x1
    end
    # Path.new spine, [(width*args[:path_scale]).to_i, args[:path_min]].max
       width = (width*args[:path_scale]).to_i
       width = args[:path_min] if args[:path_min]  && width < args[:path_min]
       Path.new spine, width
  end
  
  def layer_index name
    @layer_index[name][0]
  end
  
  def do_adjust_paths
    cv, lv = current_cellview()
    layout = cv.layout
    tech = layout.technology
    lyp_file = File.join(tech.base_path, tech.layer_properties_file)
    @layer_index = MinedaPCell::MinedaPCellCommon::get_layer_index_from_file lyp_file
    
    oo_layout_dbu = 1 / layout.dbu.round(5)
    args = {path_min: (($path_min || 2.0.um)*oo_layout_dbu).to_i,
              path_max: (($path_max || 10.0.um)*oo_layout_dbu).to_i,
              path_scale: ($path_scale || 0.8),
              path_layer: ($path_layer || 'ML1')}
    adjust_paths cv.cell, args
  end
end
AdjustPaths.new.do_adjust_paths
end
