module ActiveAdmin
  module Views
    class Footer < Component

      def build
        super :id => "footer"
        cloudinary_js_config
      end
    end
  end
end
