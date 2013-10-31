class Series < ActiveRecord::Base
  has_many :stories, -> { order 'position asc' }
  accepts_nested_attributes_for :stories, allow_destroy: true
end
