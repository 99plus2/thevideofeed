module VideosHelper
  def embed(video)
    "<iframe width='560' height='315' src='http://www.youtube.com/embed/#{video.key}' frameborder='0' allowfullscreen></iframe>".html_safe
  end
end