require 'test/unit'
require 'pig_latin'

class PigLatinTest < Test::Unit::TestCase
    include PigLatinTranslator

    def test_simple_word
        w = translate("nix")
        assert_equal(w, "ixnay", "'nix' translation failed")
    end

    def test_word_beginning_with_vowel
        s = translate("apple")
        assert_equal(s, "appleay", "'apple' translation failed")
    end

    def test_two_consonant_word
        s = translate("stupid")
        assert_equal(s, "upidstay", "'stupid' translation failed")
    end

    def test_two_words
        s = translate("eat pie")
        assert_equal(s, "eatay iepay", "'eat pie' translation failed")
    end

    def test_multiple_words
        s = translate("the quick brown fox")
        assert_equal(s, "ethay ickquy ownbray oxfay",
            "'the quick brown fox' translation failed")
    end

end
