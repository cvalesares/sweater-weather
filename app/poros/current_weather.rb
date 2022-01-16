class CurrentWeather
attr_reader :date_time,
            :sunrise,
            :sunset,
            :temp,
            :feels_like,
            :humidity,
            :uvi,
            :visibility,
            :conditions,
            :icon,
            :id

  def initialize(data)
    @date_time      = Time.at(data[:dt]).to_datetime
    @sunrise        = Time.at(data[:sunrise]).to_datetime
    @sunset         = Time.at(data[:sunset]).to_datetime
    @temp           = data[:temp]
    @feels_like     = data[:feels_like]
    @humidity       = data[:humidity]
    @uvi            = data[:uvi]
    @visibility     = data[:visibility]
    @conditions     = data[:weather].first[:description]
    @icon           = data[:weather].first[:icon]
  end
end
