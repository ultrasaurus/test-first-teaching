require 'test/unit'

class PigLatinTest < Test::Unit::TestCase
    def test_simple_word
        w = translate("nix")
        assert_equal(w, "ixnay")
    end

    def test_word_beginning_with_vowel
        s = translate("apple")
        assert_equal(s, "appleay")
    end

    def test_two_consonant_word
        s = translate("stupid")
        assert_equal(s, "upidstay")
    end

    def test_two_words
        s = translate("eat pie")
        assert_equal(s, "eatay iepay")
    end

    def 
    def test_multiple_words
        s = translate("the quick brown fox")
        assert_equal(s, "ethay ickquy ownbray oxfay")
    end

end
