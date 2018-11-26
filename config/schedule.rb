every :hour do
  runner 'CurrencyRate.get_fresh_rates'
end
