class CloudinaryImageUploadInput < Formtastic::Inputs::StringInput
  include Formtastic::Inputs::Base

  def to_html
    input_wrapping do
      image_exists = object.send(method.intern).present?
      label_html <<
      (image_exists ? template.image_tag(object.send("#{method}_url".intern, :standard), :class => "upload-preview") + "<br />".html_safe : '<img class="upload-preview"/>').html_safe + builder.cl_image_upload(method) + "<br /><div class=\"upload-status\"></div>".html_safe
    end
  end
end
