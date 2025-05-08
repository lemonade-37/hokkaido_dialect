# frozen_string_literal: true

RSpec.describe HokkaidoDialect do
  it "has a version number" do
    expect(HokkaidoDialect::VERSION).not_to be nil
  end

  it "can ask a question" do
    question = HokkaidoDialect::QuizGame.new
    expect(question.ask).to match(/次の文章で正しい「.+」の使い方はどっち？/)
  end
end
