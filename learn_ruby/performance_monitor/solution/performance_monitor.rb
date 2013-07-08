require "time"

def measure(n = 1)
  x = Time::now
  n.times { yield }
  (Time::now - x) / n
end 
