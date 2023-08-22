require "httparty"

class Albums
  include HTTParty
  base_uri "https://itunes.apple.com"

  def initialize
    @options = {query: {}}
  end

  def search(query, media_type = "music")
    @options[:query][:term] = query
    @options[:query][:media] = media_type
    response = self.class.get("/search", @options)

    handle_response(response)
  end

  private

  def handle_response(response)
    if response.success?
      results = JSON.parse(response.body)["results"].uniq { |album| album["collectionId"] }
      results.map do |album_data|
        Album.find_or_create_by(external_id: album_data["collectionId"]) do |album|
          album.thumbnail = album_data["artworkUrl100"]
          album.title = album_data["collectionName"]
          album.subtitle = album_data["artistName"]
        end
      end
    else
      raise "Request failed with code #{response.code}: #{response["error"]}"
    end
  end
end
