# frozen_string_literal: true

RSpec.describe HokkaidoDialect do
  it "has a version number" do
    expect(HokkaidoDialect::VERSION).not_to be nil
  end

  it "can generate a question prompt" do
    question = HokkaidoDialect::QuizGame.new
    expect(question.question_body).to match(/次の文章で正しい「.+」の使い方はどっち？/)
  end
end
