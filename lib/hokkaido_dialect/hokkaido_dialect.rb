module HokkaidoDialect
  QUESTIONS = [
    { dialect: "べ", correct_usage: "うまいべ？", wrong_usage: "椅子に座るんだべ" },
    { dialect: "べさ", correct_usage: "大丈夫だべさ", wrong_usage: "バイバイだべさ" },
    { dialect: "べや", correct_usage: "お前、ちゃんと連絡しろって言ったべや", wrong_usage: "あの人かっこいいべや" },
    { dialect: "しょや", correct_usage: "ごみ置きっぱなしにしないでって言ったしょや", wrong_usage: "旭川に行くしょや" },
    { dialect: "しょ", correct_usage: "釧路行きのバスったら次3時間待たないとないしょ", wrong_usage: "こないだ富良野に行ってきたしょ" },
    { dialect: "なまら", correct_usage: "締めパフェ、なまら甘かった", wrong_usage: "なまらRubyKaigiだね" },
    { dialect: "したっけ", correct_usage: "こないだ雪かきしたっけ、筋肉痛になったさ", wrong_usage: "電気消したっけ" },
  ]

  class QuizGame
    def initialize
      question = QUESTIONS.sample
      wrong_usage = question[:wrong_usage]
      @correct_usage = question[:correct_usage]
      @choices = [wrong_usage, @correct_usage].shuffle
    end

    def ask_and_check
      puts ask
      print "番号を入力してください（1 or 2）: "
      input = $stdin.gets.to_i

      unless [1, 2].include?(input)
        puts "無効な入力です！1または2を入力してください🐻"
        return
      end

      if correct_answer?(input)
        puts "正解！🎉✨🦀"
      else
        puts "不正解…🐄"
      end
    end

    def ask
      "次の文章で正しい北海道弁はどっち？\n1. #{@choices[0]}\n2. #{@choices[1]}"
    end

    def correct_answer?(input)
      index = input - 1
      @choices[index] == @correct_usage
    end
  end
end
