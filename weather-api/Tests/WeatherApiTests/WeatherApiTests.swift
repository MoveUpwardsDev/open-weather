import XCTest
@testable import WeatherApi

final class WeatherModelTests: XCTestCase {

    let decoder = JSONDecoder()

    override func setUpWithError() throws {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
    }

    override func tearDownWithError() throws {}

    var current: String {
        """
        {
          "coord": {
            "lon": 2.3488,
            "lat": 48.8534
          },
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01n"
            }
          ],
          "base": "stations",
          "main": {
            "temp": 25.66,
            "feels_like": 25.72,
            "temp_min": 22.39,
            "temp_max": 28.43,
            "pressure": 1009,
            "humidity": 55
          },
          "visibility": 10000,
          "wind": {
            "speed": 2.06,
            "deg": 130
          },
          "clouds": {
            "all": 0
          },
          "dt": 1623879844,
          "sys": {
            "type": 1,
            "id": 6550,
            "country": "FR",
            "sunrise": 1623815191,
            "sunset": 1623873372
          },
          "timezone": 7200,
          "id": 2988507,
          "name": "Paris",
          "cod": 200
        }
        """
    }

    var forecast: String {
        """
        {
          "cod": "200",
          "message": 0,
          "cnt": 5,
          "list": [
            {
              "dt": 1623888000,
              "main": {
                "temp": 23.88,
                "feels_like": 24.1,
                "temp_min": 21.27,
                "temp_max": 23.88,
                "pressure": 1009,
                "sea_level": 1009,
                "grnd_level": 1005,
                "humidity": 68,
                "temp_kf": 2.61
              },
              "weather": [
                {
                  "id": 500,
                  "main": "Rain",
                  "description": "light rain",
                  "icon": "10n"
                }
              ],
              "clouds": {
                "all": 26
              },
              "wind": {
                "speed": 2.44,
                "deg": 187,
                "gust": 7.12
              },
              "visibility": 10000,
              "pop": 0.61,
              "rain": {
                "3h": 0.21
              },
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2021-06-17 00:00:00"
            },
            {
              "dt": 1623898800,
              "main": {
                "temp": 21.34,
                "feels_like": 21.67,
                "temp_min": 19.41,
                "temp_max": 21.34,
                "pressure": 1009,
                "sea_level": 1009,
                "grnd_level": 1005,
                "humidity": 82,
                "temp_kf": 1.93
              },
              "weather": [
                {
                  "id": 500,
                  "main": "Rain",
                  "description": "light rain",
                  "icon": "10n"
                }
              ],
              "clouds": {
                "all": 67
              },
              "wind": {
                "speed": 2.85,
                "deg": 252,
                "gust": 8.75
              },
              "visibility": 10000,
              "pop": 0.61,
              "rain": {
                "3h": 0.55
              },
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2021-06-17 03:00:00"
            },
            {
              "dt": 1623909600,
              "main": {
                "temp": 20.42,
                "feels_like": 20.74,
                "temp_min": 20.42,
                "temp_max": 20.42,
                "pressure": 1011,
                "sea_level": 1011,
                "grnd_level": 1006,
                "humidity": 85,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 803,
                  "main": "Clouds",
                  "description": "broken clouds",
                  "icon": "04d"
                }
              ],
              "clouds": {
                "all": 76
              },
              "wind": {
                "speed": 3.05,
                "deg": 201,
                "gust": 7.49
              },
              "visibility": 10000,
              "pop": 0.42,
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2021-06-17 06:00:00"
            },
            {
              "dt": 1623920400,
              "main": {
                "temp": 25.22,
                "feels_like": 25.26,
                "temp_min": 25.22,
                "temp_max": 25.22,
                "pressure": 1011,
                "sea_level": 1011,
                "grnd_level": 1007,
                "humidity": 56,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 803,
                  "main": "Clouds",
                  "description": "broken clouds",
                  "icon": "04d"
                }
              ],
              "clouds": {
                "all": 62
              },
              "wind": {
                "speed": 3.99,
                "deg": 203,
                "gust": 5.88
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2021-06-17 09:00:00"
            },
            {
              "dt": 1623931200,
              "main": {
                "temp": 29.19,
                "feels_like": 29.2,
                "temp_min": 29.19,
                "temp_max": 29.19,
                "pressure": 1011,
                "sea_level": 1011,
                "grnd_level": 1006,
                "humidity": 44,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 803,
                  "main": "Clouds",
                  "description": "broken clouds",
                  "icon": "04d"
                }
              ],
              "clouds": {
                "all": 72
              },
              "wind": {
                "speed": 3.61,
                "deg": 203,
                "gust": 5.45
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2021-06-17 12:00:00"
            }
          ],
          "city": {
            "id": 2988507,
            "name": "Paris",
            "coord": {
              "lat": 48.8534,
              "lon": 2.3488
            },
            "country": "FR",
            "population": 2138551,
            "timezone": 7200,
            "sunrise": 1623901592,
            "sunset": 1623959796
          }
        }
        """
    }

    func testCurrentDecode() {
        let jsonData = Data(current.utf8)
        let weather = try? decoder.decode(Current.self, from: jsonData)
        XCTAssertNotNil(weather)

        XCTAssertEqual(weather?.id, 2988507)
        XCTAssertEqual(weather?.name, "Paris")

        XCTAssertNotNil(weather?.coord)
        XCTAssertEqual(weather?.coord.lat, 48.8534)
        XCTAssertEqual(weather?.coord.lon, 2.3488)

        XCTAssertNotNil(weather?.weather.first)
        XCTAssertEqual(weather?.weather.first?.id, 800)
        XCTAssertEqual(weather?.weather.first?.main, "Clear")
        XCTAssertEqual(weather?.weather.first?.description, "clear sky")
        XCTAssertEqual(weather?.weather.first?.icon, "01n")

        XCTAssertNotNil(weather?.main)
        XCTAssertEqual(weather?.main.temp, 25.66)
        XCTAssertEqual(weather?.main.feelsLike, 25.72)
        XCTAssertEqual(weather?.main.tempMin, 22.39)
        XCTAssertEqual(weather?.main.tempMax, 28.43)
        XCTAssertEqual(weather?.main.pressure, 1009)
        XCTAssertEqual(weather?.main.humidity, 55)
    }

    func testForecastDecode() {
        let jsonData = Data(forecast.utf8)
        let forecast = try? decoder.decode(Forecast.self, from: jsonData)
        XCTAssertNotNil(forecast)
        
        XCTAssertNotNil(forecast?.city)
        XCTAssertEqual(forecast?.city.id, 2988507)
        XCTAssertEqual(forecast?.city.name, "Paris")
        XCTAssertEqual(forecast?.city.country, "FR")
        XCTAssertEqual(forecast?.city.timezone, 7200)

        XCTAssertNotNil(forecast?.city.coord)
        XCTAssertEqual(forecast?.city.coord.lat, 48.8534)
        XCTAssertEqual(forecast?.city.coord.lon, 2.3488)
    }
}
