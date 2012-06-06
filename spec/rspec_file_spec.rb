here = File.expand_path(File.dirname __FILE__)
require "#{here}/spec_helper"
require "nokogiri"
require "rspec_file"


describe RspecFile do
  before do
    @foo_contents = <<-RUBY
# # Foo
# * bar
# * baz
#
# good
describe Foo do
  it "works" do
    (2 + 2).should == 4
  end
end
    RUBY
    file "foo_spec.rb", @foo_contents
  end

  let(:rspec_file) {RspecFile.new(:file => "#{@files.root}/foo_spec.rb")}

  it "reads the file's contents" do
    rspec_file.contents.should == @foo_contents
  end

  let(:html_doc) { Nokogiri.parse(rspec_file.to_html) }

  def noko_html(node)
    node.serialize(:save_with => 0).chomp
  end

  it "renders top-of-file comments as a markdown block" do
    intro = html_doc.css(".intro").first
    intro_html = noko_html(intro)
    intro_html.should == <<-HTML.chomp
<div class=\"intro\"><h1>Foo</h1>

<ul>
<li>bar</li>
<li>baz</li>
</ul>


<p>good</p>
</div>
    HTML
  end

  it "renders the rest of the file as a single code chunk" do
    tests = html_doc.css('.tests > pre').first
    noko_html(tests).should == <<-HTML.chomp
<pre>describe Foo do
  it "works" do
    (2 + 2).should == 4
  end
end</pre>
    HTML
  end

end
