# ⛽️ Refuelings collector

[![Coverage Status](https://coveralls.io/repos/github/segoy89/refuelings-collector/badge.svg?branch=master)](https://coveralls.io/github/segoy89/refuelings-collector?branch=master)

Simple app to helps you with tracking your car refuelings. Possible to store such information like:

- `liters` - how much liters you tanked
- `kilometers` - howmany kilometers you drove since last refueling
- `cost` - how much you spent for gasoline
- `avg_fuel_consumption` - average fuel consumption per 100 kilometers
- `note` - some notes if needed

Started with [kickoff_tailwind](https://github.com/justalever/kickoff_tailwind).

Using StimulusReflex to live update average fuel consumption.

## Demo

Deployed to `fly.io`.

 You can register with some fake email address - no confirmation needed.

<https://refueling.fly.dev/>

## Mobile app

<https://github.com/segoy89/refuelings_collector/>

## Techstack

- Rails 7
- Ruby 3.1
- Postgresql
- Node 16.20.2
