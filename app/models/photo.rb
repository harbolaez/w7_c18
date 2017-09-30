class Photo < ApplicationRecord

  validates_presence_of :title, :album_id

  belongs_to :album
end
