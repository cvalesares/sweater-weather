require 'rails_helper'

RSpec.describe 'Forecast Request' do
  it 'gets a list of weather conditions', :vcr do
    location = "Denver,Co"
    get "/api/v1/forecast?location=#{location}"
    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    weather = parsed[:data][:attributes]

    expect(weather).not_to have_key(:minutely)

    expect(weather[:current_weather].count).to eq(10)
    expect(weather[:current_weather]).not_to have_key(:clouds)
    expect(weather[:current_weather]).not_to have_key(:wind_speed)
    expect(weather[:current_weather]).not_to have_key(:wind_deg)
    expect(weather[:current_weather]).not_to have_key(:wind_gust)
    expect(weather[:current_weather]).not_to have_key(:weather)
    expect(weather[:current_weather][:date_time]).to eq("2022-01-15T21:33:58.000-05:00")
    expect(weather[:current_weather][:sunrise]).to eq("2022-01-15T09:19:04.000-05:00")
    expect(weather[:current_weather][:sunset]).to eq("2022-01-15T18:59:18.000-05:00")
    expect(weather[:current_weather][:temp]).to eq(34.83)
    expect(weather[:current_weather][:feels_like]).to eq(32.52)
    expect(weather[:current_weather][:humidity]).to eq(48)
    expect(weather[:current_weather][:uvi]).to eq(0)
    expect(weather[:current_weather][:visibility]).to eq(10000)
    expect(weather[:current_weather][:conditions]).to eq("clear sky")
    expect(weather[:current_weather][:icon]).to eq("01n")

    expect(weather[:daily_weather].count).to eq(5)
    expect(weather[:daily_weather].first).to_not have_key(:moonrise)
    expect(weather[:daily_weather].first).to_not have_key(:moonset)
    expect(weather[:daily_weather].first).to_not have_key(:moon_phase)
    expect(weather[:daily_weather].first).to_not have_key(:pressure)
    expect(weather[:daily_weather].first).to_not have_key(:humidity)
    expect(weather[:daily_weather].first).to_not have_key(:pop)
    expect(weather[:daily_weather].first[:date]).to eq("2022-01-15")
    expect(weather[:daily_weather].first[:sunrise]).to eq("2022-01-15T09:19:04.000-05:00")
    expect(weather[:daily_weather].first[:sunset]).to eq("2022-01-15T18:59:18.000-05:00")
    expect(weather[:daily_weather].first[:max_temp]).to eq(40.71)
    expect(weather[:daily_weather].first[:min_temp]).to eq(25.16)
    expect(weather[:daily_weather].first[:conditions]).to eq("clear sky")
    expect(weather[:daily_weather].first[:icon]).to eq("01d")

    expect(weather[:hourly_weather].count).to eq(8)
    expect(weather[:hourly_weather].first).to_not have_key(:feels_like)
    expect(weather[:hourly_weather].first).to_not have_key(:pressure)
    expect(weather[:hourly_weather].first).to_not have_key(:humidity)
    expect(weather[:hourly_weather].first).to_not have_key(:dew_point)
    expect(weather[:hourly_weather].first).to_not have_key(:uvi)
    expect(weather[:hourly_weather].first).to_not have_key(:clouds)
    expect(weather[:hourly_weather].first).to_not have_key(:visibility)
    expect(weather[:hourly_weather].first).to_not have_key(:wind_speed)
    expect(weather[:hourly_weather].first).to_not have_key(:wind_deg)
    expect(weather[:hourly_weather].first).to_not have_key(:wind_gust)
    expect(weather[:hourly_weather].first[:time]).to eq("21:00:00")
    expect(weather[:hourly_weather].first[:temp]).to eq(34.88)
    expect(weather[:hourly_weather].first[:conditions]).to eq("clear sky")
    expect(weather[:hourly_weather].first[:icon]).to eq("01n")
  end
end
