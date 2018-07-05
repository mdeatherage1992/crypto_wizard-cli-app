class CryptoWizard::Scraper
  attr_accessor :name,:price,:market_cap,:supply


  def self.scrape_coins
    coins = []
    coins << self.create_bitcoin
    coins << self.create_ethereum
    coins << self.create_ripple
    coins << self.create_eos
    coins << self.create_neo
  end

  def self.giri_scrape(scraped_coin)
  coin = self.new
  coin.name = scraped_coin.search("h1.details-panel-item--name").text.gsub("\n","")
  market_cap_setter = scraped_coin.search("div.coin-summary-item-detail")[0]
  coin.market_cap = market_cap_setter.search("span span").text.gsub("\n","").split("USD")[0]
  circulating_supply = scraped_coin.search("div.coin-summary-item-detail")[2]
  coin.supply = circulating_supply.search("span").text.gsub("\n","")
  price_setter = coin.market_cap.to_i.round(4)/coin.supply.to_i.round(4)
  coin.price = (price_setter * 1000).round.to_s
  coin
  end

  def self.create_neo
    scraped_coin = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/neo"))
    giri_scrape(scraped_coin)
  end


  def self.create_eos
    scraped_coin = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/eos"))
    giri_scrape(scraped_coin)
  end

  def self.create_ripple
    scraped_coin = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/ripple"))
    giri_scrape(scraped_coin)
  end


  def self.create_ethereum
    scraped_coin = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/ethereum"))
    giri_scrape(scraped_coin)
  end


  def self.create_bitcoin
    scraped_coin = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/bitcoin"))
    giri_scrape(scraped_coin)
  end

end
