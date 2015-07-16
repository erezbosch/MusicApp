class Note < ActiveRecord::Base
  validates :track_id, :user_id, :text, presence: true

  belongs_to :user
  belongs_to :track
end
