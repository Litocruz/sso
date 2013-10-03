module ApplicationHelper

  def link_to_add_fields(name, f, association)  
    new_object = f.object.class.reflect_on_association(association).klass.new  
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |b|  
      render(association.to_s.singularize + "_fields", :f => b)  
    end  
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))  
  end 

  #Si no encuentra un subtitulo agrega
  #uno por defecto
  def full_title (page_title)
    base_title = "SSO Manager"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end


  @@data_per_page = 3
  
  def sortable(column, title = nil)
    title ||= column.titleize
    column_css = nil
    direction = "asc"

    if column == sort_column
      direction_css = "headerSortUp"
      
      if sort_direction == "asc"
        direction_css = "headerSortDown"
        direction = "desc"
      end
      
      column_css = column == sort_column ? "header #{direction_css}" : nil      
    end

    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => column_css}
  end

#    title ||= column.titleize
#    direction_css = column == sort_column && sort_direction == "asc" ? "header headerSortDown" : "header headerSortUp"
#    column_css = column == sort_column ? "header #{direction_css}" : nil
#    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
#    link_to title, {:sort => column, :direction => direction}, {:class => column_css}

end
