require 'test/unit'
require 'pig_latin'

class PigLatinTest < Test::Unit::TestCase
    include PigLatinTranslator

    def test_simple_word_nix
        s = translate("nix")
        assert_equal("ixnay", s)
    end

    def test_word_beginning_with_vowel_apple
        s = translate("apple")
        assert_equal("appleay", s)
    end

    def test_two_consonant_word_stupid
        s = translate("stupid")
        assert_equal("upidstay", s)
    end

    def test_two_words_eat_pie
        s = translate("eat pie")
        assert_equal("eatay iepay", s)
    end

    def test_multiple_words_the_quick_brown_fox
        s = translate("the quick brown fox")
        assert_equal("ethay ickquay ownbray oxfay", s)
    end

end
