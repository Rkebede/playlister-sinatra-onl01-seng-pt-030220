class Song < ActiveRecord::Base 
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.tr(" ","-")
  end 

  def self.find_by_slug(slug)
    self.all.find do |instance|
      instance.slug == slug
    end 
  end 
end