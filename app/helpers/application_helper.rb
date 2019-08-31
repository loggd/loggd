module ApplicationHelper
  def controller_stylesheet(opts = { media: :all })
    if Rails.application.assets.find_asset("#{controller_name}.css")
      stylesheet_link_tag(controller_name, opts)
    end
  end

  def controller_javascript(opts = {})
    if Rails.application.assets.find_asset("#{controller_name}.js")
      javascript_include_tag(controller_name, opts)
    end
  end
end
