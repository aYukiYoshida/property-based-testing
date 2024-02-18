defmodule PbtTest do
  use ExUnit.Case
  use PropCheck

  # プロパティ
  property "プロパティが何をするかの説明" do
    forall type <- my_type() do
      boolean(type)
    end
  end

  # ヘルパー
  def boolean(_) do
    true
  end

  # ジェネレータ
  def my_type() do
    term()
  end
end
