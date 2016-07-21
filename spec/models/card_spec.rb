require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    @card = FactoryGirl.create(:card)
  end

  it 'creates a valid instance' do
    expect { expect(@card.original_text).to eq('привет') }
    expect { expect(@card.translated_text).to eq('hi') }
  end

  describe '#check_answer?' do
    context 'the answer is right' do
      specify { expect(@card.check_answer?('привет')).to eq(true) }
    end

    context 'the answer is wrong' do
      specify { expect(@card.check_answer?('poka')).to eq(false) }
    end
  end

  describe '#touch_review_date!' do
    it 'should set review date to 3 days ahead' do
     expect { @card.touch_review_date! }.to change { @card.review_date }.to(3.days.from_now.end_of_day)
    end
  end
end