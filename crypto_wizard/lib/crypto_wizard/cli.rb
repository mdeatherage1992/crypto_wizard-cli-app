require 'pry'
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
  input = nil
  while input != 'exit'
    puts "please the # cryptocurrency that you would like to see, list to be shown listings, or exit to exit"
    input = gets.strip.downcase
    if input.to_i > 0
      puts @listings[input.to_i - 1].name
      puts "PRICE:"
      puts @listings[input.to_i - 1].price
      puts "SUPPLY:"
      puts @listings[input.to_i - 1].supply
      puts "MARKET CAP:"
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




#     if input.to_i > 0
#       the_coin = @listings[input.to_i - 1]
#       puts "#{the_coin.name} - #{the_coin.price} - #{the_coin.mc} - #{the_coin.url}"
#       puts @prices[input.to_i - 1]
#     elsif input == 'list'
#       list_currencies
#     else
#     puts "not sure what you're looking for, enter list or exit."
#   end
# end
# end
