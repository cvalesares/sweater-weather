# README

Sweater Weather (5 day solo sprint project)
-------------------------------------------
### Christian Valesares

Sweater Weather is an application that can be used to plan road trips. This app allows the user to see current weather conditions as well as forecasted weather conditions at the destination at the time of arrival.

## Architecture

This app was built using a service-oriented architecture. This backend part of the app is responsible for exposing data for the front-end to consume and display to our end users.

## Schema

## Tools Used:

- Rails 6.1.4.4
- Ruby 2.7.2
- PostgreSQL

## Setup

* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:{create, migrate}`
* Run test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action!

## Endpoints
Internal APIs:
- Returns a forecast with current, daily, and hourly weather conditions for a location param
    *  `http://localhost:3000/api/v1/forecast?location={location}`
- Returns a background photo of the location param
    *  `http://localhost:3000/api/v1/backgrounds?location={location}`

## APIs
- Mapquest
- OpenWeather
- Unsplash
