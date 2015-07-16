module TracksHelper
  include ERB::Util

  def ugly_lyrics(lyrics)
    uglyrics = lyrics.split("\n")[0...-1].map { |line| "&#9835; " + h(line) }
    "<pre>#{uglyrics.join}</pre>".html_safe
  end
end
