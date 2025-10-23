# $autorun-early
# $priority: 1
# Mineda Common v1.332 Aug. 21st, 2025
#   Force on-grid v0.1 July 39th 2022 copy right S. Moriyama (Anagix Corp.)
#   LVS preprocessor(get_reference) v0.83 Aug. 21st, 2025 copyright by S. Moriyama (Anagix Corporation)
#   * ConvertPCells and PCellDefaults moved from MinedaPCell v0.4 Nov. 22nd 2022
#   Change PCell Defaults v0.2 Jan. 27 2024 copyright S. Moriyama
#   ConvertLibraryCells (ConvertPCells) v0.68 May. 25th 2024  copy right S. Moriyama
#   PCellTest v0.2 August 22nd 2022 S. Moriyama
#   DRC_helper::find_cells_to_exclude v0.1 Sep 23rd 2022 S. Moriyama
#   MinedaInput v0.395 June 30th, 2025 S. Moriyama
#   MinedaPCellCommon v0.341 July 27th 2024 S. Moriyama
#   Create Backannotation data v0.171 May 14th 2023 S. Moriyama
#   MinedaAutoplace v0.31 July 26th 2023 S. Moriyama
#   ChangePCellParameters v0.1 July 29th 2023 S. Moriyama
#   MinedaBridge v0.1 Sep. 17 2023 S. Moriyama
#   MinedaUtility v0.1 Aug. 8, 2025 S. Moriyama

module MinedaUtility
  class ViewDoc
    def self.view_doc file
      home = ENV['USERPROFILE'] || ENV['HOME']
      klayout = '.klayout'  
      ampasand = '&amp;'
      case RbConfig::CONFIG['host_os']
        when /mswin|mingw|cygwin/ 
          cmd = "start "
          klayout = 'KLayout' 
          ampasand = ''
        when /darwin/
          cmd = "open "
        when /linux|bsd/
          cmd = "xdg-open "
        else raise "No OS detected"
      end
      doc =  File.join "file:///#{home}/#{klayout}", file
      b = system cmd + doc + ampasand
    end
  end
end

