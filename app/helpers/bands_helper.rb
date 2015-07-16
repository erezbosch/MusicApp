module BandsHelper
  def summarize(album)
    "#{album.name} " + (album.is_live ? "(live)" : "(studio)")
  end
end
