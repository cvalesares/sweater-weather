class BackgroundPhoto
  attr_reader :id,
              :location,
              :image_url,
              :author,
              :logo,
              :download

  def initialize(data)
    @location   = data[:user][:location]
    @image_url  = data[:urls][:raw]
    @author     = data[:user][:name].concat(" on Upsplash")
    @logo       = data[:user][:profile_image][:small]
    @download   = data[:links][:download]
  end
end
