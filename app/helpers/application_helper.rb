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

  def tab(value)
    @page_tab = value
  end

  def alert_class(key)
    "alert alert-#{alert_map[key.to_sym]}"
  end

  private

    def alert_map
      {
        alert: 'danger',
        notice: 'success'
      }
    end
end
