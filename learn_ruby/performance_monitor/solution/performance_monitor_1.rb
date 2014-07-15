def measure n = 1
    time = Time.now
    for n in 1..n do yield if block_given?
    end
    time -= Time.now
    time = (time ** 2) ** 0.5 / n
end
