require 'rails_helper'

RSpec.describe Background do
  it 'has attributes', :vcr do
    background = Background.new('denver,co')

    expect(background.image).to_not be_empty
  end
end
