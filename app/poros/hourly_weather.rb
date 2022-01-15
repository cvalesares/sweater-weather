class HourlyWeather
  attr_reader :time,
              :temp,
              :conditions,
              :icon

  def initialize(data)
    #time and temp need to be reformatted
    @time = data[:dt]
    @temp = data[:temp]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end
