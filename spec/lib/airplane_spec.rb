require_relative "../../lib/airplane"
require 'pry'

describe Airplane do
  let(:my_plane) { Airplane.new("cesna", 10, 150) }

  describe "#initialization" do
    it "takes a type, wing loading, and horsepower as arguments" do
      expect(my_plane).to be_a(Airplane)
    end
  end

  describe "#type" do
    it "returns type" do
      expect(my_plane.type).to eq("cesna")
    end
  end

  describe "#wing_loading" do
    it "returns wing loading" do
      expect(my_plane.wing_loading).to eq(10)
    end
  end

  describe "#horsepower" do
    it "returns horsepower" do
      expect(my_plane.horsepower).to eq(150)
    end
  end

  describe "#land" do
    it "lands airplane if it is in flight" do
      my_plane.start_status = nil
      my_plane.takeoff_status = nil
      expect(my_plane.land).to eq("airplane not started, please start")

      my_plane.start
      expect(my_plane.land).to eq("airplane already on the ground")

      my_plane.takeoff
      expect(my_plane.land).to eq("airplane landed")
    end
  end

  describe "#takeoff" do
    it "launches airplane or tells you that engine is not yet started" do
      my_plane.start_status = nil
      expect(my_plane.takeoff).to eq("airplane not started, please start")

      my_plane.start
      expect(my_plane.takeoff).to eq("airplane launched")
    end
  end

  describe "#start" do
    it "starts engine or tells you that engine already started" do
      my_plane.start_status = nil
      expect(my_plane.start).to eq("airplane started")

      my_plane.start
      expect(my_plane.start).to eq("airplane already started")
     end
  end

  it "testing fuel capacity" do
    fuel_test = Airplane.new("cesna", 10, 150)
    fuel_test.start
    fuel_test.takeoff
    fuel_test.land
    fuel_test.takeoff
    fuel_test.land
    fuel_test.takeoff
    fuel_test.land
    expect(fuel_test.takeoff).to eq("not enough fuel to takeoff and land")
  end
end
