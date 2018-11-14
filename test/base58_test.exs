defmodule Base58Test do
  use ExUnit.Case
  doctest Base58

  describe "encode" do
    test "basic string" do
      assert Base58.encode("hello") == "Cn8eVZg"
    end

    test "zero in string" do
      assert Base58.encode("0") == "q"
    end

    test "multiple zeroes in string" do
      assert Base58.encode("0000") == "2ESbJw"
    end

    test "zero integer" do
      assert Base58.encode(0) == ""
    end

    test "multiple zero integers" do
      assert Base58.encode(0000) == ""
    end

    test "empty string" do
      assert Base58.encode("") == ""
    end
  end
end
