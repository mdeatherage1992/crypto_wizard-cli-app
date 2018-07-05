class CryptoWizard::Listings
  attr_accessor :name,:price,:market_cap,:supply


  def self.listing
    CryptoWizard::Scraper.scrape_coins
  end


end
