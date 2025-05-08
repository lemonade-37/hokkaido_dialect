# frozen_string_literal: true

RSpec.describe HokkaidoDialect do
  it "has a version number" do
    expect(HokkaidoDialect::VERSION).not_to be nil
  end

  it "can ask a question" do
    question = HokkaidoDialect::Question.new
    expect(question.ask).to include("次の文章で正しい北海道弁はどっち？")
  end
end
