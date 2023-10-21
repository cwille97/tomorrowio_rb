# tomorrowio_rb
A Ruby wrapper for the Tomorrow.io weather API. Right now this just supports the [weather-forecast endpoint](https://docs.tomorrow.io/reference/weather-forecast) for API v4.

## Installation
`gem install tomorrowio_rb`
## Usage
`require 'tomorrowio_rb'`
Set your API key
`Tomorrowiorb.api_key = ''`
Make requests with (see [API docs](https://docs.tomorrow.io/reference/weather-forecast) for more info)
`result = Tomorrowiorb.forecast(location, timesteps, units)`
Access results via
```
result.status
result.headers
result.body
```

## Contributing
1. Check issues, PRs, and main branch to avoid duplicating work
2. Fork the project
3. Make changes
4. Run tests with `bundle exec rspec`
5. Push the PR
## Disclaimer
This project is not affiliated with [Tomorrow.io](https://tomorrow.io) nor my employer GitHub. Contributions welcome although my resources for this volunteer project are limited. Feel free to submit small PRs although you may first want to open an issue and discuss my capacity to review a larger change. Alternatively, you are welcome to fork the project.
## Credits
Because of my inexperience with Ruby, much of my knowledge came from referencing the archived [forecast-ruby](https://github.com/darkskyapp/forecast-ruby) project.