# encoding: utf-8
module Sunrise  
  module Widgets
    # Default way to setup Sunrise.
    def self.setup
      yield self
    end
  end
end

require 'sunrise/widgets/version'
require 'sunrise/widgets/engine'
