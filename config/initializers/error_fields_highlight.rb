ActionView::Base.field_error_proc=Proc.new do |html_tag, instance|
  is_label = html_tag.index "<label>"
  css_class = is_label ? "text-danger" : "is-invalid"

  class_pas = html_tag.index 'class="'
  if class_pas
    html_tag.insert class_pas + 7, "#{css_class} "
  else
    html_tag.insert(html_tag.index(">"), " class=#{css_class}")
  end
end