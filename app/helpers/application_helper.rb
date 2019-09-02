module ApplicationHelper
  def controller_stylesheet(opts = { media: :all })
    if asset_exists?(Rails.root.join("app/assets/stylesheets/#{controller_name}.css"))
      stylesheet_link_tag(controller_name, opts)
    end
  end

  def controller_javascript(opts = {})
    if asset_exists?(Rails.root.join("app/assets/javascripts/#{controller_name}.js"))
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

    def asset_exists?(path)
      if Rails.configuration.assets.compile
        Rails.application.precompiled_assets.include?(path)
      else
        Rails.application.assets_manifest.assets[path].present?
      end
    end
end
