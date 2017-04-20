require 'spec_helper'

# THIS RUBY SPECIFICATION TEST IS PENDING

RSpec.describe WordsController, type: :request do

  before(:each) do
    word = FactoryGirl.create :word
  end

  describe "GET#score_word" do
    it "returns a successful response" do
      get :score_word, {params: {word: 'actually'}}
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['score'].to_i).to eq(14)
    end
  end

end
