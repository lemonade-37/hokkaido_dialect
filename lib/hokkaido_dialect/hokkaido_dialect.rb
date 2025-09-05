module HokkaidoDialect
  QUESTIONS = [
    { dialect: 'べ', correct_usage: 'うまいべ？', wrong_usage: '椅子に座るんだべ' },
    { dialect: 'べさ', correct_usage: '大丈夫だべさ', wrong_usage: 'バイバイだべさ' },
    { dialect: 'べや', correct_usage: 'お前、ちゃんと連絡しろって言ったべや', wrong_usage: 'あの人かっこいいべや' },
    { dialect: 'しょや', correct_usage: 'ごみ置きっぱなしにしないでって言ったしょや', wrong_usage: '旭川に行くしょや' },
    { dialect: 'しょ', correct_usage: '釧路行きのバスったら次3時間待たないとないしょ', wrong_usage: 'こないだ富良野に行ってきたしょ' },
    { dialect: 'なまら', correct_usage: '締めパフェ、なまら甘かった', wrong_usage: 'なまらRubyKaigiだね' },
    { dialect: 'したっけ', correct_usage: 'こないだ雪かきしたっけ、筋肉痛になったさ', wrong_usage: '電気消したっけ' },
    { dialect: 'したら', correct_usage: 'したらね、またね', wrong_usage: 'したら、楽しいね' },
    { dialect: 'なして', correct_usage: 'なしてそんなことなったんだべか', wrong_usage: 'なして、おみくじ大吉だったさ' },
    { dialect: 'なんも', correct_usage: 'なんもです', wrong_usage: 'この辺殺風景で、なんもだね' },
    { dialect: '〜さる', correct_usage: 'データベース削除しささった…', wrong_usage: 'もうすぐこの本も読み終わらさるね' },
    { dialect: 'しゃ（ひゃ）っこい', correct_usage: '手しゃっこ！', wrong_usage: 'しゃっこい名前だね〜' },
    { dialect: 'かっちゃく', correct_usage: '愛してる猫にかっちゃかれた…', wrong_usage: 'かっちゃく飾り付けしよ' },
    { dialect: 'わや', correct_usage: 'あんたの部屋、わやだね', wrong_usage: '一面のチューリップ畑、わやだね〜' },
    { dialect: 'はんかくさい', correct_usage: 'やめな、はんかくさいから', wrong_usage: 'この部屋、はんかくさいな' },
    { dialect: 'いずい', correct_usage: 'このニットちくちくしていずい', wrong_usage: 'ちょっとカラオケいずいから帰ろうかな' },
    { dialect: 'あずましい', correct_usage: 'あずましくないね', wrong_usage: 'あの子、めっちゃあずましい' },
    { dialect: 'はく', correct_usage: 'ほら、早く手袋はきな', wrong_usage: '床はいておいて' },
    { dialect: 'こわい', correct_usage: 'こわいんでしょ、休んでな', wrong_usage: 'ヒグマ、こわい' },
    { dialect: 'ちょす', correct_usage: 'ちょすなし', wrong_usage: 'やっほー！ちょす！' },
    { dialect: 'うるかす', correct_usage: '食べ終わった食器うるかしといて', wrong_usage: '目がうるかさってきた' },
    { dialect: 'おっちゃんこ', correct_usage: '上手におっちゃんこして、めんこいね', wrong_usage: 'おっちゃんこして頂いていいですか？' },
    { dialect: 'ぼっこ', correct_usage: 'このぼっこを、釣竿とする', wrong_usage: 'ひなたぼっこ' },
    { dialect: 'あたる', correct_usage: 'お弁当1人1つあたるからね', wrong_usage: '生牡蠣食べてあたった' }
  ]

  class QuizGame
    def self.play(number_of_questions = 3)
      play_questions(QUESTIONS.sample(number_of_questions))
    end

    def self.all
      play_questions(QUESTIONS.shuffle)
    end

    def self.play_questions(questions)
      results = questions.map do |question|
        new(question).ask_and_check
      end
      puts "#{questions.size}問中#{results.count(true)}問正解！"
    end

    def initialize(question = QUESTIONS.sample)
      wrong_usage = question[:wrong_usage]
      @dialect = question[:dialect]
      @correct_usage = question[:correct_usage]
      @choices = [wrong_usage, @correct_usage].shuffle
    end

    def ask_and_check
      puts question_body

      input = input_until_valid

      correct_answer?(input).tap do |judgment|
        puts judgment ? '正解！🎉✨🦀' : '不正解…🐄'
      end
    end

    def question_body
      "次の文章で正しい「#{@dialect}」の使い方はどっち？\n1. #{@choices[0]}\n2. #{@choices[1]}"
    end

    def input_until_valid
      loop do
        print '番号を入力してください（1 or 2）: '
        input = $stdin.gets.to_i

        if [1, 2].include?(input)
          return input
        end

        puts '無効な入力です！1または2を入力してください🐻'
      end
    end

    def correct_answer?(input)
      index = input - 1
      @choices[index] == @correct_usage
    end
  end
end
