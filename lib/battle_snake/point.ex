defmodule BattleSnake.Point do
  @type t :: %__MODULE__{
    x: integer,
    y: integer,
  }

  defstruct [:x, :y]

  defmacro __using__(_) do
    quote do
      require BattleSnake.Point
      import BattleSnake.Point, only: :macros
    end
  end

  defmacro p(x, y),
    do: quote do: %BattleSnake.Point{
          x: unquote(x),
          y: unquote(y)}

  def sub(a, b) do
    %__MODULE__{
      y: a.y - b.y,
      x: a.x - b.x,
    }
  end

  def add(a, b) do
    %__MODULE__{
      y: a.y + b.y,
      x: a.x + b.x,
    }
  end
end

defimpl Poison.Encoder, for: BattleSnake.Point do
  def encode(%{x: x, y: y}, opts) do
    Poison.encode!([x, y], opts)
  end
end
