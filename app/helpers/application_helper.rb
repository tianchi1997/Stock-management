module ApplicationHelper
  def nested_display(objects, object_display, child_attribute, depth = 0)
    capture do
      objects.map do | object |
        concat send(object_display, objects[0], depth)
        concat nested_display(object.send(child_attribute), object_display, child_attribute, depth + 1)
      end.join.html_safe
    end
  end

  def nested_div(div, depth)
    depth.times do
      div = content_tag(:div, div, class: "nested_display")
    end

    return div
  end
end
