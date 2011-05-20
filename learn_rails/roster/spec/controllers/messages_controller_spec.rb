require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MessagesController do

    describe "GET hello" do

      it "renders hello" do
        get :hello
        response.should have_text(/Hello/)
      end

      it "renders hello with name" do
        params[:name] = "Sarah"
        get :hello, params
        response.should have_text("Hello Sarah")
      end

    end

    describe "GET fancy_hello" do

      it "renders fancy_hello" do
        get :fancy_hello
        response.should render_template('fancy_hello.html')
      end

      it "renders fancy_hello with name" do
        name = "Mike"
        params[:name] = name

        get :fancy_hello, params
        assigns[:name].should == name
        response.should render_template('fancy_hello.html')
      end
    end
end
