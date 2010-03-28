require 'thentic_spirits'

describe FeaturedCompanies do
  before do
    @featured_companies = FeaturedCompanies.new
    @featured_companies.stub!(:scrape_screen).and_return('<img alt="Zwack Unicum Rt." border')
  end
  
  it "gets the alt tags for featured companies" do
    @featured_companies.get_company.should == "Zwack Unicum Rt."
  end
end
