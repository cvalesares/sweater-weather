class Weather
attr_reader :date_time,
            :sunrise,
            :sunset,
            :temp,
            :feels_like,
            :humidity,
            :uvi,
            :visibility,
            :conditions,
            :icon

  def initialize(data)
    @date_time = data[:dt]
    @sunrise = data[:sunrise]
    @sunset = data[:sunset]
    @temp = data[:temp]
    @feels_like = data[:feels_like]
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end
