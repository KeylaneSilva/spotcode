class Category < ApplicationRecord
    has_many :albums
    validates :name, presence: true
    has_one_attached :image

    def artists
        Artists.joins(:albums).where(albums: { id: self.albums.ids}).distinct
    end

    def songs
        Song.joins(:albums).where(songs: { id: self.albums.ids}).distinct
    end


end
