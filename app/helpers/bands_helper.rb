module BandsHelper
  def summarize(album)
    "#{h(album.name)} " + (album.is_live ? "(live)" : "(studio)")
  end
end
