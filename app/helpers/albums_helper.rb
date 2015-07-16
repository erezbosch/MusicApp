module AlbumsHelper
  def summarize_track(track)
    track.is_bonus ? "#{track.name} (bonus track)" : track.name
  end
end
