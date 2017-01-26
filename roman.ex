defmodule Romanize do
  @map [
    { "D",  500 },
    { "CD", 400 },
    { "C",  100 },
    { "L",  50 },
    { "XL", 40 },
    { "X",  10 },
    { "IX", 9 },
    { "V",  5 },
    { "IV", 4 },
    { "I",  1 }
  ]

  def convert(decimal) do
    convert(decimal, @map)
  end

  defp convert(0, _numerals), do: ""

  defp convert(decimal, [{ roman, arabic } | tail ]) when decimal >= arabic  do
    roman <> convert(decimal - arabic, [{ roman, arabic } | tail])
  end

  defp convert(decimal, [{ _roman, arabic } | tail]) when decimal < arabic do
    convert(decimal, tail)
  end
end

ExUnit.start

defmodule AssertionTest do
  use ExUnit.Case, async: true

  test "4" do
    assert Romanize.convert(4) == "IV"
  end

  test "19" do
    assert Romanize.convert(19) == "XIX"
  end

  test "444" do
    assert Romanize.convert(444) == "CDXLIV"
  end
end
