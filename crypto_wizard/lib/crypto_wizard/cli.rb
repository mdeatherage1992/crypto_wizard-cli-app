
class CryptoWizard::CLI

def call
  puts "Welcome to the Cryptocurrency Wizard!"
  menu
end

def list_currencies
  @listings = CryptoWizard::Listings.listing
  @listings.each.with_index(1) do |coin, i|
    puts "#{i}. NAME: #{coin.name} - PRICE: $#{coin.price} - MARKET CAP: #{coin.market_cap} - SUPPLY: #{coin.supply}"
  end
end


def menu
  input = nil
  @listings = CryptoWizard::Listings.listing
  while input != 'exit'
    puts "please the # cryptocurrency that you would like to see, list to be shown listings, or exit to exit"
    input = gets.strip.downcase
    if input.to_i > 0 && input.to_i < 5
      puts @listings[input.to_i - 1].name
      puts "PRICE($):"
      puts @listings[input.to_i - 1].price
      puts "SUPPLY:"
      puts @listings[input.to_i - 1].supply
      puts "MARKET CAP($):"
      puts @listings[input.to_i - 1].market_cap
    elsif input == "list"
      list_currencies
    elsif input == "exit"
      goodbye
    else
      puts "not sure what you mean, enter list for listings, or exit to exit"
    end
  end
end


def goodbye
  puts "Have a good day"
end

end
