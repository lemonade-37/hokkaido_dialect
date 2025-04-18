module HokkaidoDialect
  DIALECTS = [
    { dialect: "べ", correct_usage: "うまいべ？", wrong_usage: "椅子に座るんだべ" },
    { dialect: "べさ", correct_usage: "大丈夫だべさ", wrong_usage: "バイバイだべさ" },
    { dialect: "べや", correct_usage: "お前、ちゃんと連絡しろって言ったべや", wrong_usage: "あの人かっこいいべや" },
    { dialect: "しょや", correct_usage: "ごみ置きっぱなしにしないでって言ったしょや", wrong_usage: "旭川に行くしょや" },
    { dialect: "しょ", correct_usage: "釧路行きのバスったら次3時間待たないとないしょ", wrong_usage: "こないだ富良野に行ってきたしょ" },
    { dialect: "なまら", correct_usage: "締めパフェ、なまら甘かった", wrong_usage: "なまらRubyKaigiだね" },
    { dialect: "したっけ", correct_usage: "こないだ雪かきしたっけ、筋肉痛になったさ", wrong_usage: "電気消したっけ" },
  ]

  class Question
    def self.ask
      dialect = DIALECTS.sample
      correct_usage = dialect[:correct_usage]
      incorrect_usage = dialect[:wrong_usage]

      choices = [correct_usage, incorrect_usage].shuffle

      {
        question: "次の文章で正しい北海道弁はどっち？\n1. #{choices[0]}\n2. #{choices[1]}",
        answer: choices.index(correct_usage) + 1
      }
    end
  end
end
