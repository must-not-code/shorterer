class View < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :short_url, counter_cache: true

  def as_indexed_json(options = {})
    self.as_json(
      only: [:id, :platform, :device, :country, :fingerprint, :created_at],
      include: {
        short_url: {
          only: [:slug]
        }
      }
    )
  end

  def self.statistics(slug)
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
      },
      size: 0,
      aggs: {
        date: {
          date_histogram: {
            field: 'created_at',
            interval: 'day',
            order: {
              _key: 'desc'
            }
          },
          aggs: {
            uniq_views: {
              cardinality: {
                field: 'fingerprint.keyword',
              }
            }
          },
        },
        platform: {
          terms: {
            field: 'platform.keyword',
            order: {
              _count: 'desc'
            }
          },
          aggs: {
            uniq_views: {
              cardinality: {
                field: 'fingerprint.keyword',
              }
            }
          },
        },
        device: {
          terms: {
            field: 'device.keyword',
            order: {
              _count: 'desc'
            }
          },
          aggs: {
            uniq_views: {
              cardinality: {
                field: 'fingerprint.keyword',
              }
            }
          },
        },
        country: {
          terms: {
            field: 'country.keyword',
            order: {
              _count: 'desc'
            }
          },
          aggs: {
            uniq_views: {
              cardinality: {
                field: 'fingerprint.keyword',
              }
            }
          },
        }
      }
    ).aggregations
  end
end
