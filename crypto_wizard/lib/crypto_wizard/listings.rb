class CryptoWizard::Listings
  attr_accessor :name,:price,:market_cap,:supply


  def self.listing
    self.scrape_coins
  end


def self.scrape_coins
coins = []
coins << self.create_bitcoin
coins << self.create_ethereum
coins << self.create_ripple
coins << self.create_eos
end


# def scrape_bitcoin
#   coin_creator("https://coinmarketcap.com/currencies/bitcoin")
# end
#
# def scrape_ethereum
#   coin_creator("https://coinmarketcap.com/currencies/ethereum")
# end
#
# def scrape_ripple
#   coin_creator("https://coinmarketcap.com/currencies/ripple")
# end
#
# def scrape_eos
#   coin_creator("https://coinmarketcap.com/currencies/eos")
# end







def self.create_eos
  scraped_coin = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/eos"))
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

def self.create_ripple
  scraped_coin = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/ripple"))
  coin = self.new
  coin.name = scraped_coin.search("h1.details-panel-item--name").text.gsub("\n","")
market_cap_setter = scraped_coin.search("div.coin-summary-item-detail")[0]
  coin.market_cap = market_cap_setter.search("span span").text.gsub("\n","").split("USD")[0]
circulating_supply = scraped_coin.search("div.coin-summary-item-detail")[2]
  coin.supply = circulating_supply.search("span").text.gsub("\n","")
price_setter = coin.market_cap.to_i.round(1)/coin.supply.to_i.round(1)
  coin.price = (price_setter).round(2).to_s

coin

end


def self.create_ethereum
  scraped_coin = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/ethereum"))
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


def self.create_bitcoin
  scraped_coin = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/bitcoin"))
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





# def self.scrape_coin_cap
#   doc_2 = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/bitcoin"))
#   doc_3 = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/ethereum"))
#
#
#   coin = self.new
#     coin.name = doc_2.search("h1.details-panel-name").text.gsub("\n","")
#   market_cap_setter = doc_2.search("div.coin-summary-item-detail")[0]
#     coin.market_cap = market_cap_setter.search("span span").text.gsub("\n","").split("USD")[0]
#   circulating_supply = doc_2.search("div.coin-summary-item-detail")[2]
#     coin.supply = circulating_supply.search("span").text.gsub("\n","")
#   price_setter = coin.market_cap.to_i.round(4)/coin.supply.to_i.round(4)
#     coin.price = (price_setter * 1000).round.to_s
#   coin
#
#   binding.pry
# end



end







#items = doc_2.search("div.coin-summary-item-detail")
# eth_setter = doc_3.search("div.coin-summary-item-detail")[0]
# eth_supply_setter = doc_3.search("div.coin-summary-item-detail")[2]
# eth_cap = eth_setter.search("span span").text.gsub("\n","").split("USD")[0]
#
# eth_supply = eth_supply_setter.search("span").text.gsub("\n","")
#
#
# eth_price = eth_cap.to_i.round(4)/eth_supply.to_i.round(4)
# eth_new_price = (eth_price * 1000).round


# new_supply = market_cap.search("span span").text.gsub("\n","").split("USD")[1]
#go to coinmarket cap
#extract properties
#instatiate a coin
#end up with an array of coins that were scraped

# volume = doc_2.search("div.coin-summary-item-detail")[1]
# circulating_supply = doc_2.search("div.coin-summary-item-detail")[2]
# max_supply = doc_2.search("div.coin-summary-item-detail")[3]
# Should return one single instance of a cryptocurrency market cap & current price

# puts "Bitcoin"
# puts "Litecoin"
# puts "Ethereum"
# puts "EOS"
# puts "Ripple"

# coin = self.new
# coin.name = "bitcoin"
# coin.price = "$6,000"
# coin.mc = "$10,000,000"
# coin.url = url
