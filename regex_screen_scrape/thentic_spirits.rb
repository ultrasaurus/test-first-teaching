require 'open-uri'

class FeaturedCompanies
  def scrape_screen
    get_url = open('http://thentic.com/discover/product_categories/498')
    html = get_url.read  
  end
  
  def get_company
    company = scrape_screen.match(/<img alt="(.*)" border/)
    company[1]   
  end
end