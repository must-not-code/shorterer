class ShortUrl < ApplicationRecord
  has_many :views

  validates_presence_of :url
  validates :url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :slug
  validates_length_of :url, within: 10..255
end
