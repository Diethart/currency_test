class CurrencyRate < ApplicationRecord
  extend Enumerize

  enumerize :currency, in: %i(USD EUR), scope: true

  scope :recent_rates, -> { where('created_at > ?', DateTime.now - 1.day) }

  class << self

    %i(sell buy).each do |operation|
      define_method("#{operation}_average_of") do |currency|
        (recent_rates.with_currency(currency).pluck(operation).reduce(:+)/recent_rates.with_currency(currency).count).round(2)
      end
    end

    def get_fresh_rates
      rates_data = TinkoffAPIParser.new

      currency.values.each do |cu|
        create(rates_data.rates_of cu)
      end
    end
  end
end
