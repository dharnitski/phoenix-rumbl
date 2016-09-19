defmodule Rumbl.Permalink do
  @behaviour Ecto.Type

  def type, do: :id


  @doc """
    Casts strings starting from positive number to integer

    ## Examples

        iex> Rumbl.Permalink.cast 1
        {:ok, 1}

        iex> Rumbl.Permalink.cast "1"
        {:ok, 1}

        iex> Rumbl.Permalink.cast "1-hello-world"
        {:ok, 1}

        iex> Rumbl.Permalink.cast "hello-world-1"
        :error
    """
  def cast(binary) when is_binary(binary) do
    case Integer.parse(binary) do
      {int, _} when int > 0 -> {:ok, int}
      _ -> :error
    end
  end
  def cast(integer) when is_integer(integer) do
    {:ok, integer}
  end
  def cast(_) do
    :error
  end

  def dump(integer) when is_integer(integer) do
    {:ok, integer}
  end

  def load(integer) when is_integer(integer) do
    {:ok, integer}
  end

end
