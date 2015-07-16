class Track < ActiveRecord::Base
  before_validation :ensure_is_bonus
  validates :name, :album_id, presence: true
  belongs_to :album
  has_one :band, through: :album, source: :band

  private
  def ensure_is_bonus
    self.is_bonus = false unless is_bonus
    true
  end
end
