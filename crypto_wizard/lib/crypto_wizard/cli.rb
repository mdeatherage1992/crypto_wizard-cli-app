
class CryptoWizard::CLI

def call
  puts "Welcome to the Cryptocurrency Wizard!"
  list_currencies
  menu
end

def list_currencies
@listings = CryptoWizard::Listings.listing
@listings.each.with_index(1) do |coin, i|
  puts "#{i}. NAME: #{coin.name} - PRICE: $#{coin.price} - MARKET CAP: #{coin.market_cap} - SUPPLY: #{coin.supply}"
end
end

def menu
  CryptoWizard::Menu.menu
end

def goodbye
  puts "Have a good day"
end

end
