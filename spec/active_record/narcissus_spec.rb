require 'spec_helper'

describe ActiveRecord::Narcissus do

  context 'helper' do

    it "#root is not nil" do
      expect(ActiveRecord::Narcissus.root).not_to be_nil
    end

  end

end
