require "spec_helper"

class Double
  extend Reraises

  reraise KeyError, as: ArgumentError, in: "raise_key_error"

  def raise_key_error
    raise KeyError, "message"
  end
end

describe Reraises do
  describe "#reraise" do

    it "reraises an exception as another" do
      expect{Double.new.raise_key_error}.to raise_error ArgumentError, "message"
    end

  end
end
