require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TranslatorsController do

  describe "GET welcome" do

    it "renders welcome" do
      get :welcome
      response.should have_text(/welcome/)
    end

  end

  describe "GET index" do

    it "renders index" do
      get :index
      response.should render_template('index.html')
    end

    it "renders index with default language english" do
      get :index
      assigns[:language].should == "english"
    end

    it "renders index for piglatin" do
      params[:language] = "piglatin"
      get :index, params
      assigns[:language].should == "piglatin"
    end

  end

end
