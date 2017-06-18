require "http/client"
require "json"

require "./chess"
require "./plan"
require "./datapot"

class Autoplan
  def initialize
  end

  def best_plan
    @best_plan ||= Plan.best(chess.current_usage)
  end

  def current_plan
    @current_plan ||= Plan.of_size(chess.current_size)
  end

  def optimize_plan
    puts "Current usage is #{chess.current_usage} GB"
    if best_plan != current_plan
      puts "Switching from the #{current_plan.to_s} to the #{best_plan.to_s}"
      puts chess.change_plan(best_plan)
    else
      puts "The #{current_plan.to_s} is still the best plan"
    end
  end

  def chess
    @chess ||= Chess.new(Chess.fetch_token)
  end
end

Autoplan.new.optimize_plan
