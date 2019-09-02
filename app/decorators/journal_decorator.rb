class JournalDecorator < Draper::Decorator
  delegate_all
  decorates_association :entries, with: EntryDecorator

  def public_card_view
    card_view_for(home_page: false)
  end

  def card_view
    card_view_for(home_page: true)
  end

  private

    def card_view_for(home_page:)
      h.content_tag :div, class: "card #{'border-danger' if home_page && object.public}" do
        h.image_tag('composition_book_cover', class: 'img-fluid') +
          h.content_tag(:div, class: 'card-body') do
            h.content_tag(:h5, object.name, class: 'card-title') +
              h.content_tag(:p, object.description, class: 'card-text text-truncate') +
              h.link_to('Open', object.public? ? h.journal_path(object) : h.locked_journal_path(object), class: 'btn btn-primary')
          end +
          if !home_page && object.user.handle
            h.content_tag(:div, "curated by #{object.user.handle}", class: 'card-footer text-muted')
          end
      end
    end
end
