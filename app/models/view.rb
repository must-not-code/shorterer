class View < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :short_url, counter_cache: true

  def as_indexed_json(options = {})
    self.as_json(
      only: [:id, :platform, :device, :country, :created_at],
      include: {
        short_url: {
          only: [:slug]
        }
      }
    )
  end

  def self.test_search(slug)
    View.__elasticsearch__.search(
      query: {
        bool: {
          must: {
            match: {
              'short_url.slug': slug
            }
          },
          filter: {
            range: {
              created_at: {
                gte: 'now-30d'
              }
            }
          }
        }
      }
    )
  end
end
