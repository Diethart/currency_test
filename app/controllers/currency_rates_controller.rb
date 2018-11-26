class CurrencyRatesController < ApplicationController
  def recent_stats
    @eur_stats = CurrencyRate.recent_rates.with_currency(:EUR)
    @usd_stats = CurrencyRate.recent_rates.with_currency(:USD)
  end
end
