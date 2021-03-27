class ShortUrl < ApplicationRecord
  has_many :views

  before_validation :generate_slug

  validates_presence_of :url
  validates :url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :slug
  validates_length_of :url, within: 10..255

  def generate_slug
    self.slug = SecureRandom.hex(5)
  end
end
