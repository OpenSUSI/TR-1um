# coding: cp932
# MinedaPCell v1.05, June 13th, 2025 copy right S. Moriyama (Anagix Corporation)
module MinedaPCell
  version = 1.05
  include MinedaPCellCommonModule
  # The PCell declaration for the Mineda MOSFET
  class MinedaMOS < MinedaPCellCommon

    include RBA
    def initialize
      # Important: initialize the super class
      super
      param(:n, TypeInt, "Number of fingers", :default => 1)
      param(:no_finger_conn, TypeBoolean, "No finger connections", :default => false)
    end

    def coerce_parameters_impl

      # We employ coerce_parameters_impl to decide whether the handle or the
      # numeric parameter has changed (by comparing against the effective
      # radius ru) and set ru to the effective radius. We also update the
      # numerical value or the shape, depending on which on has not changed.
    end

    # default implementation
    def can_create_from_shape_impl
      false
    end

    def parameters_from_shape_impl
    end

    def transformation_from_shape_impl
      # I「Create PCell from shape（形状からPCellを作成）」プロトコルを実装します。
      # 変形を決定するために、図形のバウンディングボックスの中心を使用します。
      Trans.new(shape.bbox.center)
    end

    def coerce_parameters_impl
      set_wtot(w*n)
    end

    def produce_impl_core indices, vs, u1, params = {}
      oo_layout_dbu = 1 / layout.dbu
      gw = (w * oo_layout_dbu).to_i
      gl = (l*oo_layout_dbu).to_i
      vo = params[:vs_overhead] || 0
      dgl = ((dg || 0.0)*oo_layout_dbu).to_i
      vs_extra = params[:vs_extra] || 0
      if gw < vs + vs_extra - vo  # dgl: dumbbell gap length
        dgl = [dgl, ((dsl*oo_layout_dbu).to_i - gl)/2].max if defined? dsl # dsl: minimum dumbbell shaft length
      else
        dgl = [dgl,  ((sdg*oo_layout_dbu).to_i - gl)/2].max if defined? sdg # sdg: minimum source-drain gap
      end
      xshift = params[:xshift] || vs/2
      yshift = params[:yshift] || vs/2
      u1cut = params[:u1cut] || 0
      gate_ext = params[:gate_ext] || vs/2 + u1/8
      sd_width = [gw, vs + vs_extra].max
      offset = 0
      m1cnt_width = params[:m1cnt_width] || vs
      if (defined?(ld_length) && ld_length > 0.0) || (defined?(rd_length) && rd_length > 0.0)
        dcont_for_dummy = layout.cell(indices[:dcont]).dup
        dcont_for_dummy.clear(layout.find_layer(get_layer_index('ML1', false), 0))
        dcont_for_dummy.clear(layout.find_layer(get_layer_index('CNT', false), 0))
      end
      ldl = rdl = 0
      # left dummy
      if defined?(ld_length) && ld_length > 0.0 # left_dummy_length
        ldl = [ (ld_length*oo_layout_dbu).to_i, gl].min
        x = -ldl/2 -  dgl - xshift
        create_path(indices[:pol], x, vs-yshift+u1, x, vs-yshift+u1+sd_width, ldl, gate_ext, gate_ext)
        x = -ldl - dgl*2 - m1cnt_width/2 - xshift
        create_dcont(dcont_for_dummy.cell_index, x, vs-yshift+u1, x, vs-yshift+u1+sd_width, vs + vs_extra, params[:dcont_offset])
      end
      (n+1).times{|i|
        x = offset + m1cnt_width/2 - xshift
        if !no_finger_conn || with_sdcont  || i == 0 ||  i == n
          create_path(indices[:m1], x, vs-yshift+u1+u1cut, x, vs-yshift+u1-u1cut+sd_width, m1cnt_width, 0, 0)
          create_path(indices[:li1], x, vs-yshift+u1+u1cut, x, vs-yshift+u1-u1cut+sd_width, u1, 0, 0) if indices[:li1]
          create_dcont(indices[:dcont], x, vs-yshift+u1, x, vs-yshift+u1+sd_width, vs + vs_extra, params[:dcont_offset])
        end
        x = x + m1cnt_width/2 + gl/2 + dgl
        if i < n
          create_path(indices[:pol], x, vs-yshift+u1, x, vs-yshift+u1+sd_width, gl, gate_ext, gate_ext)
          if indices[:gate_impl]
            gim = params[:gate_impl_margin] || vs/2
            create_path(indices[:gate_impl], x, vs-yshift+u1, x, vs-yshift+u1+sd_width, gl+gim*2, gate_ext+gim, gate_ext+gim)
          end
        end
        offset = offset + m1cnt_width + gl + 2*dgl
      }
      # right dummy
      if defined?(rd_length) && rd_length > 0.0 # right_dummy_length
        rdl = [(rd_length*oo_layout_dbu).to_i, gl].min
        x = x - gl/2 + rdl/2
        create_path(indices[:pol], x, vs-yshift+u1, x, vs-yshift+u1+sd_width, rdl, gate_ext, gate_ext)
        x = x + m1cnt_width/2 + rdl/2 + dgl
        create_dcont(dcont_for_dummy.cell_index, x, vs-yshift+u1, x, vs-yshift+u1+sd_width, vs + vs_extra, params[:dcont_offset])
      end
      x1 = 0
      if defined?(ld_length) && ld_length > 0.0
        x1 = - ldl - 2*dgl - m1cnt_width
      end
      x2 = offset - gl - 2*dgl
      if defined?(rd_length) && rd_length > 0.0
        x2 = x2 + rdl + 2*dgl + m1cnt_width
      end
      if gw > vs + vs_extra
        create_box indices[:diff], x1-xshift, vs-yshift+u1, x2 - xshift, vs-yshift+u1+gw
      else
        create_box indices[:diff], x1-xshift, vs-yshift+u1+(vs+vs_extra)/2-gw/2, x2 - xshift, vs-yshift+u1+gw+(vs+vs_extra)/2-gw/2
      end
      yield -xshift, -yshift, vs*2+gl-xshift, (vs+u1)*2+sd_width-yshift, gl, gw, dgl, m1cnt_width, ldl, rdl
    end

    def library_cell name, libname, layout
      if cell = layout.cell(name)
        return cell.cell_index
      else
        lib = Library::library_by_name libname
        cell_index = lib.layout.cell_by_name(name)
        proxy_index = layout.add_lib_cell(lib, cell_index)
      end
    end
  end

  class MinedaNch < MinedaMOS
    include RBA

    def display_text_impl # name='Nch'
      "#{name}\r\n(L=#{l.round(3)}um,W=#{w.round(3)}um,n=#{n.to_s},Total W=#{wtot.round(3)}um)"
    end

    def produce_impl indices, vs, u1, params = {} # NMOS
      produce_impl_core(indices, vs, u1, params){|x1, y1, x2, y2, gl, gw, dgl, m1cnt_width, ldl, rdl|
        # create ncon
        wm_offset = defined?(wide_metal) && wide_metal ? params[:wm_offset] || u1 : 0
        via_offset = params[:via_offset] || 0
        x = x1 + vs/2
        pcont_dy = params[:pcont_dy] || u1/4
        y = y2 - vs/2 + pcont_dy
        gate_ext = params[:gate_ext] || 0
        mw1 = params[:m1_width] || u1
        m1cnt_width = params[:m1cnt_width] || vs
        if defined?(wide_metal) &&wide_metal
          x = x - u1
          y = y + u1/2
        end
        if with_pcont
          pol_width = params[:pol_width] || u1 + u1/4
          pol_width = [gl, vs/2].max if pol_width > gl            
          if n == 1 && !with_sdcont
            insert_cell indices[:pcont], x1+vs+dgl+gl/2, y
            insert_cell indices[:via], x1+vs+dgl+gl/2, y if with_via
            x3 = x1+vs+dgl+gl/2
            create_path indices[:pol], x3, y, x3, y2-vs + gate_ext - u1, vs, 0,0
          else
            pcont_inst = insert_cell indices[:pcont], x, y
            pcont_size = params[:pcont_pol_size] || pcont_inst.bbox.width
            insert_cell indices[:via], x, y if with_via
            y = y - pcont_size/2 + [pol_width, u1].max/2
            x3 = x1+m1cnt_width+dgl+[pol_width, u1].max/2
            create_path2 indices[:pol], x, y, x3, y, x3, y2-vs + gate_ext - u1, [pol_width, u1].max, 0, 0
          end
        end
        offset = x1
        top = nil
        bottom = nil
        prev_pol = nil
        (n+1).times{|i|
          x = offset + vs/2
          y = y2 - vs + u1/2 + gate_ext - u1
          unless no_finger_conn
            create_path indices[:pol], prev_pol-vs/2-gl-dgl, y , x-vs/2-dgl, y, u1, 0, 0 if prev_pol
          end
          prev_pol = x if i >= 1
          if i % 2 == 0
            # first s/d and via
            y = y1+vs/2 - wm_offset -via_offset
            if !no_finger_conn && (with_sdcont || n != 1)
              insert_cell indices[:via], x, y if with_via && with_sdcont  
              create_path indices[:m1], x, y, x, y1+vs+2*u1, mw1, 0, 0
            end
            if top
              create_path indices[:m1], top, y, x, y, mw1, mw1/2, mw1/2 unless no_finger_conn
            end
            top = x
          else
            # second s/d and via
            if n == 1
              insert_cell indices[:via], x, y2-vs/2 + (defined?(wide_metal) &&wide_metal ? u1/2 : 0) + via_offset if with_via && with_sdcont
              y = y2-vs/2
            else
              insert_cell indices[:via], x, y2+u1-vs/2 + via_offset if with_via && with_sdcont && !no_finger_conn
              y = y2+u1-vs/2
            end
            create_path indices[:m1], x, y2-vs-2*u1 - wm_offset - via_offset, x, y, mw1, 0, 0 if !no_finger_conn && (with_sdcont || n != 1)
            if bottom
              y = y2+u1-vs/2
              create_path indices[:m1], bottom, y, x, y, mw1, mw1/2, mw1/2 unless no_finger_conn
            end
            bottom = x
          end
          offset = offset + m1cnt_width + gl + 2*dgl
        }
        offset = offset - 2*dgl
        # psubcont and via
        psubcont_dx = params[:psubcont_dx] || 0
        psubcont_dy = params[:psubcont_dy] || u1/2 + u1
        x = offset - gl - vs/2 + (with_via ? u1/2 : u1/4) + psubcont_dx
        if with_psubcont && use_pwell
          if n % 2 == 0
            y = y2 - vs/2 + psubcont_dy
          else
            y = y1 + vs/2 - psubcont_dy
            y = y - u1/2 if defined?(wide_metal) && wide_metal
          end
          insert_cell indices[:psubcont], x, y, false, params[:psubcont_bbox] if indices[:psubcont]
          insert_cell indices[:via], x, y if with_via
        end
        x1 = x1 - m1cnt_width - ldl - 2*dgl if ldl > 0
        offset = offset + m1cnt_width + rdl + 2*dgl if rdl > 0
        #create_box indices[:narea], x1-u1, y1+vs+u1/2, offset-gl+u1, y2-vs-u1/2
        area_ext = params[:area_ext] || 0
        narea_bw = params[:narea_bw] || u1 + u1/4
        create_box indices[:narea], x1-narea_bw, y1+vs+u1-narea_bw, offset-gl+narea_bw, y2-vs-u1+narea_bw+area_ext
        # create_box indices[:lvhvt], x1-narea_bw, y1+vs+u1-narea_bw, offset-gl+narea_bw, y2-vs-u1+narea_bw if indices[:lvhvt]
        create_box indices[:nhd], x1-narea_bw, y1+vs+u1-narea_bw, offset-gl+narea_bw, y2-vs-u1+narea_bw if indices[:nhd] # special for PTS06
        delta = params[:nex_delta] || u1*5
        if indices[:nex]
          create_box indices[:nex], x1-delta, y1+vs-u1/2-delta-u1, offset-gl+delta, y2-vs+u1/2+delta+u1
          delta = delta + delta
          create_box indices[:ar], x1-delta, y1+vs-u1/2-delta-u1, offset-gl+delta, y2-vs+u1/2+delta+u1 if indices[:ar]
        end
        if indices[:pwl] && use_pwell
          if one = params[:pwl_bw]
            if indices[:nex]
              create_box indices[:pwl], x1-delta-one, [y1+vs-u1/2-delta-u1-one, y2-vs+u1/2+delta+u1-4*one].min,
                    [offset-gl+delta+one, x1-delta+4*one].max, y2-vs+u1/2+delta+u1+one+area_ext
            else
              create_box indices[:pwl], x1-delta-one, y1+vs+u1-delta-one, offset-gl+delta+one, y2-vs-u1+delta+one+area_ext
            end
          end
        end
      }
    end
  end

  class MinedaNch_SOI < MinedaNch
    include RBA

    def produce_impl indices, vs, u1, params = {} # NMOS_SOI
      produce_impl_core(indices, vs, u1, params){|x1, y1, x2, y2, gl, gw, dgl, m1cnt_width|
        # create ncon
        wm_offset = defined?(wide_metal) && wide_metal ? params[:wm_offset] || u1 : 0
        
        x = x1 + vs/2
        pcont_dy = params[:pcont_dy] || u1/4
        y = y2 - vs/2 + pcont_dy
        gate_ext = params[:gate_ext] || 0
        if defined?(wide_metal) && wide_metal
          x = x - u1
          y = y + u1/2
        end
        if with_pcont
          pol_width = params[:pol_width] || u1 + u1/4
          if n == 1 && !with_sdcont
            insert_cell indices[:pcont], x1+vs+dgl+gl/2, y
            insert_cell indices[:via], x1+vs+dgl+gl/2, y if with_via
            create_path indices[:pol], x1+vs+dgl+gl/2, y, x1+vs+dgl+gl/2, y2-vs + gate_ext - u1, vs, 0,0 if soi_bridge
          else
            insert_cell indices[:pcont], x, y
            insert_cell indices[:via], x, y if with_via
            y = y #- u1/2 # necessary to eliminate POL gap error
            x0 = x1+vs+gl/2+dgl
            unless no_finger_conn
              if soi_bridge
                create_path2 indices[:m1], x, y, x0, y, x0, y2-vs + gate_ext - u1, pol_width, 0, 0
                create_path2 indices[:pol], x, y, x0, y, x0, y2-vs + gate_ext - u1, pol_width, 0, 0  if gl > vs
              else
                create_path2 indices[:pol], x, y, x0, y, x0, y2-vs + gate_ext - u1, pol_width, 0, 0
              end
            end
          end
        end
        offset = x1
        top = nil
        bottom = nil
        prev_pol = nil
        (n+1).times{|i|
          x = offset + vs/2
          y = y2 - vs + u1/2 + gate_ext - u1
          pol_width = params[:pol_width] || u1
          unless no_finger_conn
            if soi_bridge # NOTE: gate_contact_space + u1 = gl + dgl*2
              create_path indices[:pol], prev_pol-vs-gl-dgl*2, y+u1/2, x-vs-u1/2, y+u1/2, pol_width, 0, 0 if prev_pol
            else
              create_path indices[:pol], prev_pol-vs/2-gl-dgl*2, y, x-vs/2-dgl, y, pol_width, 0, 0 if with_pcont && prev_pol
            end
          end
          if defined?(body_tie) && body_tie && i < n
            create_path indices[:tin_block], x + vs/2, vs - u1/2 - u1/4,  x + vs/2  + gl + dgl*2, vs - u1/2 - u1/4, u1 + u1/2, 0, 0
            xstop = x + gl + dgl*2 + vs
            xstop = xstop + vs + u1 + u1/8 if i < n-1 || n % 2 ==  0
            xstart = x + vs/2 + gl/2 + dgl
            create_path2 indices[:diff], xstart, vs + u1, xstart, u1/4, xstop, u1/4, u1 + u1/2, 0, 0
            create_path indices[:pwell],  xstart, y1+vs,  xstart, y1+vs/2+u1/2-u1/8, u1 + u1 + u1/2, 0, 0
          end
          prev_pol = x if i >= 1
          if i % 2 == 0
            # first s/d and via
            y = y1+vs/2 - wm_offset
            if !no_finger_conn && (with_sdcont || n != 1)
              insert_cell indices[:via], x, y if with_via && with_sdcont 
              create_path indices[:m1], x, y, x, y1+vs+2*u1, pol_width, 0, 0
            end
            if top
              create_path indices[:m1], top, y, x, y, pol_width, pol_width/2, pol_width/2 unless no_finger_conn
            end
            top = x
          else
            # second s/d and via
            # create_path indices[:m1], x, y2-vs-2*u1 - wm_offset, x, y2+u1-vs/2, u1, 0, 0 if with_sdcont || n != 1
            if soi_bridge
              if n == 1 || (n == 2 && i == 1)
                y = y2-u1/4-vs/2
              else
                y = y2+pol_width+u1/8
              end
            else
              if n == 1 || (n == 2 && i == 1)
                y = y2-vs/2
              else
                y = y2+u1-vs/2
              end
            end
            if n == 1
              insert_cell indices[:via], x, y2-vs/2 + (defined?(wide_metal) && wide_metal ? u1/2 : 0) if with_via && with_sdcont
            else
              insert_cell indices[:via], x, y if with_via && with_sdcont
            end
            create_path indices[:m1], x, y2-vs-2*u1 - wm_offset, x, y, pol_width, 0, 0 if !no_finger_conn && (with_sdcont || n != 1)
            if bottom && !no_finger_conn
              if soi_bridge
                create_path indices[:m1], bottom, y, x, y, pol_width+u1/4, pol_width/2, pol_width/2
              else
                create_path indices[:m1], bottom, y, x, y, pol_width, pol_width/2, pol_width/2
              end
            end
            bottom = x
          end

          if i < n
            #create_path(indices[:pol], x, vs, x, vs+u1+gw + u1, gl, 0, 0)
            x = x + vs/2 + gl/2 + dgl
            if soi_bridge
              yc = [u1+gw, vs+u1+vs/2].max
              insert_cell indices[:dcont], x, yc
              insert_cell indices[:pcont], x, vs+u1+gw +vs/2 + u1 if i > 0
              create_path indices[:m1], x, yc - vs/2, x, vs+u1+gw +vs/2 + u1, vs, 0, 0
            elsif !with_pcont
              # insert_cell indices[:pcont],  x, (y1+y2)/2
              gcw = [gw, vs*3].min
              insert_contacts [x - vs/2, (y1+y2)/2 - gcw/2, x + vs/2, (y1+y2)/2 + gcw/2], vs, indices[:pcont_min] || indices[:pcont]
            end
          end
          offset = offset + m1cnt_width + gl + 2*dgl
        }
        if defined?(body_tie) && body_tie
          y = y1 + vs/2
          x = offset - 2*dgl - gl - vs/2
          x = x + vs + u1 if n % 2 == 0
          insert_cell indices[:dcont], x, y - u1 - u1/4
          # insert_cell indices[:diff], x, y - u1 - u1/4
          create_box indices[:diff], x - vs/2, y - u1 - u1/4 - vs/2, x + vs/2, y - u1 - u1/4 + vs/2
          create_box indices[:parea], x1 + vs -u1/2- u1/8, y + u1/2 - u1/8, x + vs/2 + u1/2, y - 3*u1 + u1/8
          create_box indices[:pwell], x1 + vs -u1- u1/8, y + u1 + u1/8 , x + vs/2 + u1, y - 3*u1 + u1/8-u1/2
        end
        offset = offset - 2*dgl
        # psubcont and via
        psubcont_dx = params[:psubcont_dx] || 0
        psubcont_dy = params[:psubcont_dy] || u1/2 + u1
        x = offset - gl - vs/2 + (with_via ? u1/2 : u1/4) + psubcont_dx
        if with_psubcont # && use_pwell
          if n % 2 == 0
            y = y2 - vs/2 + psubcont_dy
          else
            y = y1 + vs/2 - psubcont_dy
            y = y - u1/2 if defined?(wide_metal) && wide_metal
          end
          insert_cell indices[:psubcont], x, y if indices[:psubcont]
          insert_cell indices[:via], x, y if with_via
        end
        #create_box indices[:narea], x1-u1, y1+vs+u1/2, offset-gl+u1, y2-vs-u1/2
        narea_bw = params[:narea_bw] || u1 + u1/4
        if indices[:pwell]
          create_box indices[:pwell], x1-narea_bw, y1+vs+u1-narea_bw, offset-gl+narea_bw, y2-vs-u1+narea_bw
          create_box indices[:narea], x1-narea_bw+u1/2, y1+vs+u1-narea_bw+u1/2, offset-gl+narea_bw-u1/2, y2-vs-u1+narea_bw-u1/2
          # create_box indices[:lvhvt], x1-narea_bw+u1/2, y1+vs+u1-narea_bw+u1/2, offset-gl+narea_bw-u1/2, y2-vs-u1+narea_bw-u1/2 if indices[:lvhvt]
        else
          create_box indices[:narea], x1-narea_bw, y1+vs+u1-narea_bw, offset-gl+narea_bw, y2-vs-u1+narea_bw
          # create_box indices[:lvhvt], x1-narea_bw, y1+vs+u1-narea_bw, offset-gl+narea_bw, y2-vs-u1+narea_bw if indices[:lvhvt]

        end

        create_box indices[:nhd], x1-narea_bw, y1+vs+u1-narea_bw, offset-gl+narea_bw, y2-vs-u1+narea_bw if indices[:nhd] # special for PTS06
        if indices[:nex]
          delta = params[:nex_delta] || u1*5
          create_box indices[:nex], x1-delta, y1+vs-u1/2-delta-u1, offset-gl+delta, y2-vs+u1/2+delta+u1
          delta = delta + delta
          create_box indices[:ar], x1-delta, y1+vs-u1/2-delta-u1, offset-gl+delta, y2-vs+u1/2+delta+u1 if indices[:ar]
        end
        if indices[:pwl] && use_pwell
          if one = params[:pwl_bw]
            if indices[:nex]
              create_box indices[:pwl], x1-delta-one, [y1+vs-u1/2-delta-u1-one, y2-vs+u1/2+delta+u1-4*one].min,
                     [offset-gl+delta+one, x1-delta+4*one].max, y2-vs+u1/2+delta+u1+one
            else
               create_box indices[:pwl], x1-delta-one, y1+vs+u1-delta-one, offset-gl+delta+one, y2-vs-u1+delta+one
            end
          end
        end
      }
    end
  end

  class MinedaPch < MinedaMOS
    include RBA

    def display_text_impl #name='Pch'
      "#{name}\r\n(L=#{l.round(3)}um,W=#{w.round(3)}um,n=#{n.to_s},Total W=#{wtot.round(3)}um)"
    end

    def produce_impl indices, vs, u1, params = {} # PMOS
      produce_impl_core(indices, vs, u1, params){|x1, y1, x2, y2, gl, gw, dgl, m1cnt_width, ldl, rdl|
        # create pcont
        wm_offset = defined?(wide_metal) && wide_metal ? params[:wm_offset] || vs/2 : 0
        via_offset = params[:via_offset] || 0
        x = x1 + vs/2
        pcont_dy = params[:pcont_dy] || -u1/4
        y = y1 + vs/2 + pcont_dy
        gate_ext = params[:gate_ext] || 0
        mw1 = params[:m1_width] || u1
        m1cnt_width = params[:m1cnt_width] || vs
        if defined?(wide_metal) && wide_metal
          x = x - u1
          y = y - u1/2
        end
        if with_pcont
          pol_width = params[:pol_width] || u1 + u1/4
          pol_width = [gl, vs/2].max if pol_width > gl
          if n == 1 && !with_sdcont
            insert_cell indices[:pcont], x1+vs+dgl+gl/2, y
            insert_cell indices[:via], x1+vs+dgl+gl/2, y if with_via
            x3 = x1+vs+dgl+gl/2
            create_path indices[:pol], x3, y, x3, y1+vs - gate_ext + u1, vs, 0,0
          else
            pcont_inst = insert_cell indices[:pcont], x, y
            pcont_size = params[:pcont_pol_size] || pcont_inst.bbox.width
            insert_cell indices[:via], x, y if with_via
            y = y + pcont_size/2 - [pol_width, u1].max/2
            x3 = x1+m1cnt_width+dgl+[pol_width, u1].max/2
            create_path2 indices[:pol], x, y, x3, y, x3, y1+vs - gate_ext + u1, [pol_width, u1].max, 0, 0
          end
        end
        offset = x1
        top = nil
        bottom = nil
        prev_pol = nil
        (n+1).times{|i|
          x = offset + vs/2
          y = y1 + vs - u1/2 - gate_ext + u1 ### y1 + u1/2 + vs/2 #
          unless no_finger_conn
            create_path indices[:pol], prev_pol-vs/2-gl-dgl, y, x-vs/2-dgl, y, u1, 0, 0 if prev_pol
          end
          prev_pol = x  if i >=1
          if i % 2 == 0
            # first s/d and via
            if !no_finger_conn && (with_sdcont || n != 1)
              insert_cell indices[:via], x, y2-vs/2 + wm_offset + via_offset if with_via && with_sdcont
              create_path indices[:m1], x, y2-vs-2*u1, x, y2-vs/2 + wm_offset + via_offset, mw1, 0, 0
            end
            if top
              y = y2-vs/2 + wm_offset + via_offset
              create_path indices[:m1], top, y, x, y, mw1, mw1/2,mw1/2 unless no_finger_conn
            end
            top = x
          else
            # second s/d and via
            if n == 1
              insert_cell indices[:via], x, y1+vs/2 - (defined?(wide_metal) && wide_metal ? u1/2 : 0) - via_offset if with_via && with_sdcont
              y = y1 + vs/2
            else
              insert_cell indices[:via], x, y1-u1+vs/2 - via_offset if with_via && with_sdcont && !no_finger_conn
              y = y1-u1+vs/2
            end
            create_path indices[:m1], x, y, x, y1+vs+2*u1, mw1, 0, 0 if !no_finger_conn && (with_sdcont || n != 1)
            if bottom && !no_finger_conn
              create_path indices[:m1], bottom, y1-u1+vs/2, x, y1 -u1+vs/2, mw1, mw1/2, mw1/2
            end
            bottom = x
          end
          offset = offset + m1cnt_width + gl + 2*dgl
        }
        offset = offset - 2*dgl
         # nsubcont and via
        if with_nsubcont # && use_nwell
          nsubcont_dx = params[:nsubcont_dx] || 0
          nsubcont_dy = params[:nsubcont_dy] ||  u1/2 + u1
          x = offset - gl - vs/2 + (with_via ? u1/2 : 0) + nsubcont_dx
          if n % 2 == 0
            y = y1 + vs/2 - nsubcont_dy - (defined?(wide_metal) && wide_metal ? u1 : 0)
          else
            y = y2 - vs/2 + nsubcont_dy + wm_offset
          end
          y = y + u1/2 if defined?(wide_metal) && wide_metal
          x = x + u1/2 if n > 1
          insert_cell indices[:nsubcont], x, y if indices[:nsubcont]
          insert_cell indices[:via], x, y if with_via
        end
        x1 = x1 - m1cnt_width - ldl - 2*dgl if ldl > 0
        offset = offset + m1cnt_width + rdl + 2*dgl if rdl > 0
        area_ext = params[:area_ext] || 0
        parea_bw = params[:parea_bw] || u1 + u1/4
        create_box indices[:parea], x1-parea_bw, y1+vs+u1-parea_bw-area_ext, offset-gl+parea_bw, y2-vs-u1+parea_bw
        # create_box indices[:lvhvt], x1-parea_bw, y1+vs+u1-parea_bw, offset-gl+parea_bw, y2-vs-u1+parea_bw if indices[:lvhvt]
        delta = params[:pex_delta] || u1*5
        create_box indices[:pex], x1-delta, y1+vs-u1/2-delta-u1, offset-gl+delta, y2-vs+u1/2+delta+u1 if indices[:pex]
        delta = delta + delta
        create_box indices[:ar], x1-delta, y1+vs-u1/2-delta-u1, offset-gl+delta, y2-vs+u1/2+delta+u1 if indices[:ar]
        if indices[:nwl] && use_nwell
          if one = params[:nwl_bw] # bug fix 2023/5/11
            if indices[:pex]
              create_box indices[:nwl],  x1-delta-one, y1+vs-u1/2-delta-u1-one-area_ext, [offset-gl+delta+one, x1-delta+4*one].max,
                     [y2-vs+u1/2+delta+u1+one, y1+vs-u1/2-delta-u1+4*one].max # just for tiascr130?
            else
              create_box indices[:nwl],  x1-delta-one, y1+vs+u1-delta-one-area_ext, offset-gl+delta+one, y2-vs-u1+delta+one
            end
          else
            if n % 2 == 0
              create_box indices[:nwl], x1-vs, y1-u1-u1/2-area_ext, offset-gl +2*u1, y2
            else
              create_box indices[:nwl], x1-vs, y1-area_ext, offset-gl +2*u1, y2+u1+u1/2
            end
          end
        end
      }
    end
  end

  class MinedaPch_SOI < MinedaPch
    include RBA

    def produce_impl indices, vs, u1, params = {} # PMOS_SOI
      produce_impl_core(indices, vs, u1, params){|x1, y1, x2, y2, gl, gw, dgl, m1cnt_width|
        # create pcont
        wm_offset = defined?(wide_metal) && wide_metal ? params[:wm_offset] || vs/2 : 0
        x = x1 + vs/2
        pcont_dy = params[:pcont_dy] || -u1/4
        y = y1 + vs/2 + pcont_dy
        gate_ext = params[:gate_ext] || 0
        if defined?(wide_metal) && wide_metal
          x = x - u1
          y = y - u1/2
        end
        if with_pcont
          pol_width = params[:pol_width] || u1 + u1/4
          if n == 1 && !with_sdcont
            insert_cell indices[:pcont], x1+vs+dgl+gl/2, y
            insert_cell indices[:via], x1+vs+dgl+gl/2, y if with_via
            create_path indices[:pol], x1+vs+dgl+gl/2, y, x1+vs+dgl+gl/2, y1+vs - gate_ext + u1, vs, 0,0 if soi_bridge
          else
            insert_cell indices[:pcont], x, y
            insert_cell indices[:via], x, y if with_via
            y = y # + u1/2 # necessary to eliminate POL gap error
            x0 = x1+vs+gl/2+dgl
            unless no_finger_conn
              if soi_bridge
                create_path2 indices[:m1], x, y, x0, y, x0, y1+vs - gate_ext + u1, pol_width, 0, 0
                create_path2 indices[:pol], x, y, x0, y, x0, y1+vs - gate_ext + u1, pol_width, 0, 0 if gl > vs
              else
                create_path2 indices[:pol], x, y, x0, y, x0, y1+vs - gate_ext + u1, pol_width, 0, 0
              end
            end
          end
        end
        offset = x1
        top = nil
        bottom = nil
        prev_pol = nil
        (n+1).times{|i|
          x = offset + vs/2
          y = y1 + vs - u1/2 - gate_ext + u1 ### y1 + u1/2 + vs/2 #
          pol_width = params[:pol_width] || u1
          unless no_finger_conn
            if soi_bridge # NOTE: gate_contact_space + u1 = gl + dgl*2
              create_path indices[:pol], prev_pol-vs-gl-dgl*2, y-u1/2, x-vs-u1/2, y-u1/2, pol_width, 0, 0 if prev_pol
            else
              # create_path indices[:pol], prev_pol-vs/2-gl-dgl*2, y, x-vs/2-dgl, y, pol_width, 0, 0 if prev_pol
              create_path indices[:pol], prev_pol-vs/2-gl-dgl, y, x-vs/2-dgl, y, pol_width, 0, 0 if prev_pol
            end
          end
          if defined?(body_tie) && body_tie && i < n
            create_path indices[:tin_block], x + vs/2, y2 - (vs - u1/2 - u1/4),  x + vs/2  + gl+dgl*2, y2 - (vs - u1/2 - u1/4), u1 + u1/2, 0, 0
            xstop = x + gl + dgl*2 + vs
            xstop = xstop + vs + u1 + u1/8 if i < n-1 || n % 2 ==  0
            create_path2 indices[:diff], x + vs/2  + (gl+dgl*2)/2, y2-(vs + u1), x + vs/2  + (gl+dgl*2)/2, y2-u1/4,                          xstop, y2-u1/4, u1 + u1/2, 0, 0
          end
          prev_pol = x  if i >=1
          if i % 2 == 0
            # first s/d and via
            y = y2-vs/2 + wm_offset
            if !no_finger_conn && (with_sdcont || n != 1)
              insert_cell indices[:via], x, y if with_via && with_sdcont
              create_path indices[:m1], x, y2-vs-2*u1, x, y, pol_width, 0, 0
            end
            if top && !no_finger_conn
              create_path indices[:m1], top, y, x, y, pol_width, pol_width/2, pol_width/2
            end
            top = x
          else
            # second s/d and via
            if soi_bridge
              if n == 1 || (n == 2 && i == 1)
                y = y1-u1+vs
              else
                y = y1-pol_width-u1/8
              end
            else
              if n == 1 || (n == 2 && i == 1)
                y = y1+vs/2
              else
                y = y1-u1+vs/2
              end
            end
            if n == 1
              insert_cell indices[:via], x, y1+vs/2 - (defined?(wide_metal) && wide_metal ? u1/2 : 0) if with_via && with_sdcont
            else
              insert_cell indices[:via], x, y if with_via && with_sdcont
            end
            create_path indices[:m1], x, y, x, y1+vs+2*u1, pol_width, 0, 0 if !no_finger_conn && (with_sdcont || n != 1)
            if bottom && !no_finger_conn
              if soi_bridge
                create_path indices[:m1], bottom, y1-pol_width, x, y1-pol_width, pol_width+u1/4, pol_width/2, pol_width/2
              else
                create_path indices[:m1], bottom, y1-u1+vs/2, x, y1 -u1+vs/2, pol_width, pol_width/2, pol_width/2
              end
            end
            bottom = x
          end

          if i < n
            #create_path(indices[:pol], x, vs, x, vs+u1+gw + u1, gl, 0, 0)
            x = x + vs/2 + gl/2 + dgl
            if soi_bridge
              yc = [y1+vs+vs+u1, y1+vs+u1+gw-vs/2].min
              insert_cell indices[:dcont],  x, yc
              insert_cell indices[:pcont],  x, y1+vs/2 if i> 0
              create_path indices[:m1], x, y1+vs/2, x, yc + vs/2, vs, 0, 0
            elsif !with_pcont
              # insert_cell indices[:pcont],  x, (y1+y2)/2
              gcw = [gw, vs*3].min
              insert_contacts [x - vs/2, (y1+y2)/2 - gcw/2, x + vs/2, (y1+y2)/2 + gcw/2], vs, indices[:pcont_min] || indices[:pcont]
            end
          end
          offset = offset + m1cnt_width + gl + 2*dgl
        }
        if defined?(body_tie) && body_tie
          y = y2 + vs/2
          x = offset - gl-dgl*2 - vs/2
          x = x + vs + u1 if n % 2 == 0
          insert_cell indices[:dcont], x, y - u1
          insert_cell indices[:diff], x, y - u1
          create_box indices[:narea], x1 + vs -u1/2- u1/8, y + u1/2 + u1/8, x + vs/2 + u1/2, y - 3*u1 + u1/4 + u1/8
        end
        offset = offset - 2*dgl
        # nsubcont and via
        if with_nsubcont && use_nwell
          nsubcont_dx = params[:nsubcont_dx] || 0
          nsubcont_dy = params[:nsubcont_dy] ||  u1/2 + u1
          x = offset - gl - vs/2 + (with_via ? u1/2 : 0) + nsubcont_dx
          if n % 2 == 0
            y = y1 + vs/2 - nsubcont_dy - (defined?(wide_metal) && wide_metal ? u1 : 0)
          else
            y = y2 - vs/2 + nsubcont_dy + wm_offset
          end
          y = y + u1/2 if defined?(wide_metal) && wide_metal
          x = x + u1/2 if n > 1
          insert_cell indices[:nsubcont], x, y if indices[:nsubcont]
          insert_cell indices[:via], x, y if with_via
        end
        parea_bw = params[:parea_bw] || u1 + u1/4
        create_box indices[:parea], x1-parea_bw, y1+vs+u1-parea_bw, offset-gl+parea_bw, y2-vs-u1+parea_bw
        # create_box indices[:lvhvt], x1-parea_bw, y1+vs+u1-parea_bw, offset-gl+parea_bw, y2-vs-u1+parea_bw if indices[:lvhvt]
        delta = params[:pex_delta] || u1*5
        create_box indices[:pex], x1-delta, y1+vs-u1/2-delta-u1, offset-gl+delta, y2-vs+u1/2+delta+u1 if indices[:pex]
        delta = delta + delta
        create_box indices[:ar], x1-delta, y1+vs-u1/2-delta-u1, offset-gl+delta, y2-vs+u1/2+delta+u1 if indices[:ar]
        if indices[:nwl] && use_nwell
          if one = params[:nwl_bw] 
            if indices[:pex]
              create_box indices[:nwl],  x1-delta-one, y1+vs-u1/2-delta-u1-one, [offset-gl+delta+one, x1-delta+4*one].max,
                     [y2-vs+u1/2+delta+u1+one, y1+vs-u1/2-delta-u1+4*one].max # just for tiascr130?
            else
              create_box indices[:nwl],  x1-delta-one, y1+vs+u1-delta-one, offset-gl+delta+one, y2-vs-u1+delta+one
            end
          else
            if n % 2 == 0
              create_box indices[:nwl], x1-vs, y1-u1-u1/2, offset-gl +2*u1, y2
            else
              create_box indices[:nwl], x1-vs, y1, offset-gl +2*u1, y2+u1+u1/2
            end
          end
        end
      }
    end
  end

  class MinedaResistor < MinedaPCellCommon

    include RBA
    def initialize
      # Important: initialize the super class
      super
      param(:with_via, TypeBoolean, "Put Via over contacts", :default => true, :hidden => false)
    end

    # default implementation
    def can_create_from_shape_impl
      false
    end

    def parameters_from_shape_impl
    end

    def transformation_from_shape_impl
      # I「Create PCell from shape（形状からPCellを作成）」プロトコルを実装します。
      # 変形を決定するために、図形のバウンディングボックスの中心を使用します。
      Trans.new(shape.bbox.center)
    end

    def create_contacts indices, w, x0, y, vs, u1, pitch=nil, fill_metal=true
      contact = indices[:pcont] || indices[:dcont] || indices[:nsubcont]
      pitch ||= vs+u1/4  # cnt distance > 5 um
      n = (w/pitch).to_i
      if n <= 1
        insert_cell contact, x0, y, true
        insert_cell indices[:via], x0, y if !defined?(with_via) || with_via
      else
        offset = w- pitch*n
        (x0-w/2 + offset/2 + pitch/2).step(x0+w/2-vs/2, pitch){|x|
          # insert_cell indices, :via, x, y, vs, u1, false
          insert_cell contact, x, y, true
          insert_cell indices[:via], x, y if !defined?(with_via) || with_via
        }
        #create_box indices[:m1], x0-w/2, y-vs/2, x0+w/2, y+vs/2 
        create_box fill_metal, x0-w/2, y-vs/2, x0+w/2, y+vs/2 if fill_metal
        #vs2 = vs + u1/4
        #create_box indices[:m2], x0-w/2, y-vs2/2, x0+w/2, y+vs2/2
      end
    end

    def produce_impl indices, header_outside, vs, u1, params={}
      res_body = indices[:pol] || indices[:diff] || indices[:nwl]
      oo_layout_dbu = 1/ layout.dbu
      rw = (w*oo_layout_dbu).to_i
      rrl = (l*oo_layout_dbu).to_i
      sp = (s*oo_layout_dbu).to_i
      ms = (m*oo_layout_dbu).to_i
      cs = params[:contact_size] || vs
      rrl = rrl - (vs - cs)
      rw_ho = rw*header_outside
      rl = rrl - (sp+rw)*(n-1) -rw_ho
      sl = [(rl/n/u1).to_i*u1, ms-2*rw].min
      if sl*n + (sp+rw)*(n-1) == rrl
        r = 0
      else
        sl = [sl + u1, ms-2*rw].min
        r = rrl - sl*(n-1) - (sp+rw)*(n-1)
        if r <= 0 && sl > ms-2*rw
          rl = rrl - sp*(n-2)
          set_n n - 1
        end
      end
      puts "rw=#{rw}, rrl = #{rrl}, rl = #{rl}, n = #{n}, sp=#{sp}, sl = #{sl}, r = #{r}"
      prev_x = nil
      xmax = ymax = -10000000
      ymin = 10000000
      for i in 0..n-1
        offset = vs/2 + (sp+rw)*i
        r = sl
        if i == n - 1 # rl - sl*(i+1) < 0
          r = rl - sl*i
        end
        puts "offset=#{offset}, r=#{r} for i=#{i}"
        if i % 2 == 0
          x = offset
          if i == 0
            points = [Point::new(x, -rw_ho), Point::new(x, vs+r)]
            y = vs/2-rw_ho
            # insert_cell indices, :via, x, y, vs, u1
            # insert_cell indices, :cnt, x, y, vs, u1
            # insert_cell indices, :diff, x, y, vs, u1
            create_contacts indices, rw, x, y, vs, u1, params[:pitch], res_body
            ymin = [ho ? y + vs/2 : y - vs/2, ymin].min
            points = [Point::new(x, vs-rw_ho-(vs-cs)/2), Point::new(x, vs+r + (vs-cs)/2)]
          else
            points = [Point::new(x, vs-rw_ho), Point::new(x, vs+r + (vs-cs)/2)]
          end
          cell.shapes(indices[:res]).insert(Path::new(points, rw, 0, 0))
          if i == n-1
            points = [Point::new(x, (n == 1 ? -rw_ho : vs)), Point::new(x, vs+r+vs)]
            y =  vs+r+vs/2
            # insert_cell indices, :via, x, y, vs, u1
            # insert_cell indices, :cnt, x, y, vs, u1
            # insert_cell indices, :diff, x, y, vs, u1
            create_contacts indices, rw, x, y, vs, u1, params[:pitch], res_body
            ymax = [y+vs/2, ymax].max
          end
          cell.shapes(res_body).insert(Path::new(points, rw, 0, 0))

          if prev_x
            y = vs - rw/2
            points = [Point::new(x, y), Point::new(prev_x, y)]
            cell.shapes(res_body).insert(Path::new(points, rw, rw/2, rw/2))
            cell.shapes(indices[:res]).insert(Path::new(points, rw, rw/2, rw/2))
            ymax = [y+rw/2, ymax].max
          end
        else
          points = [Point::new(offset, vs+(sl-r)-(vs-cs)/2), Point::new(offset, vs+sl)]
          cell.shapes(indices[:res]).insert(Path::new(points, rw, 0, 0))
          if i == n-1
            points = [Point::new(offset, sl-r), Point::new(offset, vs+sl)]
            x = offset
            y = vs+sl-r-vs/2
            # insert_cell indices, :via, x, y, vs, u1
            # insert_cell indices, :cnt, x, y, vs, u1
            # insert_cell indices, :diff, x, y, vs, u1
            create_contacts indices, rw, x, y, vs, u1, params[:pitch], res_body
            ymax = [y+vs/2, ymax].max
            ymin = [ho ? y+vs/2+u1/4 : y-vs/2, ymin].min
          end
          cell.shapes(res_body).insert(Path::new(points, rw, 0, 0))

          if prev_x
            x = offset
            y = vs + sl + rw/2
            points = [Point::new(x, y), Point::new(prev_x, y)]
            cell.shapes(res_body).insert(Path::new(points, rw, rw/2, rw/2))
            cell.shapes(indices[:res]).insert(Path::new(points, rw, rw/2, rw/2))
            ymax = [y+rw/2, ymax].max
          end
        end
        prev_x = offset
        xmax = [x + [rw/2, vs/2].max, xmax].max
        puts "[xmax,ymax] = #{[xmax,ymax].inspect}"
      end
      # puts "n=#{n}"
      [[[vs/2-rw/2, 0].min, [(ho||n<=2) ? 0 : vs - rw, ymin].min, xmax, ymax], rw_ho]
    end
  end

  class MinedaResistorType2 < MinedaPCellCommon
    def produce_impl indices, vs, u1, cs, ol, delta, pol_enclosure = 0, params={}, text=nil
     # cs: contact size, ol: POL overlap over cs
     # delta is used to adjust res end
      indices[:m1] = get_layer_index 'ML1'
      indices[:cnt] = get_layer_index 'CNT'
      length = (l/layout.dbu).to_i
      width = (w/layout.dbu).to_i
      sseg = (ss/layout.dbu).to_i
      ml1_cnt = params[:ml1_cnt] || u1/5
      ml1_margin = params[:ml1_margin] || 0
      cnt_margin = params[:cnt_margin] || [0, 0] 
      cnt_cover = params[:cnt_cover] || vs
      cnt_adjust = (vs - cnt_cover)/2
      offset = 0
      #pol_enclosure = u10/2 # pol enclosure might not make sense process wise, pol is a tentative name
      for i in 0..ns-1
        create_box indices[:pol], -pol_enclosure, offset, (ol+cs+delta)*2 + length + pol_enclosure, width + offset
        x = ol + cs +delta + length
        create_box indices[:res], ol + cs + delta, offset, x, width + offset, text
        if diff_index = indices[:diff]
          # x1, y1, x2, y2 = boxes_bbox(indices[:pol])
          x1, y1, x2, y2 = [0, offset+pol_enclosure, (ol+cs+delta)*2 + length, width + offset-pol_enclosure]
          # xr1, yr1, xr2, yr2 = boxes_bbox(indices[:res])
          xr1, yr1, xr2, yr2 = [ ol + cs + delta, offset+pol_enclosure, x, width + offset-pol_enclosure]
          create_box diff_index, x1, y1, xr1, y2
          create_box diff_index, xr2, y1, x2, y2
          if parea_index = indices[:parea]
            parea_margin = params[:parea_margin] || (u1/5)*3
            create_box parea_index, x1-parea_margin, y1-parea_margin, xr1+parea_margin, y2+parea_margin
            create_box parea_index, xr2-parea_margin, y1-parea_margin, x2+parea_margin, y2+parea_margin
          end
        end
        x = x + delta
 
        lower_end = offset - (width < cs + ol*2? ml1_cnt : 0) + ml1_margin
        upper_end = width + offset +  (width < cs + ol*2? ml1_cnt : 0) - ml1_margin
        [[ol - ml1_cnt, lower_end, ol + cs + ml1_cnt,upper_end, cnt_margin],
         [x - ml1_cnt, lower_end, x + cs + ml1_cnt, upper_end, cnt_margin]].each{|area|
          x1, y1, x2, y2 = fill_area(area, vs, indices[:m1]){|x, y|
            create_box indices[:cnt], x - cs/2, y - cs/2, x + cs/2, y + cs/2
          }
          create_box indices[:cnt_cvr], x1 + cnt_adjust, y1 + cnt_adjust, x2 - cnt_adjust, y2 - cnt_adjust
        }
        dy = (width-cs)/2
        if width < cs + ol*2
          create_box indices[:pol], 0, offset + dy - ol, cs + ol*2, offset + width - dy +ol
          create_box indices[:pol], x - ol, offset + dy -ol, x + cs + ol, offset + width - dy + ol
        end
        if offset > 0
          create_box indices[:m1], ol - ml1_cnt, offset - sseg-ml1_margin, cs+ol + ml1_cnt, offset+ml1_margin if parallel || i % 2 == 0
          create_box indices[:m1], x - ml1_cnt, offset - sseg-ml1_margin, x + cs + ml1_cnt, offset+ml1_margin if parallel || i % 2 != 0
        end
        offset = offset + width + sseg
      end
    end
    def display_text_impl name='HR_poly'
      if ns > 1
        "#{name}\r\n(L=#{l.round(3)}um,W=#{w.round(3)}um,ns=#{ns.to_s}, #{ss}um => R=#{rval.round(3)})"
      else
        "#{name}\r\n(L=#{l.round(3)}um,W=#{w.round(3)}um,ns=#{ns.to_s} => R=#{rval.round(3)})"
      end
    end   
  end

  class MinedaCapacitor < MinedaPCellCommon
    include RBA
    def initialize
      # Important: initialize the super class --- don't know if this is really necessary
      super
    end

    # default implementation
    def can_create_from_shape_impl
      false
    end

    def transformation_from_shape_impl
      # I「Create PCell from shape（形状からPCellを作成）」プロトコルを実装します。
      # 変形を決定するために、図形のバウンディングボックスの中心を使用します。
      Trans.new(shape.bbox.center)
    end

    def create_contacts_horizontally indices, x1, x2, y0, vs, u1, pitch=nil, fill_metal=true
      pitch ||= vs+u1 # +u1/2+u1/4
      n = ((x2+u1-x1)/pitch).to_i
      offset = x2+u1-x1-pitch*n
      (offset/2 + x1+vs/2..x2-vs/2).step(pitch){|x|
        # insert_cell indices, index, x, y1, vs, u1, fill_metal
        if indices[:pol]
          insert_cell indices[:pcont], x, y0
        else
          insert_cell indices[:dcont], x, y0
        end
        insert_cell indices[:via], x, y0 if indices[:via] #&& defined?(use_ml2) && use_ml2
      }
    end

    def create_contacts_vertically indices, x0, y1, y2, vs, u1, pitch=nil, fill_metal=true
      pitch ||= vs+u1  # +u1/2+u1/4
      n = ((y2+u1-y1)/pitch).to_i
      offset = y2+u1-y1-pitch*n
      (offset/2+y1+vs/2..y2-vs/2).step(pitch){|y|
        # insert_cell indices, index, x1, y, vs, u1, fill_metal
        if indices[:via2]
          insert_cell indices[:via2], x0, y
        else
          if indices[:pol]
            insert_cell indices[:pcont], x0, y
          else
            insert_cell indices[:dcont], x0, y
          end
          insert_cell indices[:via], x0, y if indices[:via] #&& defined?(use_ml2) && use_ml2
        end
      }
    end

    def instantiate index, x, y
      CellInstArray.new(index, Trans.new(x, y))
    end
  end

  class MinedaDiff_cap < MinedaCapacitor
    def initialize(args={polcnt_outside: ["Poly contact outside?", true]})
      super()
      param(:cval, TypeDouble, "Capacitor value", :default => 0, :hidden=> true)
      param(:polcnt_outside, TypeBoolean, args[:polcnt_outside][0], :default =>args[:polcnt_outside][1], :hidden => false)
    end

    def display_text_impl
      # Provide a descriptive text for the cell
      "Diff Capacitor\r\n(L=#{l.round(3)}um,W=#{w.round(3)}um,C=#{cval.to_s})"
    end

    def produce_impl indices, vs, u1, area_index=nil, well_index=nil, params={}, label=nil
      oo_layout_dbu = 1 / layout.dbu
      cw = (w*oo_layout_dbu).to_i
      cl = (l*oo_layout_dbu).to_i
      u2 = u1 + u1
      cap_ext = params[:cap_ext] || u1
      create_box indices[:diff], 0, -cap_ext, cw, cl+vs+u1
      create_box indices[:cap], 0, 0, cw, cl
      # create_box indices[:cap], 0, 0, cw, cl+u1+vs
      diff_enclosure = params[:diff_enclosure] || 0
      area_enc= params[:area_enc] || u1/2
      create_box area_index, -area_enc, -cap_ext - area_enc, cw + area_enc, cl + area_enc + vs + u1 + diff_enclosure
      well_diff_enc = params[:wd_enc] || u1*5
      if well_index
        if nsub_cont = indices[:nsubcont]
          nsub_x = params[:nsub_x] || -vs-u1/2
          well_diff_enc2 = params[:wd_enc2] || vs+u1/2+u2
          create_box well_index, [-well_diff_enc, -well_diff_enc2].min, -u1-well_diff_enc,
                          cw + well_diff_enc, [cl + well_diff_enc + vs + u1, cl+u2+vs + u2].max
          insert_cell indices[:nsubcont], nsub_x, cl+u2+vs+u2-(well_diff_enc2+nsub_x) if params[:nsub_cont]
        else
          x0 = -well_diff_enc
          x0 = [x0, -u2-vs].min if polcnt_outside
          create_box well_index, x0, -u1-well_diff_enc, cw + well_diff_enc, cl + well_diff_enc + vs + u1
        end
      end

      if polcnt_outside
        create_box indices[:pol], -u2-vs, 0, cw + cap_ext, cl, label
        create_contacts_vertically indices, -u1-vs/2, 0, cl, vs, u1, params[:vpitch], true # false
      else
        create_box indices[:pol], -u1, 0, cw + cap_ext, cl, label
        create_contacts_vertically indices, u1+vs/2, u1/2, cl-u1/2, vs, u1, params[:vpitch], true # false
      end
      indices[:pol] = nil # this tells create_contacts_horizontally to use dcont
      create_contacts_horizontally indices, 0, cw, u1/2+cl+u1, vs, u1, params[:hpitch], true # false
      # insert_cell indices, nsubcont_index, 0, cl+2*u1+vs, vs, u1
      # insert_cell indices, :diff, 0, cl+2*u1+vs, vs, u1
      # insert_cell indices, :cnt, 0, cl+2*u1+vs, vs, u1
      #          points = [Point::new(offset, vs), Point::new(offset, vs/2+r)]
      #          cell.shapes(pol_index).insert(Path::new(points, rw, vs, vs))
      #          cell.shapes(res_index).insert(Path::new(points, rw, vs/4, vs/4))
    end
  end

  class MinedaPoly_cap < MinedaCapacitor
    def initialize args={use_ml2: ['Use 2nd ML', false]}
      super()
      param(:cval, TypeDouble, "Capacitor value", :default => 0, :hidden=> true)
      param(:use_ml2, TypeBoolean, args[:use_ml2][0], :default => args[:use_ml2][1], :hidden=> true)
    end

    def display_text_impl
      # Provide a descriptive text for the cell
      "Poly Capacitor\r\n(L=#{l.round(3)}um,W=#{w.round(3)}um,C=#{cval.to_s})"
    end
    
    def coerce_parameters_impl value
      area_cap = value
      set_cval(area_cap * l * w)
    end

    def produce_impl indices, vs, u1, params = {}, label=nil
      oo_layout_dbu = 1 / layout.dbu
      cw = (w*oo_layout_dbu).to_i
      cl = (l*oo_layout_dbu).to_i
      u2 = u1 + u1
      cap_ext = params[:cap_ext] || u1
      pcont_dy = params[:pcont_dy] || 0
      offset = vs+ u2+u1/2+u1/4 # corrected +u1/8 -> +u1/4 to avoid off-grid
      create_box indices[:m1], 0, 0, offset + cw + cap_ext, cl
      create_box indices[:cap], offset, 0, offset + cw, cl
      if use_ml2
        create_box indices[:m2], offset, -u1, offset + cw , cl+u2+vs
      end
      create_box indices[:pol], offset, -cap_ext, offset + cw , cl+u2+vs + pcont_dy, label
      create_contacts_horizontally indices, offset+u1/2,  offset + cw -u1/2, cl + vs/2 + u1 + pcont_dy, vs, u1, params[:hpitch]
    end
  end

  class MinedaSlit_cap < MinedaCapacitor
    # include MinedaPCell
    def display_text_impl
      "Slit capacitor\r\n(L=#{(us*nc).to_s}um,W=#{(us*nr).to_s}um, C=#{cval.to_s}"
    end
    def draw_unit index, x, y, u
      create_box index, x-u/2, y-u/2, x+u/2, y+u/2
    end
    def produce_impl(indices, vs, u1, usize, nc, nr, slit_length, slit_width, csq)
      (0..(hp ? nc: nc-1)).each{|i|
        (0..nr-1).each{|j|
          puts [i, j].inspect
          x = i*usize + (hp ? 0 : usize/2)
          y = j*usize + usize/2
          draw_unit(indices[:m1], x, y, usize -  slit_width)
          draw_unit(indices[:m1], x - usize/2 + csq/2, y - usize/2 + csq/2, csq)
          draw_unit(indices[:m1], x + usize/2 - csq/2, y - usize/2 + csq/2, csq)
          draw_unit(indices[:m1], x - usize/2 + csq/2, y + usize/2 - csq/2, csq)
          draw_unit(indices[:m1], x + usize/2 - csq/2, y + usize/2 - csq/2, csq)
        }
      }
      us2 = usize/2
      if hp # high precision
         create_box indices[:m1], -us2,  0, nc*usize + us2, slit_width
         create_box indices[:m1], -us2,  nr*usize, nc*usize + us2, nr*usize - slit_width
         create_box indices[:pol], 0, -us2, nc*usize, nr*usize + us2
         create_box indices[:m1], -us2, 0, -us2 + slit_width, nr*usize
         create_box indices[:m1], nc*usize + us2, 0, nc*usize + us2 - slit_width, nr*usize
         create_box indices[:cap], 0, 0, nc*usize, nr*usize
      else
        create_box indices[:pol], 0, 0, nc*usize, nr*usize
        create_box indices[:cap], slit_width, slit_width, nc*usize-slit_width, nr*usize-slit_width
      end
    end
  end

  class MinedaFinger_cap < MinedaCapacitor
    # include MinedaPCell
    def display_text_impl
      "Finger capacitor\r\n(L=#{fl.round(3)}um,W=#{(fw*nf + fg*(nf-1)).round(3)}um, C=#{cval.to_s}"
    end
    def draw_fingers index, fl, fw, fg, nf, flag
      pitch = (fw + fg)*2
      y = 0
      for i in 0..((nf+1)/2).to_i - 1 do
        x = flag ? -fg-fw/2 : fl+fg+fw/2
        if y > 0
          points = [Point::new(x, y), Point::new(x, y - pitch)]
          cell.shapes(index).insert(Path::new(points, fw, fw/2, fw/2))
        end
        points = flag ? [Point::new(x, y), Point::new(fl, y)] : [Point::new(0, y), Point::new(x, y)]
        cell.shapes(index).insert(Path::new(points, fw, 0, 0))
        y = y + pitch
      end
      y = fw + fg
      x = nil
      for i in ((nf+1)/2).to_i..(nf-1) do
        x = flag ? fl+fg+fw/2 : -fg-fw/2
        if y > fw + fg
          points = [Point::new(x, y), Point::new(x, y - pitch)]
          cell.shapes(index).insert(Path::new(points, fw, fw/2, fw/2))
        end
        points = flag ? [Point::new(0, y), Point::new(x, y)] : [Point::new(x, y), Point::new(fl, y)]
        cell.shapes(index).insert(Path::new(points, fw, 0, 0))
        y = y + pitch
      end
      [x, fw + fg, y - pitch]
    end
    def produce_impl(indices, vs, u1, finger_length, finger_width, finger_gap, nf)
      # super indices, vs, u1, finger_length, finger_width, finger_gap, nf
      x0, y0, y1 = draw_fingers indices[:m2], finger_length, finger_width, finger_gap, nf, true
      create_contacts_vertically indices, x0, y0, y1, vs, u1
      x1, y0, y1 = draw_fingers indices[:m3], finger_length, finger_width, finger_gap, nf, false
      create_contacts_vertically indices, x1, y0, y1, vs, u1
      create_box indices[:cap], 0, -finger_width/2, finger_length, finger_width*nf + finger_gap*(nf-1) - finger_width/2
    end
  end

  class MinedaFillRing < MinedaPCellCommon
    def initialize ring_length=50.0.um, ring_width=50.0.um
      super()
      param(:l, TypeDouble, "Ring length", :default => ring_length)
      param(:w, TypeDouble, "Ring width", :default => ring_width)
      param(:s, TypeShape, "", :default => DPoint::new(20.0, 20.0))
      param(:lu, TypeDouble, "Ring length", :default => 20.0.um, :hidden =>true)
      param(:wu, TypeDouble, "Ring width", :default => 20.0.um, :hidden =>true)
      param(:cng, TypeDouble, "Corner gap", :default => 0.0.um)
      param(:ctg, TypeDouble, "Center gap", :default => 0.0.um)
      param(:merge_layers, TypeBoolean, "Merge layers", :default => false)
    end
    def coerce_parameters_impl
      ls = ws = nil
      if s.is_a?(DPoint)
        if defined?(sq_fit) and sq_fit
          ls = ((s.y/sq_size).to_i)*sq_size
          ws = ((s.x/sq_size).to_i)*sq_size
        else
          ls = s.y
          ws = s.x
        end
      end
      if  (l - lu) .abs < 1e-6 && (w - wu).abs < 1e-6
        set_lu ls
        set_l ls
        set_wu ws
        set_w ws
      else
        #      puts "l=#{l} w=#{w}"
        set_lu l
        set_wu w
        ws = w # ((w/sq_size).to_i)*sq_size
        ls = l # ((l/sq_size).to_i)*sq_size
        set_s DPoint::new(ws, ls)
      end
      set_cng 0 if ctg != 0.0
      set_ctg 0 if cng != 0.0
    end
    def display_text_impl
      "#{self.name}\r\n(width=#{w.round(3)}um,length=#{l.round(3)}um)"
    end
    def produce_impl index, bw, fillers, length, width, x1 = 0, x2 = 0, off_layers_on_gap=[]
    #[[-bw, -bw, width, 0],
      @region = nil
      if index
        if defined?(merge_layers) and merge_layers
          @region = {}
          layout.cell(index).layout.layer_indexes.each{|layer|
            lay_ind = layout.get_info(layer).layer
            @region[lay_ind] = Region::new()
          }
        end
        cell_on_gap = layout.cell(index).dup
        cell_on_gap.flatten(true)
        off_layers_on_gap.each{|off_layer|
          cell_on_gap.clear(layout.find_layer(get_layer_index(off_layer, false), 0))
        }
        cell_on_gap_index = cell_on_gap.cell_index
      else
        cell_on_gap_index = nil
      end
      fill_area([-bw, -bw, width, 0], bw, fillers){|x, y|
        if x1 - bw <x && x < x2 && x1 != x2
          insert_cell cell_on_gap_index, x, y if cell_on_gap_index 
        else
          insert_cell index, x, y if index
        end
      }
      #fill_area([-bw, -bw, x1, 0], bw, fillers) if x1 > 0
      #fill_area([x2 > 0 ? x2 : x2-bw, -bw, width, 0], bw, fillers)
      [[width, -bw, width+bw, length],
       [0, length, width+bw, length+bw],
       [-bw, 0, 0, length+bw]].each{|area|
        fill_area(area, bw, fillers){|x, y|
            insert_cell index, x, y if index
        }
      }
      @region && @region.each_pair{|lay_ind, region_shapes|
        lay_index = layout.cell(index).layout.layer(lay_ind, 0)
        cell.shapes(lay_index).insert(region_shapes.merge)
      }
    end
  end
  
  class MinedaFillLine < MinedaPCellCommon
    def initialize line_length=50.0.um
      super()
      param(:l, TypeDouble, "Line length", :default => line_length)
      param(:w2, TypeDouble, "Line width/2", :default => 0.0.um)
      param(:s, TypeShape, "", :default => DPoint::new(20.0, 20.0))
      param(:lu, TypeDouble, "Line length", :default => 20.0.um, :hidden =>true)
      param(:wu, TypeDouble, "Line width/2", :default => 0.0.um, :hidden =>true)
      param(:gp, TypeString, "Gap pattern", :default => '')
      param(:merge_layers, TypeBoolean, "Merge layers", :default => false)
    end
    def coerce_parameters_impl
      ls = ws = nil
      if s.is_a?(DPoint)
        if defined?(sq_fit) and sq_fit
          ls = ((s.x/sq_size).to_i)*sq_size
          ws = ((s.y/sq_size).to_i)*sq_size
        else
          ls = s.x
          ws = s.y
        end
      end
      if  (l - lu) .abs < 1e-6 && (w2 - wu).abs < 1e-6
        set_lu ls
        set_l ls
        set_wu ws
        set_w2 ws
      else
        #      puts "l=#{l} w=#{w}"
        set_lu l
        set_wu w2
        ws = w2
        ls = l
        set_s DPoint::new(ls, ws)
      end
      gap_pattern = (gp || '').split(/[ ,] */)
      if gap_pattern.size % 2 == 0
        gp.sub! /[ ,] *[^,]+$/, ''
      end
    end
    def display_text_impl
      "Guard line\r\n(length=#{l.round(3)}um, width=#{w.round(3)}um)"
    end
    def produce_impl index, bw_margin, fillers, fill_margin, length, half_width, gap_pattern=[], off_layers_on_gap=[]
      bw, margin = (bw_margin.class == Array) ? bw_margin : [bw_margin, 0]
      @region = nil
      if index
        if defined?(merge_layers) and merge_layers
          @region = {}
          layout.cell(index).layout.layer_indexes.each{|layer|
            lay_ind = layout.get_info(layer).layer
            @region[lay_ind] = Region::new()
          }
        end
        cell_on_gap = layout.cell(index).dup
        cell_on_gap.flatten(true)
        off_layers_on_gap.each{|off_layer|
          cell_on_gap.clear(layout.find_layer(get_layer_index(off_layer, false), 0))
        }
        cell_on_gap_index = cell_on_gap.cell_index
      else
        cell_on_gap_index = nil
      end
      area = [0, -[bw/2, half_width.abs].max, length, [bw/2, half_width.abs].max, margin]
      fill_area(area, bw, fillers, fill_margin){|x, y|
        if  (gap_pattern.find_index{|a| a > x}||1)%2 == 1
          insert_cell(index, x, y) if index
        else
          insert_cell(cell_on_gap_index, x, y) if cell_on_gap_index
        end
      }
      @region && @region.each_pair{|lay_ind, region_shapes|
        lay_index = layout.cell(index).layout.layer(lay_ind, 0)
        cell.shapes(lay_index).insert(region_shapes.merge)
      }
    end
  end
  
  class MinedaFillBox < MinedaPCellCommon
    def initialize default_x=4.0.um, default_y=4.0.um, name = nil
       super()
       param(:l, TypeDouble, "X size", :default => default_x)
       param(:w, TypeDouble, "Y size", :default => default_y)
       param(:s, TypeShape, "", :default => DPoint::new(default_x, default_y))
       param(:xu, TypeDouble, "Previous X", :default => default_x, :hidden =>true)
       param(:yu, TypeDouble, "Previous Y", :default => default_y, :hidden =>true)
      param(:merge_layers, TypeBoolean, "Merge layers", :default => false)
       @box_name = name || 'Fill box'
    end
    def display_text_impl
      "#{@box_name}\r\n(X=#{l.round(3)}um,Y=#{w.round(3)}um)"
    end
    def coerce_parameters_impl
      xs = ys = nil
      if s.is_a?(DPoint)
        xs = s.x
        ys = s.y
      end
      if  (l - xu) .abs < 1e-6 && (w - yu).abs < 1e-6
        set_xu xs
        set_l xs
        set_yu ys
        set_w ys
      else
        set_xu l
        set_yu w
        xs = l
        ys = w
        set_s DPoint::new(xs, ys)
      end
    end
  end

  class MinedaBridge < MinedaPCellCommon
    include RBA
    def initialize
      super
      param(:mb, TypeBoolean, "Metal bridge?", :default => false)
      param(:nb,  TypeString, "Number of boost heads", :default => '0')
      param(:rval, TypeDouble, "Resistor value", :default => 0, :hidden=> true)
    end
  
    # default implementation
    def can_create_from_shape_impl
      false
    end
    
    def parameters_from_shape_impl
    end
    
    def transformation_from_shape_impl
    # I「Create PCell from shape（形状からPCellを作成）」プロトコルを実装します。
    # 変形を決定するために、図形のバウンディングボックスの中心を使用します。
      Trans.new(shape.bbox.center)
    end
    
    def display_text_impl gate='TIN'
      if mb
        "ML2 bridge\r\n(L=#{l.to_s}um,W=#{w.to_s}um, s=#{s}um"
      else
        "#{gate} bridge\r\n(L=#{l.to_s}um,W=#{w.to_s}um, s=#{s}um => R=#{rval.round(3)}"
      end
    end

    def coerce_parameters_impl
      sheet_resistance = 20 # temporary
      set_rval(sheet_resistance * l / w)
    end    

    def insert_cell_bridge_special indices, index, x, y, vs, u1, fill_metal=true
      #      via = instantiate via_index, x, y
      #      inst = cell.insert(via)
      case index
      when :diff
        create_box indices[:diff], x-vs/2, y-vs/2, x+vs/2, y+vs/2
        return
      when :via
        if fill_metal
          create_box indices[:m1], x-vs/2, y-vs/2, x+vs/2, y+vs/2
          vs2 = vs + u1/4
          create_box indices[:m2], x-vs2/2, y-vs2/2, x+vs2/2, y+vs2/2
        end
      when :cnt
        if fill_metal
          create_box indices[:m1], x-vs/2, y-vs/2, x+vs/2, y+vs/2
        end
      when :pcont
        create_box indices[:tin], x-vs/2, y-vs/2, x+vs/2, y+vs/2
        create_box indices[:m1], x-vs/2, y-vs/2, x+vs/2, y+vs/2
        index = :cnt
      end
      vu2 = vs/2 - u1 # quick fix for ICPS2023_5
      # vu2 =vs/2 - u1/2
      create_box indices[index], x-vu2, y-vu2, x+vu2, y+vu2
    end

    def create_contacts_horizontally_bridge_special indices, w, x0, y, vs, u1, body, head, ys, nb=nil
      nb ||= 0
      pitch = vs # +u1/4  # cnt distance > 5 um
      n = (w/pitch).to_i
      if ys < y
        up = 1
        down = 0
      else
        up = 0
        down = 1
      end
      (nb+1).times{|i|
        if n <= 1
          # insert_cell indices, :via, x0, y, vs, u1, fill_metal
          insert_cell_bridge_special indices, head, x0, y + (up - down)*i*pitch, vs, u1, true # false
          #insert_cell indices, body, x0, y, vs, u1
        else
          offset = w- pitch*n
          (x0-w/2 + offset/2 + pitch/2).step(x0+w/2-vs/2, pitch){|x|
            insert_cell_bridge_special indices, head, x, y + (up - down)*i*pitch, vs, u1, false
            #insert_cell indices, body, x, y, vs, u1
          }
         vs2 = vs #  + u1/4
        end
      }
      x1 = x0-w/2
      y1 = y-vs/2 - pitch*nb*down # -u1/8*down
      x2 = x0+w/2
      y2 = y+vs/2 + pitch*nb*up # +u1/8*up
      create_box indices[:m1],  x1, y1, x2 , y2
      create_box indices[body],  x1, y1, x2 , y2
      create_box indices[:narea],  x1-u1/2 ,y1-u1/2 ,x2+u1/2, y2+u1/2 if body == :diff
    end
    
    def create_contacts_vertically_bridge_special indices, w, x, y0, vs, u1, body, head, xs, nb = nil
      nb ||= 0
      pitch = vs # +u1/4  # cnt distance > 5 um
      n = (w/pitch).to_i
      if x < xs
        left = 1
        right = 0
      else
        left = 0
        right = 1
      end
      (nb+1).times{|i|
        if n <= 1
          # insert_cell indices, :via, x0, y, vs, u1, fill_metal
          insert_cell_bridge_special indices, head, x + (right - left)*i*pitch, y0, vs, u1, true # false
          #insert_cell indices, body, x, y0, vs, u1
        else
          offset = w- pitch*n
          (y0-w/2 + offset/2 + pitch/2).step(y0+w/2-vs/2, pitch){|y|
            insert_cell_bridge_special indices, head, x + (right - left)*i*pitch  , y, vs, u1, false
          }
          vs2 = vs # + u1/4
        end
      }
      x1 = x-vs/2 - pitch*nb*left # -u1/8*left
      y1 =  y0-w/2
      x2 =  x+vs/2 + pitch*nb*right # +u1/8*right
      y2 =  y0+w/2
      create_box indices[:m1], x1 ,y1 ,x2, y2
      create_box indices[body], x1 ,y1 ,x2, y2
      create_box indices[:narea], x1-u1/2 ,y1-u1/2 ,x2+u1/2, y2+u1/2 if body == :diff
    end
       
    def produce_impl_core(indices, body, head, via_size = 9.0.um, grid = 4.0.um )
      rw = (w/layout.dbu).to_i
      rl = (l/layout.dbu).to_i
      vs = (via_size/layout.dbu).to_i
      sl = s.split(/[,\s]+/).map{|s| (s.to_f/layout.dbu).to_i}
      rrl = rl.abs + sl.map{|a| a.abs}.sum
      u1 = (grid/layout.dbu).to_i
      nbc = nb.split(/[,\s]+/).map &:to_i
      x = vs/2
      y = (rl > 0) ? vs : 0
      ys = y + rl
      create_contacts_horizontally_bridge_special indices, rw, x, vs/2, vs, u1, body, head, ys, nbc[0]
      points = [Point::new(x, y), Point::new(x, ys)]
      xs = x
      xh = xs
      yh = (rl > 0 )? ys + vs/2 : ys - vs/2
      p = -rl
      count = 0
      sl.each{|s| 
        next if s == 0
        if count % 2 == 0
          xs = (p > 0) ? xs - s : xs + s
          xh = (p*s > 0) ? xs - vs/2 : xs + vs/2
          yh = ys
        else 
          ys = (p > 0) ? ys - s : ys + s
          yh = (p*s > 0) ? ys - vs/2 : ys + vs/2
          xh = xs
        end
        p = s
        points << Point::new(xs, ys)
        count = count + 1
      }
      if count % 2 == 0
        create_contacts_horizontally_bridge_special indices, rw, xh, yh, vs, u1, body, head, ys, nbc[1]||nbc[0]
      else
        create_contacts_vertically_bridge_special indices, rw, xh, yh, vs, u1, body, head, xs, nbc[1]||nbc[0]
      end
      cell.shapes(indices[body]).insert(Path::new(points, rw, 0, 0))
      cell.shapes(indices[:res]).insert(Path::new(points, rw, 0, 0))  
      cell.shapes(indices[:narea]).insert(Path::new(points, rw+u1, u1/2, u1/2)) if body == :diff 
      [[[vs/2-rw/2, 0].min, vs - rw, vs/2+rw/2, vs+rl+vs+u1/4], u1]
    end
  end
  class MinedaNbridge < MinedaBridge
    include RBA
 
    def display_text_impl
      if mb
        "ML2 bridge\r\n(L=#{l.to_s}um,W=#{w.to_s}um, s=#{s}um"
      else
        "Ndiff bridge\r\n(L=#{l.to_s}um,W=#{w.to_s}um, s=#{s}um => R=#{rval.round(3)}"
      end
    end

    def coerce_parameters_impl
      sheet_resistance = 81
      set_rval(sheet_resistance * l / w)
    end     
  end
end
##############################################################################################
