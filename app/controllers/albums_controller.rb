class AlbumsController < ApplicationController
  def search
    @albums = Albums.new.search(params["query"])
  end
end