module MinedaPCellCommonModule
  include RBA
  class MinedaPCellCommon < PCellDeclarationHelper
    include RBA
    attr_accessor :defaults, :layer_index
    @@lyp_file = @@basic_library = @@layer_index = nil
    @@alias = {}
    
    def initialize 
      key = 'PCells_' + self.class.name.to_s.split('::').first + '-defaults'
      key.sub! 'PCells_OpenRule1um_v2', 'PCells'
      #@defaults = YAML.load(Application.instance.get_config key)
      @defaults = YAML.respond_to?(:unsafe_load) ? YAML.unsafe_load(Application.instance.get_config key) : YAML.load(Application.instance.get_config key)

      # puts "Got PCell @defaults from #{key}"
      set_layer_index
      super
    end
    
    def set_alias args={}
      @@alias.merge! args
    end

    def set_technology tech_name
      tech = RBA::Technology::technology_by_name(tech_name)
      @@lyp_file = File.join(tech.base_path, tech.layer_properties_file)
      @@layer_index = self.class.get_layer_index_from_file @@lyp_file
    end

    def set_basic_library basic_lib
      @@basic_library = basic_lib
    end

    def self.get_layer_index_from_file lyp_file
      return unless lyp_file
      require 'rexml/document'
      doc = REXML::Document.new(File.open(lyp_file))
      layer_index = {}
      doc.elements.each('layer-properties/properties'){|e|
        name = e.get_text('name').to_s.sub(/\(.*$/, '')
        valid = e.get_text('valid')
        next if valid == 'false'
        e.get_text('source').to_s =~ /([0-9]+)\/([0-9]+)/
        index = $1.to_i
        data_type = $2.to_i
        layer_index[name] = [index, data_type]
      }
      # puts layer_index
      layer_index
    end

    def set_layer_index
      @basic_library = @@basic_library
      @layer_index = @@layer_index
    end

    def get_layer_index name, insert_layer = true
      layer, data_type = @layer_index[name]
      return layer unless insert_layer
      # puts "get_layer_index:for #{name} = #{layer}/#{data_type}"
      layout.insert_layer(LayerInfo::new layer, data_type)
    end

    def get_cell_index name
      library_cell name, @basic_library, layout
    end

    def param name, type, desc, last_resort
      libname, cellname = self.class.name.to_s.split('::').map{|a| a.to_sym}
      cellname = @@alias && @@alias[libname] && @@alias[libname][cellname] || cellname.to_s
      if @defaults && @defaults[cellname]
        if (value = @defaults[cellname][name.to_s]) || (value == nil) || (value == false)
          # puts "#{self.class.name} '#{name}' => #{value}"
          if last_resort[:default].class != RBA::DPoint && last_resort[:default] == true
            super name, type, desc, {default: value}
          else
            super name, type, desc, value ? {default: value} : last_resort
          end
        elsif value = @defaults[cellname][name.to_s + '_hidden']
          # puts "#{self.class.name} '#{name}' => #{value} 'hidden' => true"
          super name, type, desc, value ? {default: value, hidden: true} : last_resort
        else
          super name, type, desc, value ? {default: value} : last_resort
        end
      else
        super name, type, desc, last_resort
      end
    end

    def library_cell name, libname, layout
      @current_library ||= {}
      cell = layout.cell(name)
      if cell && @current_library[name] == libname
        return cell.cell_index
      else
        lib = Library::library_by_name libname
        if lib && cell = lib.layout.cell(name)
          @current_library[name] = libname
          proxy_index = layout.add_lib_cell(lib, cell.cell_index)
        end
      end
    end

    def create_box index, x1, y1, x2, y2, text=nil
      cell.shapes(index).insert(Box::new(x1, y1, x2, y2)) if  index
      cell.shapes(index).insert_text(Text::new text, (x1+x2)/2, (y1+y2)/2) if text
    end
=begin
    def insert_cell via_index, x, y, rotate=false, bbox_layer=nil
      via = CellInstArray.new(via_index, rotate ? Trans.new(1, false, x, y) : Trans.new(x, y))
      if bbox_layer
        bb = via.bbox(layout)
        create_box bbox_layer, bb.p1.x, bb.p1.y, bb.p2.x, bb.p2.y 
      end
      inst = cell.insert(via)
    end
=end    
    def insert_cell via_index, x, y, rotate=false, bbox_layer=nil
      via = CellInstArray.new(via_index, rotate ? Trans.new(1, false, x, y) : Trans.new(x, y))
      if bbox_layer
        bb = via.bbox(layout)
        create_box bbox_layer, bb.p1.x, bb.p1.y, bb.p2.x, bb.p2.y 
      end
      if @region
        via_cell = layout.cell(via_index).flatten(true)
        @region.each_pair{|lay_ind, region_shapes|
          #shapes = via_cell.shapes(lay_ind)
          shapes = via_cell.shapes(layout.cell(via_index).layout.layer(lay_ind, 0))
          region_shapes.insert(shapes, Trans.new(x, y))#.transform(Trans.new(x, y)))
          #cell.shapes(lay_ind).insert region_shapes
        }
        #cell_copy.clear
      else
        inst = cell.insert(via)
      end
    end
    
    def insert_contacts area, vs, contact
      fill_area(area, vs){|x, y|
        insert_cell contact, x, y
      }
    end
    
    def create_path index, x1, y1, x2, y2, w, be, ee
      points = [Point::new(x1, y1), Point::new(x2, y2)]
      cell.shapes(index).insert(Path::new(points, w, be, ee))
    end

    def create_path2 index, x1, y1, x2, y2, x3, y3, w, be, ee
      points = [Point::new(x1, y1), Point::new(x2, y2), Point::new(x3, y3)]
      cell.shapes(index).insert(Path::new(points, w, be, ee))
    end

    def create_dcont index, x1, y1, x2, y2, vs, dcont_offset=nil
      dcont_offset ||= 0
      if dcont_offset != 0
        dcont_offset = 0 if dcont_offset == true
        n = (y2 - y1 - 2*dcont_offset)/vs
        dcont_offset = (y2 - y1 - n*vs)/2
      end
      # puts [y1+vs/2 + dcont_offset, y2-vs/2 - dcont_offset, vs].inspect
      (y1+vs/2 + dcont_offset .. y2-vs/2 - dcont_offset).step(vs){|y|
        # puts "insert #{index}@#{x1},#{y}"
        insert_cell index, x1, y
      }
    end

    def overcoat layer, original
      cell.shapes(original).each{|shape|
        if shape.is_path?
          path = shape.path
          cell.shapes(layer).insert(Path::new path)
        elsif shape.is_box?
          box = shape.box
          cell.shapes(layer).insert(Box::new box)
        elsif shape.is_polygon?
          polygon = shape.polygon
          cell.shapes(layer).insert(Polygon::new polygon)
        end
      }
    end
    
    def boxes_bbox original
      return nil unless original
      xmin = ymin = 10000000
      xmax = ymax = -xmin
      cell.shapes(original).each{|shape|
        box = shape.bbox
        x1, y1, x2, y2 = [box.p1.x, box.p1.y, box.p2.x, box.p2.y]
        puts "[x1, y1, x2, y2]=#{[x1, y1, x2, y2].inspect}"
        xmin = [xmin, x1].min
        ymin = [ymin, y1].min
        xmax = [xmax, x2].max
        ymax = [ymax, y2].max
      }
      [xmin, ymin, xmax, ymax] unless xmin == 10000000
    end
    
    def cell_bbox index
      result = nil
      cell.each_inst{|inst|
        if inst.cell_index == index
          result = [inst.bbox.p1.x, inst.bbox.p1.y, inst.bbox.p2.x, inst.bbox.p2.y]
          break
        end
      }
      result
    end
    
    def fill_area area, square_size, filler=nil, fill_margin=0
      x1, y1, x2, y2, margin = area
      margin_x = margin_y = (margin || 0)
      if margin.class == Array
        margin_x, margin_y = margin
      end
      xoffset=yoffset=0
      unless square_size == nil || square_size == 0
        n = ((x2 - x1 - 2*margin_x)/square_size).to_i
        xoffset = x2 - x1 - n * square_size
        m = ((y2 - y1 - 2*margin_y)/square_size).to_i
        yoffset = y2 - y1 - m * square_size
        for i in 0..[n-1, 0].max
          for j in 0..[m-1, 0].max
            yield x1 + xoffset/2 + (n<=0? 0 : i*square_size + square_size/2), y1 + yoffset/2 +  (m<=0? 0 : j*square_size + square_size/2) if block_given?
          end
        end
      end
      return_box = [x1 + xoffset/2, y1 + yoffset/2, x2 - xoffset/2, y2 - yoffset/2]
      if filler
        if fill_margin
          if fill_margin.class == Array
            x1 = x1 + fill_margin[0]
            x2 = x2 - fill_margin[0]
            y1 = y1 + fill_margin[1]
            y2 = y2 - fill_margin[1]
          else
            x1 = x1 + fill_margin
            x2 = x2 - fill_margin
            y1 = y1 + fill_margin
            y2 = y2 - fill_margin
          end
        else # fill_margin == nil means to use calculated fill area usign margin_x and margin_y
          x1 = x1 + xoffset/2
          x2 = x2 - xoffset/2
          y1 = y1 + yoffset/2
          y2 = y2 - yoffset/2        
        end    
        if filler.class == Array
          filler.each{|index|
            create_box index, x1, y1, x2, y2
        }
        else
          create_box filler, x1, y1, x2, y2
        end
      end
     return_box
    end
    
    def create_loop index, xs, ys, xl, yl, w
      points = [Point::new(xs, ys), 
                Point::new(xs, ys - yl), 
                Point::new(xs - xl, ys - yl),
                Point::new(xs - xl, ys),
                Point::new(xs, ys)]
      cell.shapes(index).insert(Path::new(points, w, w/2, -w/2).simple_polygon)           
    end
    
    def enlarge_area area, delta_x, delta_y
      new_area = area
      new_area[0] = new_area[0] - delta_x
      new_area[1] = new_area[1] - delta_y
      new_area[2] = new_area[2] + delta_x
      new_area[3] = new_area[3] + delta_y
      new_area
    end 
    ### class variables for PCell classes
    @vs = @u1 = nil
    def self.vs
      @vs
    end
    def self.set_vs vs
      @vs = vs
    end
    def self.u1
     @u1
    end 
    def self.set_u1 u1
      @u1 = u1
    end        
  end
end

module MinedaCommon
  class DRC_helper
    def find_cells_to_exclude layer, pattern, skin_thickness=0
      @pattern = pattern
      @cv = MinedaCommon::ConvertPCells::current_cellview()
      @st = skin_thickness/@cv.layout.dbu
      @layer= @cv.layout.layer(RBA::LayerInfo::new(*layer))
      @cv.cell.shapes(@layer).each{|s| s.delete}
      puts "All the shapes in layer: #{layer} deleted"
      @cv.cell.each_inst{|inst|
        find_cells_recursive inst, @cv.context_trans
      }
    end
    #    def go
    #      find_cells_to_exclude  [63, 63], '^a[np]5g', 5.0
    #    end
    def find_cells_recursive inst, trans
      cell = inst.cell
      if cell.child_instances > 0
        inst.cell_inst.each_cplx_trans{|a|
          cell.each_inst do |inst2|
            trans2 = trans * a
            find_cells_recursive(inst2, trans2)
          end
        }
      elsif cell.name =~ /#{@pattern}/
        box = inst.bbox
        p1 = box.p1
        p2 = box.p2
        box = RBA::Box::new(p1.x + @st, p1.y + @st, p2.x - @st, p2.y - @st)
        @cv. cell.shapes(@layer).insert(box.transformed trans)
        puts "#{inst.cell.name} @ #{inst.bbox}, #{trans}"
      end
    end
  end
  
  class MinedaInput
    include RBA
    attr_accessor :layer_index
    def initialize source=nil, params={}
      return unless source
      @source = source
      tech = @source.layout.technology
      lyp_file = File.join(tech.base_path, tech.layer_properties_file)
      @layer_index = MinedaPCell::MinedaPCellCommon::get_layer_index_from_file lyp_file
      sdir = File.dirname @source.path
      @lvs_work = File.join(sdir, 'lvs_work')
    end

    def index layer_name
      @layer_index[layer_name]
    end
    
    def get_reference
      sdir = File.dirname @source.path
      ext_name = File.extname @source.path
      @target = File.basename(@source.path).sub(ext_name, '')
      output = File.join sdir, "#{@target}_output.cir"
      @lvs_work = File.join(sdir, 'lvs_work')
      reference = File.join(@lvs_work, "#{@target}_reference.cir.txt")
      Dir.mkdir @lvs_work unless File.directory? @lvs_work
      if File.exist? File.join(sdir, @target+'.yaml')
        require 'yaml'
        # ref = YAML.load File.read(File.join sdir, @target+'.yaml')
        ref = YAML.respond_to?(:unsafe_load) ? YAML.unsafe_load(File.read(File.join sdir, @target+'.yaml')) : YAML.load(File.read(File.join sdir, @target+'.yaml'))
        
        if File.exist? ref['netlist']
          if File.exist?(ref['schematic']) && (File.mtime(ref['netlist']) < File.mtime(ref['schematic']))
            raise "netlist file '#{ref['netlist']}' is outdated!\nPlease update netlist and run get_reference again!"
          end
          if File.exist?(reference) && (File.mtime(reference) < File.mtime(ref['netlist']))
            raise "Please run get_reference because netlist file '#{ref['netlist']}'is modified"
          end
        end
      end
      [reference, output]
    end
    
    unless defined? tweak
      def tweak settings
        settings
      end
    end
    
    def report_netlist_file
      "#{@lvs_work}/#{@target}.l2ndb"
    end
    
    def target
      @target
    end
    
    def get_settings
      puts "settings file: #{@lvs_work}/#{@target}_lvs_settings.rb"
      if File.exist? "#{@lvs_work}/#{@target}_lvs_settings.rb"
        "#{@lvs_work}/#{@target}_lvs_settings.rb"
      end
    end
    
    def start exclude
      reference, output = get_reference
      if settings = get_settings
        undef vc_settings if defined? vc_settings
        undef set_blank_layout if defined? set_blank_layout
        load settings
        puts "#{settings} loaded at #{self.class}"
        if defined? set_blank_layout
          exclude = set_blank_layout
        end
      end
      [reference, output, settings]
    end
    
    def exec
      yield
    end
    
    def lvs reference, output, lvs_data, l2n_data, is_deep = false
      if File.exist? reference
        yield
        create_ba_data lvs_data
      # 4b* output
      else
        create_ba_table l2n_data, is_deep
      end
    end
    
    def make_symlink output
      # Netlist vs. netlist
      slink = "#{@lvs_work}/#{File.basename output}.txt"
      File.delete slink if File.exist?(slink) || File.symlink?(slink)
      if /mswin32|mingw/ =~ RUBY_PLATFORM
        File.link output, slink if File.exist?(output)
      else
        puts Dir.pwd
        puts output
        File.symlink "../#{File.basename output}", slink
      end
    end
    
    def find_prefix device_class_name
      prefix = nil
      case device_class_name
      when 'RBA::DeviceClassResistor', 'RBA::DeviceClassResistorWithBulk'
        prefix = 'R'
      when 'RBA::DeviceClassCapacitor', 'RBA::DeviceClassCapacitorWithBulk'
        prefix = 'C'
      when 'RBA::DeviceClassDiode'
        prefix = 'D'
      when 'RBA::DeviceClassMOS3Transistor', 'RBA::DeviceClassMOS4Transistor'
        prefix = 'M'
      when 'RBA::DeviceClassBJT3Transistor', 'RBA::DeviceClassBJT4Transistor'
        prefix = 'Q' 
      end
      prefix
    end
    
    def create_ba_table l2n_data, is_deep
      unless is_deep
        puts "Caution: backannotation table (xxx.table.yaml) will be created only when LVS mode is deep"
        return
      end
      ext_name = File.extname @source.path
      target = File.basename(@source.path).sub(ext_name, '') 
      # trans_data = []
      ba_data = {}
      l2n_data.netlist.each_circuit{|c|
        puts c.name
        rest = []
        devices_count = 0
        c.each_device{|device| devices_count = devices_count + 1}
        puts "devices_count = #{devices_count}"
        count = 0
        old_dcname = old_w = nil
        c.each_device{|device|
          # trans_data << device.trans
          prefix = find_prefix(device.device_class.class.name)
          case prefix
          when 'M' 
            l = device.parameter('L').round(4)
            w = device.parameter('W').round(4)
            puts [count, device.expanded_name, device.device_class.name, [l, w], device.trans.to_s].inspect
            dcname = device.device_class.name
            displacement = device.trans.disp
            latest = [[displacement.x.round(6), displacement.y.round(6)]]+ # , device.trans.to_s 
                     [['AS', 'AD', 'PS', 'PD'].map{|p| device.parameter(p).round(6)}]
            ba_data[prefix] ||= {}
            ba_data[prefix][dcname] ||= {}
            ba_data[prefix][dcname][l] ||= {}
            count = count + 1
            if count == devices_count
              rest << latest
              w_key = "#{w}*#{rest.size}"
              ba_data[prefix][old_dcname || dcname][l][w_key] = rest
            elsif old_dcname && dcname != old_dcname
              w_key = "#{old_w}*#{rest.size}"
              ba_data[prefix][old_dcname][l] ||= {}
              ba_data[prefix][old_dcname][l][w_key] = rest
              rest = [latest]
            else
              rest << latest
            end
            old_dcname = dcname
            old_w = w
          end
        }

      }
      # puts ba_data.inspect
      Dir.chdir(File.dirname @source.path){
        table_file = target + '_table.yaml'
        File.open(table_file, 'w'){|f|
          f.puts ba_data.to_yaml
        }
        puts "#{table_file} created under #{Dir.pwd}"
      }
      # trans_data
    end
    
    def create_ba_data lvs_data
      ext_name = File.extname @source.path
      target = File.basename(@source.path).sub(ext_name, '') 
      xref_data = {}
      ba_data = {}
      status = nil
      lvs_data.xref.each_circuit_pair.each{|c|
        puts "LVS result for #{c.second.name}: #{c.status}"
        next unless c.status == NetlistCrossReference::Match ||
                    c.status == NetlistCrossReference::MatchWithWarning
        status = c.status
        cname = c.second.name
        xref_data[cname] = {}
        ba_data[cname] = {}
        lvs_data.xref.each_device_pair(c).each{|device| 
          next unless ext = device.first
          if ref = device.second
            
            unless prefix = find_prefix(ext.device_class.class.name)
              puts "#{ref.device_class.class} does not match"
              prefix = ''
            end
            dname = ref.expanded_name
            if dname =~ /^\d+$/
              device = prefix + dname
              ba_data[cname][device] ||= {}
              xref_data[cname][device] = [ref.id, ext.trans.to_s]
              ext && ext.device_class.parameter_definitions.each{|p|
                ba_data[cname][device][p.name] = ext.parameter(p.name).round(5)
              }
            elsif dname =~ /^(.*)\.(\d+)$/
              ckt = $1
              device = prefix + $2
              ba_data[cname][ckt] ||= {}
              ba_data[cname][ckt][device] ||= {}
              ext && ext.device_class.parameter_definitions.each{|p|
                ba_data[cname][ckt][device][p.name] = ext.parameter(p.name).round(5)
              }
            end
          end
        }
      }
      status && Dir.chdir(File.dirname @source.path){
        if File.exist? file = target + '_xref.yaml'
          File.delete(file)
        end
        File.open(file, 'w'){|f|
          f.puts xref_data.to_yaml
        }
        if File.exist? file = target + '_ba.yaml'
          File.delete(file)
        end
        File.open(file, 'w'){|f|
          f.puts ba_data.to_yaml
        }
      }
      status
    end
    
    def check_polarity lvs_data, polarity_check, reversed=[]
      # lv = RBA::Application::instance.main_window.current_view
      # lv.clear_markers ### unfortunately clearing persistent markers do not work here

      result = [];
      lvs_data.xref.each_circuit_pair.each{|c|
        puts "Device polarity check for #{c.second.name}: #{c.status}"
        lvs_data.xref.each_device_pair(c).each{|device| 
          next unless ext = device.first
          if ref = device.second
            ext.device_abstract.name =~ /\$([^\$]+)/ # 2025/8/20 changed from /\$(\S+)/
            device_name = $1.to_sym
            puts "device_name = #{device_name}"
            # compare ref.net_for_terminal(0):ext.net_for_terminal(0)
            #       with net.first:net.second
            match1 = match2 = false
            rev = reversed.include?(device_name) ? true : false
            polarity_check.include?(device_name) &&
            lvs_data.xref.each_net_pair(c).each{|net|
              puts "net: #{net.first}:#{net.second}"
              puts " ext0:#{ext.net_for_terminal(rev ? 1 : 0)}, ref0:#{ref.net_for_terminal(0)}"
              puts " ext1:#{ext.net_for_terminal(rev ? 0 : 1)}, ref1:#{ref.net_for_terminal(1)}"
              next if net.first.nil? || net.second.nil? || ext.net_for_terminal(0).nil? || ext.net_for_terminal(1).nil?
              if ext.net_for_terminal(rev ? 1 : 0).qname == net.first.qname &&
                ref.net_for_terminal(0).qname == net.second.qname
                match1 = true
              elsif ext.net_for_terminal(rev ? 0 : 1).qname == net.first.qname &&
                ref.net_for_terminal(1).qname == net.second.qname
                match2 = true
              end
            }
            if match1 && match2
              error_device = "#{device_name[0]}#{ref.expanded_name}(#{device_name})"
              puts "Caution! #{error_device} polarity wrong!"
              result << [error_device, device.first.trans.disp.x, device.first.trans.disp.y]
            end
          end 
        }
      }
      result
    end
    
    def polarity_error_dialog error_devices, title='Devices with polarity error'
      dialog = QDialog.new(Application.instance.main_window)
      dialog.windowTitle = title

      mainLayout = QVBoxLayout::new(dialog)
      dialog.setLayout(mainLayout)
      #editor = QPlainTextEdit.new(dialog)
      #editor.insertPlainText @config || ''
      #mainLayout.addWidget(editor)
      labelView = QLabel.new
      labelText = "Following devices have polarity error:\n\n"
      
      lv = RBA::Application::instance.main_window.current_view
      lv.clear_markers
      error_devices.each{|e|
        labelText << '    ' + e[0] + "\n"
        put_marker lv, e[1], e[2]
      }
      labelText << "\nPlease check the guidelines (GL03) and make corrections."
 
      labelView.setText labelText
      mainLayout.addWidget(labelView)

      # button boxes
      layout = QHBoxLayout.new(dialog)
      mainLayout.addLayout(layout)
      
      # Next button
      #buttonNext = QPushButton.new(dialog)
      #layout.addWidget(buttonNext)
      #buttonNext.text = ' reserved '
      #uttonNext.clicked do
        # dislay the next error (Change color?)
      #end
      
      # OK button
      buttonOK = QPushButton.new(dialog)
      layout.addWidget(buttonOK)
      buttonOK.text = " OK "
      buttonOK.clicked do 
        dialog.accept()
        #yield editor
      end
      # Cancel button
      cancel = QPushButton.new(dialog)
      layout.addWidget(cancel)
      cancel.text = "cancel"
      cancel.clicked do 
        dialog.accept()
      end
      dialog.exec
    end
 
    def put_marker(lv, x, y, marker_size=50.0)
      marker = RBA::Marker.new
      vertices = [DPoint::new(x, y), DPoint::new(x+marker_size*0.5, y+marker_size*0.5),
                  DPoint::new(x+marker_size*0.5, y+marker_size*0.5), DPoint::new(x+marker_size*0.2, y+marker_size*0.5),
                  DPoint::new(x+marker_size*0.2, y+marker_size*0.5), DPoint::new(x+marker_size*0.2, y+marker_size),
                  DPoint::new(x-marker_size*0.2, y+marker_size), DPoint::new(x-marker_size*0.2, y+marker_size),
                  DPoint::new(x-marker_size*0.2, y+marker_size), DPoint::new(x-marker_size*0.2, y+marker_size*0.5),
                  DPoint::new(x-marker_size*0.2, y+marker_size*0.5), DPoint::new(x-marker_size*0.5, y+marker_size*0.5),
                  DPoint::new(x-marker_size*0.5, y+marker_size*0.5), DPoint::new(x, y)]
      marker.color = 255*256*256+0*256+0 # Red: 255,0,0
      marker.set(DPolygon::new(vertices))
      lv.add_marker(marker)
    end
    
    def has_rescap3 file
      has_rescap3 = nil
      lines = File.read file
      lines.each_line{|l|
        if l =~/^ *[xX][rRcC]\d\S* +([^=]*) +(\S+=\S+)/
          if $1 && $1.strip.split(/ +/).size >=4
            has_rescap3 = true
            break;
          end
        elsif  l =~/^ *[xX][mM]\d\S* +([^=]*) +(\S+=\S+)/
            has_rescap3 = true
            break;        
        end
      }
      if has_rescap3
        new_lines = ''
        lines.each_line{|l|
          new_lines << l.sub(/^ *[xX]([rRcCmM])(\d)/, '\1\2')
        } 
        file.sub! '_reference.cir', '_reference3.cir'
        File.open(file, 'w'){|f|
          f.puts new_lines
        }   
      end
      [has_rescap3, file]
    end
  end

  class PCellTest
    include RBA  
    def initialize
      cv = ConvertPCells::current_cellview
      @cell = cv.cell
      @lib = Library::library_by_name 'PCells_' + cv.technology
      @xpos = @ypos = 0
      # @defaults = PCellDefaults::get_defaults @lib.name
      puts cv
    end
    def create_pcell name, params
      pd = @lib.layout.pcell_declaration(name)
      raise "No pcell declartion for #{name}" if pd.nil?
      puts "params for #{name}: #{params.inspect}"
      # @defaults[name].each_pair{|p, v|
      #   params[p] ||= v
      # }
      puts "=> #{params.inspect}"
      @cell.layout.add_pcell_variant(@lib, pd.id, params)
    end
    def insert_pcell x, y, name, params
      pcv = create_pcell name, params
      inst=@cell.insert RBA::CellInstArray::new(pcv, Trans::new(x,y))
      puts "=> #{inst.pcell_parameters_by_name}"
    end
    def get_defaults pcell_lib = @lib.name
      # params = YAML.load(PCellDefaults::dump_pcells pcell_lib)
      params = YAML.respond_to?(:unsafe_load) ? YAML.unsafe_load(PCellDefaults::dump_pcells pcell_lib) : YAML.load(PCellDefaults::dump_pcells pcell_lib)
      defaults = {}
      params.keys.each{|key|
        defaults[key.to_s] = params[key]
      }
      defaults
    end
    def render_pcells(pcvs, width, height, ncolumns)
      w = (width/@cell.layout.dbu).to_i
      h = (height/@cell.layout.dbu).to_i
      count = 0
      pcvs.each{|pcv|
        @xpos = @xpos + w
        count = count + 1
        inst = @cell.insert RBA::CellInstArray::new(pcv, Trans::new(@xpos, @ypos))
        # puts "=> #{inst.pcell_parameters_by_name}"
        if (count % ncolumns) == 0
          count = 0
          @xpos = 0
          @ypos = @ypos + h
        end
      }
      @xpos = 0
      @ypos = @ypos + h
    end
    
    def do_sweep new_sweep, params = {}, &block
      sweep = new_sweep.dup
      #puts "sweep=#{sweep}, params = #{params}"
      if sweep && sweep.size > 0
        new_sweep = sweep.delete('sweep')
        longest = nil
        sweep.each_key{|k|
          longest = k if longest.nil? || sweep[k].length > sweep[longest].length
        }
        prev = {}
        for i in 0..(sweep[longest].length - 1) do
          sweep.each_pair{|k, v|
            params[k] = v[i].nil? ? prev[k] : v[i]
            prev[k] = params[k]
          }
          do_sweep new_sweep, params, &block
        end
      else
        yield params
        # puts "###{params.inspect}"
      end
    end

    def create_samples device, width, height, ncolumns, sweep_spec
      pcvs = []
      do_sweep((YAML.respond_to?(:unsafe_load) ? YAML.unsafe_load(sweep_spec) : YAML.load(sweep_spec))['sweep']){|params|
        pcvs << create_pcell(device, params)
      }
      render_pcells(pcvs, width, height, ncolumns)
    end
  end

  class ConvertPCells
    def initialize pcell_module
      @technology_name = pcell_module.sub(/_v[^_]*$/, '')
      @pcell_lib = ('PCells_' + @technology_name).sub('PCells_OpenRule1um', 'PCells')
      @basic_lib = @technology_name + '_Basic'
      @defaults = PCellDefaults::get_defaults @pcell_lib
      @pcell_module = pcell_module
    end
    def convert_library_cells cv, pcell_lib, basic_lib, pcell_factor=1.0, force_defaults=nil
      # puts "@defaults=#{@defaults}"
      convert_library_cells0 cv.cell, pcell_lib, basic_lib, pcell_factor, force_defaults
    end
    def find_vias cell
      vias = []
      cell.each_inst{|inst|
        next if inst.is_pcell?
        vias << inst if inst.cell.name =~ /^Via$|^Via\$\d+|/
      }
      vias
    end
    def convert_library_cells0 cell, pcell_lib, basic_lib, pcell_factor, force_defaults
      oo_layout_dbu = 1 / cell.layout.dbu.round(5)
      lib = RBA::Library::library_by_name pcell_lib
      bas_lib = RBA::Library::library_by_name basic_lib
      vias = find_vias cell
      puts "Vias: [#{vias.map{|v| v.trans}.join(',')}]"
      cells_to_delete = []
      cells_to_add_via = []
      cell.each_inst{|inst| # process PCell instances
        t = inst.trans
        inst_cell_name = (@device_mapping && @device_mapping[inst.cell.name]) || inst.cell.name          
        inst_cell_name.sub! /\$.*$/, ''

        next if  !inst.is_pcell? || inst.cell.library == lib # already converted
        # puts inst.cell.name        
        pcell_params = inst.pcell_parameters_by_name
        dgo = ([((pcell_params['sdg']||0) - (pcell_params['l']||0))/2, pcell_params['dg']||0].max*oo_layout_dbu).to_i * pcell_factor

        if pcell_factor
          pcell_params['l'] = pcell_params['l']*pcell_factor if pcell_params['l']
          pcell_params['w'] = pcell_params['w']*pcell_factor if pcell_params['w']
          pcell_params['ux'] = pcell_params['ux']*pcell_factor if pcell_params['ux']
          pcell_params['uy'] = pcell_params['uy']*pcell_factor if pcell_params['uy']
          if @defaults[inst_cell_name] 
            if @defaults[inst_cell_name]['sdg'].nil?
              pcell_params['sdg'] = pcell_params['sdg']*pcell_factor if pcell_params['sdg'] 
            else
              pcell_params['sdg'] = @defaults[inst_cell_name]['sdg']
            end
          end
        end
        @defaults[inst_cell_name] && @defaults[inst_cell_name].each_pair{|p, v|
          name = p.sub '_hidden', ''
          if pcell_params[name]
            if force_defaults && force_defaults.class == Array
              pcell_params[name] = v if force_defaults.include? name.to_sym
            end
          end
        }
        puts "#{inst_cell_name}@#{inst.trans}: #{pcell_params.inspect}"
        i_cell_name = nil
        via = nil
        inst.cell.each_inst.with_index{|i, index|
          p = t*i.trans
          #it = Point.new(p.disp.x, p.disp.y)
          puts "#{i.cell.name}@#{p}" unless i.cell.name == 'dcont'
          i_cell_name = nil
          if via = vias.find{|v| v.trans.disp.x == p.disp.x && v.trans.disp.y == p.disp.y}
            puts "***Found #{i.cell.name} over #{via.cell.name}@#{p}"
            i_cell_name = i.cell.name
          end
        }
        next unless pd = lib.layout.pcell_declaration(inst_cell_name) 
        pcv = cell.layout.add_pcell_variant(lib, pd.id, pcell_params)
        if i_cell_name
          cells_to_add_via << [pcv, t, inst, i_cell_name, via] 
        else
          if inst.pcell_declaration.class.vs
            vso = inst.pcell_declaration.class.vs * pcell_factor
            u1o = inst.pcell_declaration.class.u1 * pcell_factor
            dg = ([((pcell_params['sdg']||0) - (pcell_params['l']||0))/2, pcell_params['dg']||0].max*oo_layout_dbu).to_i
            puts "#{inst.pcell_declaration.class.name} class.vs, u1, dg = [#{vso}, #{u1o} #{dgo}] -> vs = #{pd.class.vs}, u1 = #{pd.class.u1}, dg=#{dg}"
            puts "Trans::new(-#{(pd.class.vs - vso + dg - dgo)}.inspect, -#{(pd.class.vs + pd.class.u1 - vso - u1o)}.inspect)"
            trans = Trans::new(-(pd.class.vs - vso + dg - dgo).to_i, -(pd.class.vs + pd.class.u1 - vso - u1o).to_i)
            cell.insert(RBA::CellInstArray::new(pcv, t*trans, inst.a, inst.b, inst.na, inst.nb))
          else
            cell.insert(RBA::CellInstArray::new(pcv, t, inst.a, inst.b, inst.na, inst.nb))
          end
          inst.delete
        end
        # pcell_inst = cell.insert(RBA::CellInstArray::new(pcv, t, inst.a, inst.b, inst.na, inst.nb))
        cells_to_delete << inst.cell
      }
      cells_to_add_via.each{|pcv, t, inst, i_cell_name, via|
        pcell_inst = cell.insert(RBA::CellInstArray::new(pcv, t, inst.a, inst.b, inst.na, inst.nb))
        if inst_i = pcell_inst.cell.each_inst.find{|i| i.cell.name.sub(/\$.*$/, '') == i_cell_name}
          via_cell = bas_lib.layout.cell('Via')
          proxy_index = cell.layout.add_lib_cell(bas_lib, via_cell.cell_index)
          via_inst = cell.insert(RBA::CellInstArray.new(proxy_index, t*inst_i.trans))
          puts "===>Insert Via at #{t*inst_i.trans}"
          inst.delete
          via.delete
        end
      }
      cell.each_inst{|inst| # process Basic cells and other cells
        next if inst.cell.nil? || inst.cell.library.nil? || !(inst.cell.library.name =~ /_Basic/)
        next if inst.is_pcell? || inst.cell.library == bas_lib # already converted
        t = inst.trans
        inst_cell_name = (@device_mapping && @device_mapping[inst.cell.name]) || inst.cell.name          
        puts "Basic cell: #{inst.cell.name}"
        inst_cell_name.sub! /\$.*$/, ''

        basic_cell = bas_lib.layout.cell(inst_cell_name)
        raise "basic_cell for #{inst_cell_name} not found" if basic_cell.nil?
        proxy_index = cell.layout.add_lib_cell(bas_lib, basic_cell.cell_index)
        basic_inst = cell.insert(RBA::CellInstArray.new(proxy_index, t, inst.a, inst.b, inst.na, inst.nb))       

        cells_to_delete << inst.cell
        inst.delete
      }
      if false && cells_to_delete.size > 0
        puts "### CELLS TO DELETE: #{cells_to_delete.map{|c| [c.name, c.library.name]}.uniq.inspect}"
        cells_to_delete.uniq.each{|c|
          # puts "#{c.name}@#{c.library.name}"
          c.delete
        }
      end
      child_cells = []
      cell.each_child_cell{|id| child_cells << id}
      child_cells.each{|id|
        c = cell.layout.cell(id)
        next if c.is_pcell_variant?
        if c.child_instances > 0
          puts c.name
          convert_library_cells0 c, pcell_lib, basic_lib, pcell_factor, force_defaults
        end
      }
    end

    def adjust_paths cell, args
      return if cell.is_library_cell
      puts "*** Adjust Paths for '#{cell.name}"
      layout = cell.layout
      layout.layer_indexes.each{|layer|
        source_layer = layout.get_info(layer).layer
        layer_name, = @layer_index.find{|k, v| v[0]  == source_layer}
        next if args[layer_name].nil?
        paths = 0
        cell.shapes(layer).each{|shape|
          if shape.is_path?
            path = shape.path
            # path.width = [(path.width*args[:path_scale]).to_i, args[:path_min]].max
            # next if args[layer_name][:pws].nil?
            path.width = (path.width*(args[layer_name][:pws] || 1.0)).to_i
            path.width = args[layer_name][:pwm] if args[layer_name][:pwm]  && path.width < args[layer_name][:pwm]
            shape.path = path if args[layer_name][:pwx].nil? || path.width < args[layer_name][:pwx]
            paths = paths + 1
          elsif shape.is_box?
            box = shape.box
            if path = box2path(box, args[layer_name])
              shape.path = path
            end
          end
        }
        puts "paths=#{paths} for layer:#{layer_name}" if paths>0
      }

      child_cells = []
      cell.each_child_cell{|id| child_cells << id}
      child_cells.each{|id|
        c = cell.layout.cell(id)
        #puts c.name
        adjust_paths c, args
      }
    end
    def box2path box, args
      x1, y1 = [box.p1.x, box.p1.y]
      x2, y2 = [box.p2.x, box.p2.y]
      if x2 - x1 > y2 - y1
        return nil if args[:pwx] && y2 - y1 > args[:pwx]
        spine = [Point.new(x1, (y1+y2)/2), Point.new(x2, (y1+y2)/2)]
        width = y2 - y1
      else
        return nil if  args[:pwx] && x2 - x1 > args[:pwx]
        spine = [Point.new((x1+x2)/2, y1), Point.new((x1+x2)/2, y2)]
        width = x2 - x1
      end
      # Path.new spine, [(width*args[:path_scale]).to_i, args[:path_min]].max
      width = (width*args[:pws]).to_i if args[:pws]
      width = args[:pwm] if args[:pwm]  && width < args[:pwm]
      Path.new spine, width
    end
    
    def do_adjust_paths_and_boxes cv, args
      layout = cv.layout
      tech = layout.technology
      lyp_file = File.join(tech.base_path, tech.layer_properties_file)
      @layer_index = MinedaPCell::MinedaPCellCommon::get_layer_index_from_file lyp_file
      oo_layout_dbu = 1 / layout.dbu.round(5)
      path_args  = {path: {}}  # , rsf: rsf=args[:routing_scale_factor], psf: psf=args[:pcell_scale_factor]}
      rsf = args[:routing_scale_factor]
      args[:path].each_pair{|layer_name, params|
        path_args[layer_name] ||= {}
        path_args[layer_name][:pws] = params[:path_width_scale]  && params[:path_width_scale]/rsf
        path_args[layer_name][:pwm] = (params[:path_width_min] && (params[:path_width_min]*oo_layout_dbu).to_i)
        path_args[layer_name][:pwx] = (params[:path_width_max] && (params[:path_width_max]*oo_layout_dbu).to_i)
      }
      puts args.inspect
      puts path_args.inspect
      adjust_paths cv.cell, path_args
    end
    include RBA
    def do_convert_library_cells args
      app = Application.instance
      mw = app.main_window
      @cv = mw.current_view.active_cellview
      file = args[:target] || QFileDialog::getSaveFileName(mw, 'Converted File name', File.dirname(@cv.filename))
      raise 'Cancelled' if file.nil? || file.strip == ''
      file = file + '.GDS' unless File.extname(file).upcase == '.GDS'
      opt = SaveLayoutOptions.new
      opt.scale_factor = args[:routing_scale_factor] || 1
      @cv.cell.write file, opt
      technology_name = @cv.technology
      puts "Current technology: #{technology_name}"
      @technology_name = args[:technology_name] || @technology_name
      opt = LoadLayoutOptions.new
      if (map_file = args[:layer_map]) && File.exist?(map_file)
        opt.layer_map = LayerMap::from_string File.read(map_file) 
      else
        opt.layer_map = LayerMap::from_string self.class.create_map(@cv, @pcell_module, @technology_name)
      end
      opt.create_other_layers = false # layers not listed in this layer map are ignored (not created)
      cv = mw.load_layout file, opt, @technology_name, 1 #  mode 1 means new view
      @pcell_lib = args[:pcell_lib] || @pcell_lib
      @basic_lib = args[:basic_lib] || @basic_lib
      @device_mapping = args[:device_mapping]
      convert_library_cells cv, @pcell_lib, @basic_lib, args[:pcell_scale_factor], args[:force_defaults]
      cv.technology = @technology_name
      # cv.cell.write file
      args[:path] && do_adjust_paths_and_boxes(cv, args)

      Dir.chdir(File.dirname(@cv.filename)){
        org_cir = File.join 'lvs_work', File.basename(@cv.filename).sub(/\.(gds|GDS)/, '_reference.cir.txt')
        puts "org_cir: #{org_cir}"
        if File.exist?(org_cir)
          tgt_dir = File.join File.dirname(file), 'lvs_work'
          FileUtils.mkdir tgt_dir unless File.directory? tgt_dir
          tgt_cir = File.join tgt_dir, File.basename(file).sub(/\.(gds|GDS)/, '_scaled.net')
          convert_circuit org_cir, tgt_cir, args[:pcell_scale_factor]
        end
      }
    end
    
    def convert_circuit org_cir, tgt_cir, factor
      f = File.open(tgt_cir, 'w')
      File.read(org_cir).encode('UTF-8', invalid: :replace).each_line{|line|
        if line =~ /^M.* +(L=(.*)[UN])\S* +(W=(.*)[UN])\S*/
          l = $2
          w = $4
          l_desc = $1
          w_desc = $3
          new_l = l_desc.sub(l, (l.to_f*factor).round(4).to_s)
          new_w = w_desc.sub(w, (w.to_f*factor).round(4).to_s)
          line = line.sub(w_desc, new_w).sub(l_desc, new_l)
        end
        f.puts line
      }
      f.close
    end
    
    def self.create_map cv, pcell_module, technology_name = pcell_module.sub(/_v[^_]*$/, '')
      # mpc = pcell_module.send MinedaPCellCommon::new
      mpc = eval "#{pcell_module}::MinedaPCellCommon::new"
      name = technology_name
      unless RBA::Technology.technology_names.include? name
        raise "#{name} is not a valid technology name ... check RBA:Technology.technology_names!"
      end
      mpc.set_technology name # ('PCells_' + name).sub('PCells_OpenRule1um', 'PCells') #.sub('Sky130a', 'SKY130')
      puts "target technology: #{name}:#{mpc.set_layer_index}"
      map = ''
      cv.view.each_layer{|l|
        next unless l.valid?
        layer_name = l.name.sub(/\(.*$/, '')
        if pair = mpc.layer_index[layer_name]
          target_layer, target_datatype = pair
          map << "#{l.source_layer}/#{l.source_datatype}:#{target_layer}/#{target_datatype}\n"
        end
      }
      puts map
      map
    end
    
    def self.current_cellview
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
      cv
    end
  end
  
  class PCellDefaults
    include RBA

    def initialize
      app = RBA::Application.instance
      @mw = app.main_window
      lv = @mw.current_view
      cv = lv.active_cellview
      @tech = cv.technology
      tech_map = {'OpenRule1um' => 'PCells', 'OR_TIASCR' => 'PCells_Tiascr130'}
      @pcell_map = {'OpenRule1um' => 'OpenRule1um_v2::OpenRule1um', 'OR_TIASCR' => 'Tiascr130::Tiascr130',
                   'Sky130a' => 'Sky130a_v0p2::Sky130a' } # rest are : #{@tech}::#{@tech}
      lib_name = (tech_map[@tech] || 'PCells_' + @tech ) 
      @key = lib_name + '-defaults'
      @config = Application.instance.get_config(@key)
      if @config.nil? || @config == ''
        @config = self.class.dump_pcells(lib_name)
      end
      # puts "config for '#{@key}': \n#{@config}"
    end

    def self.dump_pcells lib_name, file = nil
      include RBA
      lib = RBA::Library::library_by_name lib_name
      defaults = {}
      if lib.nil?
        #raise 'error' 
        puts "error caused by #{lib_name}"
      end
      lib.layout.pcell_names.each{|name|
        defaults[name] = {}
        lib.layout.pcell_declaration(name).get_parameters.each{|p|
          defaults[name][p.hidden ? p.name + '_hidden' : p.name] = p.default
        }
      }
      File.open(file, 'w'){|f| f.puts defaults.to_yaml} if file
      defaults.to_yaml
    end
    
    def self.get_defaults pcell_lib
      # params = YAML.load(PCellDefaults::dump_pcells pcell_lib)
      source = PCellDefaults::dump_pcells pcell_lib
      params = YAML.respond_to?(:unsafe_load) ? YAML.unsafe_load(source) : YAML.load(source)

      defaults = {}
      params.keys.each{|key|
        defaults[key.to_s] = params[key]
      }
      defaults
    end
    
    def pcell_dialog title
      lv = @mw.current_view
      cv = lv.active_cellview
      dialog = QDialog.new(Application.instance.main_window)
      dialog.windowTitle = title
      mainLayout = QVBoxLayout::new(dialog)
      dialog.setLayout(mainLayout)
      editor = QPlainTextEdit.new(dialog)
      editor.insertPlainText @config || ''
      mainLayout.addWidget(editor)
      
      # button boxes
      layout = QHBoxLayout.new(dialog)
      mainLayout.addLayout(layout)
      
      # Save button
      buttonSave = QPushButton.new(dialog)
      layout.addWidget(buttonSave)
      buttonSave.text = ' Save '
      buttonSave.clicked do
        if settings_file = QFileDialog::getSaveFileName(@mw, 'Save File', File.dirname(cv.filename))
          File.open(settings_file, 'w'){|f| f.puts editor.document.toPlainText}
          puts "#{settings_file} saved"
        end
      end
      
      # Load button
      buttonLoad = QPushButton.new(dialog)
      layout.addWidget(buttonLoad)
      buttonLoad.text = ' Load '
      buttonLoad.clicked do
        if file = QFileDialog::getOpenFileName(@mw, 'Load File', File.dirname(cv.filename))
          editor.setPlainText File.read(file) if File.exist?(file)
        end
      end

      # OK button
      buttonOK = QPushButton.new(dialog)
      layout.addWidget(buttonOK)
      buttonOK.text = " OK "
      buttonOK.clicked do 
        dialog.accept()
        yield editor
      end
      # Cancel button
      cancel = QPushButton.new(dialog)
      layout.addWidget(cancel)
      cancel.text = "cancel"
      cancel.clicked do 
        dialog.accept()
      end
      dialog.exec
    end
    def change_pcell_defaults
      pcell_dialog("Change PCell defaults for #{@tech}"){|editor|
        config = editor.document.toPlainText        
        Application.instance.set_config @key, config.gsub(/^ *$\n/, '') # remove blank lines
        puts "PCell defaults set for '#{@key}'"
        eval(@pcell_map[@tech] || "#{@tech}::#{@tech}").send 'new'
        # puts pcell_map[@tech] || "#{@tech}::#{@tech}"
      }
    end
  end

  class ChangePCellParameters < PCellDefaults
    include RBA

    def initialize
      app = RBA::Application.instance
      @mw = app.main_window
      lv = @mw.current_view
      @selected_objects = lv.object_selection
      config = {}
      if @selected_objects.size > 0
        @selected_objects.each{|s|
          next unless s.is_cell_inst?
          cell_name = s.inst.cell.basic_name
          next if config[cell_name]
          config[cell_name] = s.inst.pcell_parameters_by_name
        }
        @config = config.to_yaml
      else
        raise 'No instances selected!'
      end
    end

    def change_pcell_parameters
      pcell_dialog("Change PCell parameters for #{@tech}") {|editor|
        config = YAML.respond_to?(:unsafe_load) ? YAML.unsafe_load(editor.document.toPlainText) : YAML.load(editor.document.toPlainText)
        puts config
        @selected_objects.each{|s|
          next unless s.is_cell_inst?
          cell_name = s.inst.cell.basic_name
          if params = config[cell_name]
            puts "update #{s.inst.cell.name} with #{params}"
            params.each_pair {|p, v|
              s.inst.change_pcell_parameter p, v
            }
          end
        }
      }
    end
  end

end

class MinedaGridCheck
  include RBA
  def initialize grid = nil
    @grid = grid 
  end
  
  def fix_offgrid(shape, old_x, old_y)
    p = fixed_point old_x, old_y
    shape.transform Trans.new(Trans::R0, p.x-old_x, p.y-old_y) if p
  end

  def fixed_point old_x, old_y
    x = (old_x/@grid_db).to_i * @grid_db
    y = (old_y/@grid_db).to_i * @grid_db
    unless x == old_x && y == old_y
      puts "(#{old_x}, #{old_y}) => (#{x}, #{y})"
      return Point::new(x, y)
    end
    nil
  end

  def fix_path_points shape
    spine = []
    flag = false
    shape.each_point{|p|
      if new_p = fixed_point(p.x, p.y)
        flag = true
        spine << new_p
      else
        spine << p
      end
    }
    flag && spine
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

  def check_off_grid cell, lv
    return if cell.is_library_cell
    puts "*** check offgrid for '#{cell.name}"
    lv.each_layer{|layer_props|
      paths = 0
      cell.shapes(layer_props.layer_index).each{|shape|
        # fix_offgrid(shape, shape.bbox.left, shape.bbox.top)
        if shape.is_path?
          path = shape.path
          if spine = fix_path_points(shape)
            path.points= spine
            shape.path = path
          end
          paths = paths + 1
        elsif shape.is_box?
          box = shape.box
          flag = false
          if p = fixed_point(box.left, box.top)
            box.top = p.y
            box.left = p.x
            flag = true
          end
          if p = fixed_point(box.right, box.bottom)
            box.bottom = p.y
            box.right = p.x
            flag = true
          end
          shape.box = box if flag
        elsif shape.is_polygon?
          plgn =shape.polygon
          hull = []
          plgn.each_point_hull{|p|
            hull << (fixed_point(p.x, p.y) || p)
          }
          plgn.hull = hull
          plgn.holes.times{|i|
            hole = []
            plgn.each_point_hole(i){|p|
              hole << (fixed_point(p.x, p.y) || p)
            }
            plgn.hole = hole
          }
          shape.polygon = plgn
        end
      }
      puts "paths=#{paths} for layer:#{layer_props.name}" if paths>0
    }

    cell.each_inst{|inst|
      old_x=inst.trans.disp.x
      old_y=inst.trans.disp.y
      fix_offgrid(inst, old_x, old_y)
    }
    
    child_cells = []
    cell.each_child_cell{|id| child_cells << id}
    child_cells.each{|id|
      c = cell.layout.cell(id)
      #puts c.name
      check_off_grid c, lv
    }
  end
  
  def do_check
    cv, lv = current_cellview()
    check_off_grid cv.cell, lv
  end
end

class SubcktParams
  #  def initialize file='FUSE_12BIT.spice'
  def initialize netlist
    @subckt = {}
    building = name = nets = params = nil
    @lines = netlist
    @lines.each_line{|l|
      next if l =~ /^\*/
      if l =~ /^.(ends|ENDS)/
        # @subckt[name] << "end\n"
        building = nil
      elsif building
        #puts "LLL l=#{l}"
        @subckt[name][1] << translate(l, nets)
      elsif l =~ /^.(subckt|SUBCKT) +(\S*) +([^=]*) +(\S+ *=.+$)/
        name = $2
        nets = $3.split
        params = Hash[*($4.scan(/(\S+) *= *(\S+)/)).flatten]
        # puts "subckt #{name}"
        # puts "nets: #{nets}"
        # puts "params: #{params}"
        building = true
        @subckt[name] = [nets, [], params] # "def #{name} nets params\n"
      end
    }
    @subckt.each_pair{|f, c|
      puts "#{f}: #{c}"
    }
  end

  def convert params
    new_l = ''
    params.scan(/(\S+)=(\S+)/).each{|p, v|
      if v=~ /['{](\S+)['}]/
        new_l << " #{p}="+'#{eval_params('+ v +', params)}'
      else
        new_l << " #{p}="+'#{params[' + "'#{v}'" + ']' + "||'#{v}'}"
      end
    }
    new_l
  end

  def translate l, nets
    if l =~ /^[xX](\S*) +([^=]*) +([^=]+) +(\S+ *=.+$)/
      inst = $1
      n = $2.split
      s = $3
      p = $4
      new_l = [inst, s, n]
      new_l << convert(p)
    elsif l =~ /(^\S+) +([^=]*) +([^=]+) +(\S+ *=.+$)/
      inst = $1
      n = $2
      m = $3
      p = $4
      if inst[0].downcase == 'r' || inst[0].downcase == 'c' 
        v = '#{params[' + "'#{m}'" + ']' + "||'#{m}'}"
        new_l = [inst, n, v]
      else
        new_l = [inst, n, m]
      end
      new_l << convert(p)
    else
      new_l = l
    end
    new_l
  end

  def expand
    return @lines if @subckt.size == 0
    desc = ''
    @lines.each_line{|l|
      if l =~ /^\*/ || l =~ /^\./
        #puts l
        desc << l
      elsif l =~ /(^\S+) +([^=]*) +([^=]+) +(\S+ *=.+$)/
        inst = $1
        nets = $2.split
        sub_name = $3
        params = $4.scan(/(\S+) *= *(\S+)/)
        # puts "#{inst} nets: #{nets}"
        if inst[0].downcase == 'x'
          inst_params = @subckt[sub_name][2] # instance defaults
          params.each{|p, v| 
            inst_params[p] = v
          }
          # puts "instance: #{inst_params}"
          # puts "subckt: #{subckt_name} inst_params: #{inst_params}"
          # subckt_nets = @subckt[subckt_name][0]
          #puts '*' + l
          desc << '*' + l
          desc << substitute(sub_name, nets, inst, inst_params)
        else
          model_name = sub_name
          #puts l
          desc << l
          #puts "model: #{model_name} inst_params: #{inst_params}"
        end
      else # including subckt call w/o params and '+' continuation
        #puts l 
        desc << l
      end
    }
    desc
  end

  def substitute name, inst_nets, inst_name, params
    desc = ''
    nets = @subckt[name][0]
    map = {}
    nets.each_with_index{|n, i|
      map[n] = inst_nets[i]
    }
    # puts 'map:', map.inspect
    contents = @subckt[name][1]
    contents.each{|l|
      inst, nets, sub_name, sub_params = l
      #puts "sub_params=#{sub_params}"
      #puts "inst_params=#{params}"
      inst_params = eval('"' + sub_params + '"')
      #puts '=>', inst_params
      new_nets = []
      nets.split.each{|n|
        new_nets << (map[n] || "#{inst_name}:#{n}")
      }
      new_value = eval('"' + sub_name + '"')
      #puts ([inst+'.'+inst_name]+new_nets+[new_value]).join(' ')+inst_params
      desc << ([inst+'.'+inst_name]+new_nets+[new_value]).join(' ')+inst_params + "\n"
    }
    desc
  end

  def eval_params equation, params
    # puts "*equation: #{equation} @ #{params}"
    equation # temporarily return as is
  end
end

#file = 'TOP.spice'
##file = 'SerPar_tb.net.txt' # 'haruna_ab_tb.net.txt'
#lines = File.open(file, 'r:Windows-1252').read.encode('UTF-8').gsub(181.chr(Encoding::UTF_8), 'u')
#ckt = SubcktParams.new lines
#lines = ckt.expand
#puts lines

class MinedaLVS
  include RBA # unless $0 == __FILE__
  require 'fileutils'
  require 'yaml'
  def get_params netlist
    p = {}
    File.open(netlist, 'r:Windows-1252').read.encode('UTF-8', invalid: :replace).each_line{|l|
      l.gsub! 00.chr, ''
      if l.upcase =~/\.PARAM\S* (\S+.*$)/
        params = $1
        params.split.each{|equation|
          equation =~ /(\S+) *= *(\S+)/
          p[$1] = $2
        }
      end
    }
    p
  end

  def expand_file file, lines
    #has_res3 = nil
    # File.open(file, 'r:Windows-1252').read.encode('UTF-8', invalid: :replace).each_line{|l|
    #File.open(file, 'rb:UTF-16LE').read.encode('UTF-8').gsub(181.chr(Encoding::UTF_8), 'u').each_line{|l|
    #File.open(file, 'rb:UTF-16LE').read.encode('UTF-8').each_line{|l|
    File.open(file, 'r:Windows-1252').read.encode('UTF-8').gsub(181.chr(Encoding::UTF_8), 'u').each_line{|l|
      puts l
      if l.chop =~ /.inc\S* +(\S+)/
        include_file = $1
        lines << '*' + l
        if File.exist? include_file
          # lines, has_res3_sub = expand_file(include_file, lines)
          lines = expand_file(include_file, lines)
          # has_res3 ||= has_res3_sub
        end
      #elsif (has_res3 == nil) && l =~/^ *[xX][rR]\S* +([^=]*) +(\S+=\S+)/
      #  if $1 && $1.strip.split(/ +/).size >=4
      #    has_res3 = true
      #  end
      #  lines << l
      else
        lines << l
      end
    }
    # puts "*** #{file}:"
    # puts lines
    #[lines, has_res3]
    lines
  end

  def lvs_go target_technology, settings = {}
    app = Application.instance
    mw = app.main_window
    cv = mw.current_view.active_cellview
    raise "You are running #{target_technology} version of 'get_reference' against #{cv.technology} layout" unless cv.technology == target_technology
    raise 'Please save the layout first' if cv.nil? || cv.filename.nil? || cv.filename == ''
    cell = cv.cell
    netlist = QFileDialog::getOpenFileName(mw, 'Netlist file', File.dirname(cv.filename), 'netlist(*.net *.cir *.spc *.spice *.spi *.sp *.cdl)')
    if netlist && netlist.strip != ''
      netlist = netlist.force_encoding('UTF-8')
      # netlist = '/home/seijirom/Dropbox/work/LRmasterSlice/comparator/COMP_NLF.net'
      # raise "#{netlist} does not exist!" unless File.exist? netlist
      Dir.chdir File.dirname(cv.filename).force_encoding('UTF-8')
      ext_name = File.extname cv.filename
      target = File.basename(cv.filename).sub(ext_name, '')
      Dir.mkdir 'lvs_work' unless File.directory? 'lvs_work'
      reference = File.join('lvs_work', "#{target}_reference.cir.txt")
      ref={'target' => target, 'reference'=> reference, 'netlist'=> netlist, 'schematic' => netlist.sub('.net', '.asc')}
      File.open(target+'.yaml', 'w'){|f| f.puts ref.to_yaml}
      desc = ''
      cells = []
      circuit_top = nil
      device_class = {}
      #lines, has_res3 = expand_file netlist, ''
      lines = expand_file netlist, ''
      unless settings[:do_not_expand_sub_params] # == cv.technology
        ckt = SubcktParams.new lines
        lines = ckt.expand
      end
      params = get_params netlist
      puts "params: #{params.inspect}"
      c = File.open(File.join('lvs_work', File.basename(netlist))+'.txt', 'w:UTF-8')
      prev_line = ''
      comment_subckt = inside_subckt = false
      subckt_params = []
      lines.each_line{|l|
        l.gsub! 00.chr, ''
        l.tr! "@%-", "$$_"
        l.gsub! /([0-9][eE])_([0-9])/, '\1-\2' # revert 1E_6 to 1E-6
        c.puts l
        if l =~ /{(\S+)}/
          ov = $1
          rv = params[ov.upcase] || ov  #  calculation for ov like (6u*20u) should be implemented
          l.sub! "{#{ov}}", rv
        end
        puts "l=#{l}"
        if block_given?
          nl = yield(l)
          if nl != l
            print "=> #{nl}"
            l = nl
          end
        end
        # if l=~ /(\S+)@or1_stdcells_v1/
        #  cells << $1 unless cells.include? $1
        #  l.sub! '@', '$'
        # elsif l =~ /^ *\.inc/ || l =~ /^ *([iI]|[vV])/
        #   l.sub! /^/, '*'
        #  els
        if l =~ /^\.ends/
          inside_subckt = false
          desc << '***' if comment_subckt
          comment_subckt = false
        elsif l=~/^\.subckt *(\S+)/
          subckt_name = $1
          inside_subckt = true
          subckt_params = l.scan /(\S+)=(\S+)/
          unless settings[:do_not_expand_sub_params] == cv.technology
            l.sub! /\S+=.*$/, ''
          end
          if subckt_name.upcase == cell.name.upcase
            circuit_top = subckt_name
          else
            circuit_top ||= subckt_name
          end
          puts "subcircuit: #{$1}"
          if (pattern = settings[:dump_subckt_model]) && subckt_name =~ /#{pattern}/
            comment_subckt = true
            puts '===> *** commented out'
          end
        elsif l=~/^(([mM]\S+) *\S+ *\S+ *\S+ *\S+ *(\S+)) *(.*)/
          body = $1
          name=$2
          model = $3
          others = ($4 && $4.upcase)
          if  (settings[:do_not_expand_sub_params] &&
               settings[:do_not_expand_sub_params]  != cv.technology)
            subckt_params.each{|a, b| puts others.sub!(/=#{a}/, "=#{b}")}
          end
          # device_class['NMOS'] = model if model && model.upcase =~ /NCH|NMOS/
          # device_class['PMOS'] = model if model && model.upcase =~ /PCH|PMOS/
          p = {}
          if subckt_params.size == 0 # subcircuit parameters not present
            others && others.split.each{|equation|
              if equation =~ /(\S+) *= *{(\S+)}/
                ov = $2
                p[$1] = params[ov.upcase] || ov
              elsif equation =~ /(\S+) *= *(\S+)/
                p[$1] = params[$2] || $2
              end
            }
            if p['M'] && p['M'] > "1"
              if p['W'] =~ /([^U]+) *(U*)/
                new_w  = "#{$1.to_f * p['M'].to_f}#{$2}"
                puts "Caution for #{name}: w=#{p['W']} replaced with w=#{new_w} because m=#{p['M']}"
                p['W'] = new_w
                p['M'] = '1'
              end
            end
            # others = p.map{|a| "#{a[0]}=#{a[1]}"}.join ' '
            if p['L'] == nil || p['W'] == nil
              raise "Error: L or W is not given for '#{body}'" 
            end
            others = "l=#{p['L']} w=#{p['W']}" # supress other parameters like as, ps, ad and pd
            others << " m=#{p['M']}" if p['M']
          end
          l = "#{body} #{others}\n"
        elsif l =~ /^ *(([rR]|[cC]|[dD])\S+ +\S+ +\S+) +(\S+)($| +(.*)$)/ || l.downcase =~ /^ *\.(global|subckt|ends)/
          body = $1
          value = $3
          rest = $5
          puts "value=#{value} rest=#{rest}@ #{l}&subckt_params=#{subckt_params}"
          if l.sub!(/\$\[\S*\] */, '') # special for CDL
            if rest =~ /[mM] *= *(\S+)/
              m = $1.to_i
            if m != 1
                if value =~ /(\S+)[kK]/
                  val = $1.to_f
                  l.sub! /#{value}.*$/, "#{val/m}K"
                else
                  val = value.to_f
                  l.sub! /#{value}.*$/, "#{val/m}"
                end
              else
                l.sub! /#{value}.*$/, "#{value}"
              end
            end          
          end
          if  (settings[:do_not_expand_sub_params] &&
               settings[:do_not_expand_sub_params]  != cv.technology)          
            subckt_params.each{|a, b| puts value.sub!(/#{a}/, "#{b}")}
            l = "#{body} #{value} #{rest}\n"
          end
        elsif l =~ /^ *[xX]/
           l.sub!(/ \/ /, ' ') # special for CDL => bug fixed 2023/11/24
          if  (settings[:do_not_expand_sub_params] &&
               settings[:do_not_expand_sub_params]  != cv.technology)
            l.sub! /\S+=.*$/, ''
          end
          circuit_top ||= '.TOP'  unless inside_subckt
          #if has_res3 && l=~/^ *[xX][rR]/
          #  l.sub! /^ *[xX]/, ''
          #end
        else
          l.sub! /^/, '*' if !(l =~ /^ *\+/) || prev_line =~ /^ *\*/ # comment_subckt
        end
        break if l.upcase.strip == '.END'
        prev_line = l
        desc << '***' if comment_subckt
        desc << l.upcase if l
      }
      circuit_top = circuit_top ? circuit_top.upcase : '.TOP'
      puts "circuit_top => #{circuit_top}"
      c.close
      File.open(reference, 'w:UTF-8'){|f| 
        f.puts desc
        f.puts '.GLOBAL 0'
        f.puts '.END'
      }
      # slink = File.join('lvs_work', reference+'.txt')
      # File.delete slink if File.exist?(slink) 
      # if /mswin32|mingw/ =~ RUBY_PLATFORM
      #   File.link reference, slink
      # else
      #   File.symlink "../#{File.basename reference}", slink
      # end

      puts "#{reference} created under #{Dir.pwd}"
      ['macros', 'pymacros', 'python', 'ruby', 'drc'].each{|f| FileUtils.rm_rf f if File.directory? f}
      if cells.size > 0
        or1_cells = %[an21 an31 an41 buf1 buf2 buf4 buf8 cinv clkbuf1 clkbuf2 clkinv1 clkinv2 dff1 exnr exor
                     inv1 inv1 ~inv2 inv4 inv8 na21 na212 na222 na31 na41 nr21 nr212 nr222 nr31 or21 or31
                     rff1 sdff1 sff1 srff1 ssff1]
        File.open('lvs_work/lvs_settings.rb', 'w'){|f|
          f.puts 'def lvs_settings'
          f.puts "  same_circuits '#{cell.name}', '#{circuit_top ? circuit_top.upcase : '.TOP'}'"
          cells.each{|c|
            if or1_cells.include? c
              f.puts "  same_circuits '#{c}', '#{c.upcase}$OR1_STDCELLS_V1'"
            end
          }
          f.puts "  netlist.make_top_level_pins"
          f.puts "  netlist.flatten_circuit 'Nch*'"
          f.puts "  netlist.flatten_circuit 'Pch*'"
          f.puts 'end'
        }
      end
      settings_file = "lvs_work/#{target}_lvs_settings.rb"
      if version = settings[:version]
        if File.exist?(settings_file) && File.exist?(stamp_file = 'lvs_work/get_reference_version.txt')
          stamp = File.read(stamp_file).to_f
          if version > stamp
            set_settings cell, circuit_top, device_class, settings_file, settings
          end
        else
          set_settings cell, circuit_top, device_class, settings_file, settings
        end
      else
        unless File.exist? settings_file
          set_settings cell, circuit_top, device_class, settings_file, settings
        end
      end
    end
  end

  def set_settings cell, circuit_top, device_class, file, settings
    if version = settings[:version]
      File.open(File.join(File.dirname(file), 'get_reference_version.txt'), 'w') {|f| f.puts version}
    end
    if File.exist? file
      FileUtils.mv file, file.sub('.rb', '_KEEP.rb')
    end
    cell_name = cell.name
    File.open(file, 'w'){|f|
      if  settings[:exclude_layer]
        ln, dt = settings[:exclude_layer]
        blank_layout = settings[:blank_layout]
        f.puts "def set_blank_layout layer_number=#{ln}, data_type=#{dt}"
        f.puts "  source.layout.technology_name='#{cell.layout.technology_name}'"
        f.puts "  unless source.cell_name == '#{cell_name}'"
        f.puts '    raise "Invalid set_blank_layout for #{source.path}[#{source.cell_name}]"'
        f.puts '  end'
        if blank_layout
          f.puts "  blank_layout = '#{blank_layout}'" 
        else
          f.puts "  blank_layout = nil"
        end
        f.puts '  if blank_layout'
        f.puts '    dh = MinedaCommon::DRC_helper.new'
        f.puts '    dh.find_cells_to_exclude [layer_number, data_type], blank_layout, 0'
        f.puts '    exclude = input layer_number, data_type'
        f.puts '  else'
        f.puts '    exclude = input'
        f.puts '  end'
        f.puts 'end'
      end
      f.puts 'def lvs_settings'
      f.puts "  same_circuits '#{cell_name}', '#{circuit_top ? circuit_top.upcase : '.TOP'}'" if cell_name
      f.puts "  netlist.make_top_level_pins"
      settings[:flatten_circuit] && settings[:flatten_circuit].each{|c|
        f.puts "  netlist.flatten_circuit '#{c}'"
      }
      f.puts "  align"
      settings[:device] && device_class.merge!(settings[:device])
      device_class.each_pair{|p, q|
        if q.class == Array
          q.each{|r|
            f.puts "  same_device_classes '#{p}', '#{r.upcase}'" if r
          }
        else
          f.puts "  same_device_classes '#{p}', '#{q.upcase}'" if q
        end
      }
      settings[:tolerance] && settings[:tolerance].each_pair{|d, spec|
        spec.each_pair{|p, v|
          specs = []
          v.each_pair{|name, tol|
            case name
            when :relative
              specs << ':relative => ' + tol.to_s
            when :absolute
              specs << ':absolute => ' + tol.to_s
            end
          }
          f.puts "  tolerance '#{d}', '#{p}', #{specs.join(', ')}"
        }
      }
      f.puts "  netlist.combine_devices"
      f.puts "  schematic.combine_devices"
      f.puts 'end'
      if virtual_connections = settings[:virtual_connections]
        f.puts "def vc_settings"
        f.puts "  virtual_connections = #{virtual_connections}"
        f.puts "  virtual_connections.each{|vc|"
        f.puts "    connect_implicit vc"
        f.puts "  }"
        f.puts "end"
      end
    }
  end
end

class MinedaAutoPlace
  include RBA
  def initialize opts={}
    puts "Notice your settings: #{opts.map{|a, b| '@' + a.to_s + '=' + b.to_s}.join ','}" 
    app = Application.instance
    @mw = app.main_window
    unless lv = @mw.current_view
      raise "Shape Statistics: No view selected"
    end
    @asc_file = QFileDialog::getOpenFileName(@mw, 'Schematic file', ENV['HOME'], 'asc file(*.asc)')
    raise 'Cancelled' if @asc_file.nil? || @asc_file == ''
    @cell = lv.active_cellview.cell
    technology = lv.active_cellview.technology
    @pcell_lib = opts[:pcell_lib] || 'PCells_' + technology
    @res = opts[:res] || 'HR_poly'
    @cap = opts[:cap] || 'Pdiff_cap'
    @grid = (opts[:grid] || 0.5)*1000
    @xscale = opts[:xscale] || 100*2
    @yscale = opts[:yscale] || 100*3
    @wmax = opts[:wmax] || 200
  end
  def library_cell name, libname, layout
    if cell = layout.cell(name)
      return cell.cell_index
    else
      lib = Library::library_by_name libname
      #cell_index = lib.layout.cell_by_name(name)
      #proxy_index = layout.add_lib_cell(lib, cell_index)
      pcell_id = lib.layout.pcell_id(name)
      proxy_index = layout.add_pcell_variant(lib, pcell_id, {'l'=>1,'w'=>1,'m'=>1})
    end
  end
  def instantiate index, x, y
    CellInstArray.new(index, Trans.new(x, y))
  end
  def ltspice_read file
    if File.open(file).read(2)[1] == 0.chr
      lines = File.open(file, 'r:UTF-16LE:UTF-8').read
    else
      lines = File.read(file)
    end
  end
  def each_element file
    sym=x=y=rot=name=l=w=m=nil
    xmax=ymax=0
    if File.extname(file).downcase == '.asc' # LTspice
      ltspice_read(file).each_line{|line|
        line.chomp!
        if line =~ /SYMBOL (\S+) (\S+) (\S+) (\S+)/
          sym1 = $1
          x2 = $2.to_i
          y3 = $3.to_i
          rot4=$4
          yield sym, name, l, w, m ? m : 1, x, y, rot, xmax, ymax if name
          sym = sym1
          x = x2
          y = y3
          rot = rot4
        elsif line =~ /SYMATTR InstName (\S+)/
          name = $1
        elsif line =~ /SYMATTR (SpiceLine|Value2) +[lL]=(\S+)[uU] +[wW]=(\S+)[uU] +[mM]=(\S+)/ ||
              line =~ /SYMATTR (SpiceLine|Value2) +[lL]=(\S+)[uU] +[wW]=(\S+)[uU]/
          l=$2.to_f
          w=$3.to_f
          m= $4? $4.to_i : 1
        # yield sym, name, l, w, m ? m : 1, x, y, rot, xmax, ymax
        elsif line =~ /SHEET 1 (\S+) (\S+)/
          xmax = $1.to_i
          ymax = $2.to_i
        end
      }
      yield sym, name, l, w, m ? m.to_i : 1, x, y, rot, xmax, ymax
    else
      raise 'autoplace now supports LTspice schematic only'
    end
  end
  
  def autoplace
    layout = @cell.layout

    nch_index = library_cell('Nch', @pcell_lib, layout)
    pch_index = library_cell('Pch', @pcell_lib, layout)
    res_index = library_cell(@res, @pcell_lib, layout)
    cap_index = library_cell(@cap, @pcell_lib, layout)

    each_element(@asc_file){|sym, name, l, w, m, x, y, rot, xmax, ymax|
      instance = nil
      @cell.each_inst{|inst|
        if inst.property('name') == name
          instance = inst
          break
        end
      }
      if instance.nil?
        puts "#{name}: l=#{l} w=#{w} m=#{m ? m : 1} @ (#{x}, #{y}), #{rot}"
        if sym =~ /NMOS|nmos/ #  'MinedaLIB\\NMOS_MIN'
          index = nch_index
        elsif sym =~ /PMOS|pmos/
          index = pch_index
        elsif sym =~ /RES|res/
          index = res_index
          l = nil
        elsif sym =~ /CAP|cap/
          index = cap_index
          l = nil
        end
        if index
          mos = instantiate index, 0, 0
          inst = @cell.insert(mos)
          inst.set_property 'name', name
          xpos = x*@xscale/@grid.to_i*@grid
          ypos = (ymax - y)*@yscale/@grid.to_i*@grid
          case rot
          when 'R0'
            inst.transform Trans.new(Trans::R0, xpos, ypos)
          when 'R90'
            inst.transform Trans.new(Trans::R90, xpos, ypos)
          when 'R180'
            inst.transform Trans.new(Trans::R180, xpos, ypos)
          when 'R270'
            inst.transform Trans.new(Trans::R270, xpos, ypos)
          when 'M0'
            inst.transform Trans.new(Trans::M90, xpos, ypos)
          when 'M90'
            inst.transform Trans.new(Trans::M135, xpos, ypos)
          when 'M180'
            inst.transform Trans.new(Trans::M0, xpos, ypos)
          when 'M270'
            inst.transform Trans.new(Trans::M45, xpos, ypos)
          end
        else
          puts "warning: instance #{name} does not have a valid symbol"
        end
      else
        inst = instance
        old_l = inst.pcell_parameter  'l'
        old_w = inst.pcell_parameter  'w'
        old_n = inst.pcell_parameter  'n'
        next if old_l == l && old_w == w && old_n == m
        puts "Change #{name} to l=#{l}, w=#{w}, n=#{m}"
      end
      if l && inst
        w, m = adjust w, m, @wmax
        inst.change_pcell_parameter 'l', l
        inst.change_pcell_parameter 'w', w
        inst.change_pcell_parameter 'n', m
      end
    }
    @mw.cm_zoom_fit
  end
  def adjust w, n, wmax, wmin = wmax/100
    return [w, n] if w <= wmax
    wtotal = w * n
    n = (wtotal/wmax).to_i
    puts "wtotal=#{wtotal} n=#{n} w=#{w}"
    w = wtotal/n
    while w > wmax || (w*n != wtotal && w > wmin)
      puts "#{w}*#{n} vs. #{wtotal}"
      n = n + 1
      w = (wtotal / n).to_i.to_f
    end
    [w, n]
  end
      
end

class MinedaBridge
  include RBA
  def initialize
    app = RBA::Application.instance
    mw = app.main_window
    lv = mw.current_view
    if lv == nil
      raise "No view selected"
    end
    @cv = lv.active_cellview
    if !@cv.is_valid?
      raise "No cell or no layout found"
    end
  end
  
  def metalize_bridges value
    metalize_bridges0 @cv.cell, value
  end
  
  def metalize_bridges0 cell, value
    cell.each_inst{|inst|
      if inst.cell.name.include?('Bridge') || inst.cell.name.include?('Nbridge')
        inst.change_pcell_parameter 'mb', value
      elsif inst.cell.child_instances > 0
        metalize_bridges0 inst.cell, value
      end
      puts inst.pcell_parameters_by_name
    }
  end
end

if nil && $0 == __FILE__
  settings = {
    device: {HRES: 'RES', RES: 'RES'},
    tolerance: {HRES: {R: {relative: 0.03}},
                RES: {L: {relative: 0.03}, W: {relative: 0.03}},                
                CAP: {C: {relative: 0.03, absolute: 1e-15}}},
    flatten_circuit: ['Nch*', 'Pch*', 'R_poly*', 'HR_poly']
  }
  MinedaLVS.new.set_settings nil, nil, {}, '/dev/stdout', settingsend
end
