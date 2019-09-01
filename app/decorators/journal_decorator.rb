class JournalDecorator < Draper::Decorator
  delegate_all
  decorates_association :entries, with: EntryDecorator

  def card_view
    h.content_tag :div, class: "card #{'border-danger' if object.public}" do
      h.image_tag('composition_book_cover.jpeg', class: 'img-fluid') +
        h.content_tag(:div, class: 'card-body') do
          h.content_tag(:h5, object.name, class: 'card-title') +
            h.content_tag(:p, object.description, class: 'card-text text-truncate') +
            h.link_to('Open', object.public? ? h.journal_path(object) : h.locked_journal_path(object), class: 'btn btn-primary')
        end
    end
  end
end
