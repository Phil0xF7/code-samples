#!/usr/bin/env ruby

#
# Command Line Pomodoro Timer
#   -Timer alert sent via Notification Center
#
require 'terminal-notifier'

# countdown timer - default to 25 min
class PomTimer
  attr_accessor :timer

  def initialize
    @sleepInterval = 1      # default sleep value
    @updateInterval = 1     # default message update interval
  end

  def countdown(timer)
    @timer = timer * 60     # convert minutes to seconds
    duration = @timer
    while duration > 0
      # print time left
      if duration % @updateInterval == 0
        hrs = duration / 3600
        min = (duration / 60 - hrs * 60)
        sec = (duration - (min * 60 + hrs * 3600))

        print "Time Left: "
        printf("%02d:%02d:%02d", hrs, min, sec)
        print "\r"    # move cursor to beginning of line
        $stdout.flush
      end

      sleep @sleepInterval
      duration -= @sleepInterval
    end

    alert           # send notification
  end

  def alert
    msgtitle = "PomTimer"
    msg = "Timer Complete (#{@timer} sec)"
    TerminalNotifier.notify(msg, title: msgtitle)
  end
end

## Main Script

# if no args then default time is 25 min
if ARGV.empty?
  timer = 25
else
  timer = ARGV[0].to_i
end

if timer <= 0
  puts ""
  puts "Usage: ./pom.rb minutes"
  puts ""
else
  puts "\e[H\e[2J"      # clear screen
  pom = PomTimer.new
  pom.countdown(timer)
end
