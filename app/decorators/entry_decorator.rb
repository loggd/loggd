class EntryDecorator < ApplicationDecorator
  delegate_all

  def card_view
    h.content_tag :div, class: 'card' do
      h.content_tag(:div, class: 'card-body') do
        h.content_tag(:h5, object.name, class: 'card-title') +
          h.content_tag(:p, object.description, class: 'card-text') +
          h.link_to('Read', h.journal_entry_path(object), class: 'btn btn-primary')
      end
    end
  end
end
