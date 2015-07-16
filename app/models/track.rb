class Track < ActiveRecord::Base
  validates :name, :album_id, :is_bonus, presence: true
  belongs_to :album
  has_one :band, through: :album, source: :band
end
