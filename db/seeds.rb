View.__elasticsearch__.create_index!(force: true)

su = ShortUrl.create(url: 'https://www.elastic.co/')

100.times do
  View.create(
    short_url_id: su.id,
    platform: %w[iOS MacOS Windows Android].sample,
    device: %w[iPhone7 iPhone11 iMac GalaxyS9].sample,
    country: %w[USA Russia Finland Canada].sample,
    created_at: Date.today - (0..4).to_a.sample.day
  )
end
