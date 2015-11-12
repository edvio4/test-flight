require 'pry'

class Airplane
  attr_reader :type, :wing_loading, :horsepower, :fuel
  attr_accessor :start_status, :takeoff_status

  def initialize(type, wing_loading, horsepower)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @start_status = nil
    @takeoff_status = nil
    @fuel = 100
  end

  def start
    if @fuel-10 < 0
      "not enough fuel to start"
    else
      @fuel-=10
      if @start_status.nil?
        @start_status = "airplane started"
      else
        @start_status = "airplane already started"
      end
    end
  end

  def takeoff
    if @fuel-30 < 0
      "not enough fuel to takeoff and land"
    else
      @fuel-=20
      if @start_status.nil?
        @takeoff_status = "airplane not started, please start"
      else
        @takeoff_status = "airplane launched"
      end
    end
  end

  def land
    @fuel-=10
    if @start_status.nil?
      "airplane not started, please start"
    elsif @takeoff_status.nil?
      "airplane already on the ground"
    else
      @takeoff_status = nil
      "airplane landed"
    end
  end


end
