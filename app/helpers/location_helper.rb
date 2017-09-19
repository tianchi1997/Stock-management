module LocationHelper
  def index_display(location, depth)
    content_tag :tr do
      div = location.name

      depth.times do
        div = content_tag(:div, div, class: "nested_display")
      end
      concat(content_tag(:td, nested_div(location.name, depth)))
      concat(content_tag(:td, location.description))
      concat(content_tag(:td, (link_to('Show', location))))
      concat(content_tag(:td, link_to('Edit', edit_location_path(location))))
      concat(content_tag(:td, link_to('Add Sublocation', new_location_path(location_id: location.id))))
    end
  end
end
