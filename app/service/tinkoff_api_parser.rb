require 'open-uri'

class TinkoffAPIParser
  API_URL = 'https://www.tinkoff.ru/api/v1/currency_rates'

  def initialize
    @rates = parse_data
  end

  def rates_of(currency)
    currency.upcase!
    raise ArgumentError, 'wrong currency' unless currency == 'EUR' || currency == 'USD'

    @rates.find { |node| node['fromCurrency']['name'] == currency }.slice('buy', 'sell').merge('currency': currency)
  end

  private

  def parse_data
    raw_data = JSON.load(open(API_URL))
    raise Exception, raw_data['resultCode'] unless raw_data['resultCode'] == 'OK'

    raw_data['payload']['rates'].select { |node| node['category'] == 'DepositPayments' }
      .select { |node| node['toCurrency']['name'] == 'RUB' }
  end
end
