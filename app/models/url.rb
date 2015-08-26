class Url < ActiveRecord::Base
  # Remember to create a migration!

  validates_format_of :url, with: URI.regexp(['http', 'https'])

  def self.generate_short_url
      @shortened_url = ('a'..'z').to_a.shuffle[0,5].join
  end

  def self.get_url(short_url)
    link = self.find_by shortened_url: short_url
    link.click_count = link.click_count + 1
    link.save
    link.url
  end

end
