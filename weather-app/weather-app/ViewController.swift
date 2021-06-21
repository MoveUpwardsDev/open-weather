//
//  ViewController.swift
//  weather-app
//
//  Created by lgriffie on 16/06/2021.
//

import Combine
import UIKit
import WeatherApi

class ViewController: UIViewController {

    private var disposables = Set<AnyCancellable>()

    // MARK: - IBOutlet

    @IBOutlet weak private var progress: UIActivityIndicatorView!
    @IBOutlet weak private var city: UILabel!
    @IBOutlet weak private var temperature: UILabel!
    @IBOutlet weak private var min: UILabel!
    @IBOutlet weak private var max: UILabel!
    @IBOutlet weak private var picture: UIImageView!
    @IBOutlet weak private var forecastContainer: UIView!
    @IBOutlet weak private var forecasts: UIStackView!

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        refresh()
    }

    // MARK: - Private functions

    private func refresh() {
        updateCurrent()
        updateForecast()
    }

    private func updateCurrent() {
        progress.startAnimating()
        Current.current
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion  in
                self?.progress.stopAnimating()
                if case let .failure(error) = completion {
                    print(error)
                }
            } receiveValue: { [weak self] in self?.update(current: $0) }
            .store(in: &disposables)
    }

    private func updateForecast() {
        Forecast.forecast
            .receive(on: DispatchQueue.main)
            .sink { completion  in
                if case let .failure(error) = completion {
                    print(error)
                }
            } receiveValue: { [weak self] in self?.update(forecast: $0.list) }
            .store(in: &disposables)
    }

    private func update(current: Current) {
        city.text = current.name
        temperature.text = String(format: "%.f°",  current.main.temp)
        min.text = String(format: "Max. %.f°",  current.main.tempMax)
        max.text = String(format: "Min. %.f°",  current.main.tempMin)

        current.weather.first?.icon
            .receive(on: DispatchQueue.main)
            .compactMap { $0 }
            .map { UIImage(data: $0) }
            .sink { completion  in
                if case let .failure(error) = completion {
                    print(error)
                }
            } receiveValue: { [weak self] in self?.picture.image = $0 }
            .store(in: &disposables)
    }

    private func update(forecast: [Hourly]) {
        let df = DateFormatter()
        df.dateFormat = "HH'h'"

        forecasts.arrangedSubviews.forEach { $0.removeFromSuperview() }

        forecast.forEach { hour in
            guard let hourView: HourView = UIView.fromNib() else { return }

            hourView.time.text = df.string(from: hour.dt)
            hour.weather.first?.icon
                .receive(on: DispatchQueue.main)
                .compactMap { $0 }
                .map { UIImage(data: $0) }
                .sink { completion  in
                    if case let .failure(error) = completion {
                        print(error)
                    }
                } receiveValue: { hourView.icon.image = $0 }
                .store(in: &disposables)

            hourView.temperature.text = String(format: "%.f°",  hour.main.temp)
            forecasts.addArrangedSubview(hourView)
        }

        forecastContainer.isHidden = forecast.isEmpty
    }
}

