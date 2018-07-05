class CryptoWizard::Menu
  attr_accessor :name,:price,:market_cap,:supply

@listings =  CryptoWizard::Listings.listing

def self.menu
  input = nil
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
      CryptoWizard::CLI.goodbye
    else
      puts "not sure what you mean, enter list for listings, or exit to exit"
    end
  end
end






end
