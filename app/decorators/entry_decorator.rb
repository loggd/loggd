class EntryDecorator < ApplicationDecorator
  delegate_all

  def card_view
    h.content_tag :div, class: 'card' do
      h.image_tag('paper.png', class: 'img-fluid', alt: 'aged paper') +
        h.content_tag(:div, class: 'card-body') do
          h.content_tag(:h5, object.title, class: 'card-title') +
            h.content_tag(:p, "created #{h.distance_of_time_in_words(object.created_at, Time.zone.now)} ago", class: 'card-text text-muted') +
            h.link_to('Read', h.journal_entry_path(object.journal, object), class: 'btn btn-primary')
        end
    end
  end
end
