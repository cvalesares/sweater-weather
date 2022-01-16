class UnsplashFacade
  def self.photo(search)
    payload = UnsplashService.photo(search)
    payload[:results].map do |result|
      BackgroundPhoto.new(result)
    end
  end
end
