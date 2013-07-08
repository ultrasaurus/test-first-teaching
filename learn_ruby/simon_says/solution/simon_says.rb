def echo(x) 
  x
end

def shout(x)
  x.upcase
end

def repeat(x, n=2)
  if n <= 1
    x
  else
    x + " " + repeat(x, n-1)
  end
end

def start_of_word(x, n)
  x[0..n-1] unless n == 0 
end

def first_word(x)
  x[/\w+/]
end

def titleize(x)

do_not_capitolize = [
"a",
"abaft",
"aboard",
"about",
"above",
"absent",
"across",
"afore",
"after",
"against",
"along",
"alongside",
"amid",
"amidst",
"among",
"amongst",
"an",
"and",
"anenst",
"apropos",
"apud",
"around",
"as",
"aside",
"astride",
"at",
"athwart",
"atop",
"barring",
"before",
"behind",
"below",
"beneath",
"beside",
"besides",
"between",
"beyond",
"but",
"by",
"circa",
"concerning",
"despite",
"down",
"during",
"except",
"excluding",
"failing",
"following",
"for",
"forenenst",
"from",
"given",
"in",
"including",
"inside",
"into",
"lest",
"like",
"mid",
"midst",
"minus",
"modulo",
"near",
"nigh",
"next",
"notwithstanding",
"of",
"off",
"on",
"onto",
"opposite",
"out",
"outside",
"over",
"pace",
"past",
"per",
"plus",
"pro",
"qua",
"regarding",
"round",
"sans",
"save",
"since",
"than",
"the",
"through", 
"thru",
"throughout", 
"thruout",
"till",
"times",
"to",
"toward",
"towards",
"under",
"underneath",
"unlike",
"until",
"unto",
"up",
"upon",
"versus", 
"vs.", 
"via",
"vice",
"with",
"within",
"without",
"worth"
]

  x.gsub(/(^\w+|\s+\w+)/) do |s| 
    s.gsub(/(^\w|\s+\w)/) do |c| 
      if do_not_capitolize.index(s[/\w+/]) != nil && s != x[/^\w+/] && s != x[/\s+\w+$/]
        c
      else
        c.upcase
      end
    end
  end
end
