defmodule PbtTest do
  use ExUnit.Case
  use PropCheck

  # プロパティ
  property "プロパティが何をするかの説明" do
    forall type <- my_type() do
      boolean(type)
    end
  end

  property "最大の要素を見つける" do
    forall x <- non_empty(list(integer())) do
      biggest(x) == List.last(Enum.sort(x))
    end
  end

  # ヘルパー
  def boolean(_) do
    true
  end

  def biggest([head | tail]) do
    biggest(tail, head)
  end

  def biggest([], max) do
    max
  end

  def biggest([head | tail], max) when head >= max do
    biggest(tail, head)
  end

  def biggest([head | tail], max) when head < max do
    biggest(tail, max)
  end

  # ジェネレータ
  def my_type() do
    term()
  end
end
