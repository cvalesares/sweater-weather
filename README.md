# README

Sweater Weather (5 day solo sprint project)
-------------------------------------------
![Christian Valesares](https://github.com/cvalesares)

Sweater Weather is an application that can be used to plan road trips. This app allows the user to see current weather conditions as well as forecasted weather conditions at the destination at the time of arrival.

## Architecture

This app was built using a service-oriented architecture. This backend part of the app is responsible for exposing data for the front-end to consume and display to our end users.

## Schema
![Imgur](https://imgur.com/a/MbvC8U8)

## Tools Used:

- Rails 6.1.4.4
- Ruby 2.7.2
- PostgreSQL
- Bcrypt

## Setup

* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:{create, migrate}`
* Run test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action!

## Endpoints
- Returns a forecast with current, daily, and hourly weather conditions for a location param
    *  GET `http://localhost:3000/api/v1/forecast?location={location}`

    Example response:
    ```
    {
    "data": {
        "id": "null",
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "date_time": "2022-01-16T17:47:27.000-05:00",
                "sunrise": "2022-01-16T09:18:40.000-05:00",
                "sunset": "2022-01-16T19:00:24.000-05:00",
                "temp": 46.53,
                "feels_like": 42.53,
                "humidity": 29,
                "uvi": 0.18,
                "visibility": 10000,
                "conditions": "scattered clouds",
                "icon": "03d"
            },
            "daily_weather": [
                {
                    "date": "2022-01-16",
                    "sunrise": "2022-01-16T09:18:40.000-05:00",
                    "sunset": "2022-01-16T19:00:24.000-05:00",
                    "max_temp": 46.8,
                    "min_temp": 33.48,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "date": "2022-01-17",
                    "sunrise": "2022-01-17T09:18:14.000-05:00",
                    "sunset": "2022-01-17T19:01:30.000-05:00",
                    "max_temp": 52.9,
                    "min_temp": 34.39,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-01-18",
                    "sunrise": "2022-01-18T09:17:46.000-05:00",
                    "sunset": "2022-01-18T19:02:38.000-05:00",
                    "max_temp": 49.01,
                    "min_temp": 34.03,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2022-01-19",
                    "sunrise": "2022-01-19T09:17:15.000-05:00",
                    "sunset": "2022-01-19T19:03:46.000-05:00",
                    "max_temp": 34.79,
                    "min_temp": 28.94,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2022-01-20",
                    "sunrise": "2022-01-20T09:16:43.000-05:00",
                    "sunset": "2022-01-20T19:04:54.000-05:00",
                    "max_temp": 44.47,
                    "min_temp": 28.98,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "17:00:00",
                    "temp": 46.62,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "18:00:00",
                    "temp": 46.53,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "19:00:00",
                    "temp": 45.41,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "20:00:00",
                    "temp": 43.27,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "time": "21:00:00",
                    "temp": 41.11,
                    "conditions": "few clouds",
                    "icon": "02n"
                },
                {
                    "time": "22:00:00",
                    "temp": 38.66,
                    "conditions": "few clouds",
                    "icon": "02n"
                },
                {
                    "time": "23:00:00",
                    "temp": 35.91,
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": "00:00:00",
                    "temp": 35.17,
                    "conditions": "clear sky",
                    "icon": "01n"
                }
            ]
        }
    }
}
    ```
- Returns a background photo of the location param
    *  GET `http://localhost:3000/api/v1/backgrounds?location={location}`

    Example response:
    ```
    {
    "data": {
        "type": "image",
        "id": "null",
        "attributes": {
            "image": {
                "location": "Denver Colorado",
                "image_url": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyOTE2OTd8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2NDIzNjIyMjk&ixlib=rb-1.2.1",
                "author": "Dillon Wanner on Upsplash",
                "logo": "https://images.unsplash.com/profile-1616266477156-e4cd50197e4dimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                "download": "https://unsplash.com/photos/mvtrRdFDzzI/download?ixid=MnwyOTE2OTd8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2NDIzNjIyMjk"
            }
        }
    }
}
    ```
- Returns details of a created road trip based off of user input
    *  POST `http://localhost:3000/api/v1/road_trip`
    *  Must pass origin: destination: and api_key into the body as JSON

    Example response:
    ```
    {
    "data": {
        "id": "null",
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Pueblo,CO",
            "travel_time": "01:45:23",
            "weather_at_eta": {
                "temperature": 59.41,
                "conditions": "few clouds"
            }
        }
    }
}
    ```
- Creates a new user
    * POST `http://localhost:3000/api/v1/users`
    * Must pass email: password: and password_confirmation: into the body as JSON

    Example response:
    ```
    {
    "data": {
        "id": "188",
        "type": "user",
        "attributes": {
            "email": "lburger@yahoo.com",
            "api_key": "yhzaemeyhswnvkjbxpdxvvffginvdxjqvxxltobompdrtzsyjd"
        }
    }
}
    ```
- Logs in an existing user
  * POST `http://localhost:3000/api/v1/sessions`
  * Must pass email: and password: into the body as JSON

  Example response:
  ```
  {
    "data": {
        "id": "188",
        "type": "user",
        "attributes": {
            "email": "lburger@yahoo.com",
            "api_key": "yhzaemeyhswnvkjbxpdxvvffginvdxjqvxxltobompdrtzsyjd"
        }
    }
}
  ```

## APIs
- [Mapquest API](https://developer.mapquest.com/)
- [OpenWeather API](https://openweathermap.org/api/one-call-api)
- [Unspash API](https://unsplash.com/developers)
