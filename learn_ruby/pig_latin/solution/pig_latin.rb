def translate(x)
  x.gsub!(/\w+/) do |w| 
    if w[/^[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]/]
      if w[/^[B-DF-HJ-NPR-TV-Z]?[b-df-hj-npr-tv-z]*(qu|Qu)/]
        c_size = w[/^[B-DF-HJ-NPR-TV-Z]?[b-df-hj-npr-tv-z]*(qu|Qu)/].length
      else
        c_size = w[/^[B-DF-HJ-NPR-TV-Z]?[b-df-hj-npr-tv-z]*/].length
      end
      w[c_size..-1]+w[0..c_size-1]
    else 
      w
    end 
  end
  x.gsub(/\w+/) do |w|
    if w[/[A-Z]/]
      w.downcase!
      w.gsub!(/^\w/) {|c| c.upcase}
    end
    w+"ay"
  end
end
