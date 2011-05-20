require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Person do
  it 'should remember first and last name' do
    p = Person.new(:first => "Eve", :last => "Smith")
    p.first.should == "Eve"
    p.last.should == "Smith"
  end

  it 'should construct a full name' do
    p = Person.new(:first => "Eve", :last => "Smith")
    p.full_name.should == "Eve Smith"
  end

  it 'should save a valid record with first and last name' do
    p = Person.new(:first => "Eve", :last => "Smith")
    p.save
    p.should be_valid
  end

  it 'should not save a record with only first name' do
    p = Person.new(:first => "Eve")
    p.save
    p.should_not be_valid
    p.errors[:last].should == "can't be blank"
  end

  it 'should not save a record with only last name' do
    p = Person.new(:last => "Smith")
    p.save
    p.should_not be_valid
    p.errors[:first].should == "can't be blank"
  end

  it 'should have many courses' do
    p = Person.new(:first => "Eve", :last => "Smith")
    p.should respond_to :courses
  end

  it 'should have many courses' do
    p = Person.new(:first => "Eve", :last => "Smith")
    p.courses.should be_empty
  end

  it 'should have many courses' do
    p = Person.new(:first => "Eve", :last => "Smith")
    p.courses.create(:name => "Ruby on Rails Fundamentals")
    p.courses.first.name.should == "Ruby on Rails Fundamentals"
  end

end
