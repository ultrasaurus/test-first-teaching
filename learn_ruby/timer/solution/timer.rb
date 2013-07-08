class Timer
  attr_accessor :seconds
  attr_accessor :time_string

  def initialize 
    @seconds = 0
  end

  def time_string
    seconds = @seconds % 60
    seconds_s = seconds.to_s
    seconds_s = "0" + seconds_s unless seconds >= 10

    minutes = ((@seconds - seconds) % 3600) / 60
    minutes_s = minutes.to_s
    minutes_s = "0" + minutes_s unless minutes >= 10

    hours = (@seconds - seconds - (minutes * 60)) / 3600
    hours_s = hours.to_s
    hours_s = "0" + hours_s unless hours >= 10

    hours_s + ":" + minutes_s + ":" + seconds_s
  end
end
