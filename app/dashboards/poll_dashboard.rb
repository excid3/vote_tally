require "administrate/base_dashboard"

class PollDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    riding: Field::BelongsTo,
    id: Field::Number,
    number: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    candidate_one: Field::Number,
    candidate_two: Field::Number,
    candidate_three: Field::Number,
    candidate_four: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :riding,
    :id,
    :number,
    :created_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :riding,
    :id,
    :number,
    :created_at,
    :updated_at,
    :candidate_one,
    :candidate_two,
    :candidate_three,
    :candidate_four,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :riding,
    :number,
    :candidate_one,
    :candidate_two,
    :candidate_three,
    :candidate_four,
  ].freeze

  # Overwrite this method to customize how polls are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(poll)
  #   "Poll ##{poll.id}"
  # end
end
