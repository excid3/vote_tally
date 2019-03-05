require "administrate/base_dashboard"

class RidingDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    region: Field::BelongsTo,
    polls: Field::HasMany,
    id: Field::Number,
    number: Field::Number,
    name: Field::String,
    province: Field::String,
    eligible_voters: Field::Number,
    win_number: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    liberal_vote_count: Field::Number,
    conservative_vote_count: Field::Number,
    ndp_vote_count: Field::Number,
    green_vote_count: Field::Number,
    peoples_vote_count: Field::Number,
    total_vote_count: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :region,
    :polls,
    :id,
    :number,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :region,
    :polls,
    :id,
    :number,
    :name,
    :province,
    :eligible_voters,
    :win_number,
    :created_at,
    :updated_at,
    :liberal_vote_count,
    :conservative_vote_count,
    :ndp_vote_count,
    :green_vote_count,
    :peoples_vote_count,
    :total_vote_count,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :region,
    :polls,
    :number,
    :name,
    :province,
    :eligible_voters,
    :win_number,
    :liberal_vote_count,
    :conservative_vote_count,
    :ndp_vote_count,
    :green_vote_count,
    :peoples_vote_count,
    :total_vote_count,
  ].freeze

  # Overwrite this method to customize how ridings are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(riding)
  #   "Riding ##{riding.id}"
  # end
end
