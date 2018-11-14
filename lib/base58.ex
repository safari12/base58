defmodule Base58 do
  @characters '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz'
  @base 58

  def encode(data, hash \\ "")
  def encode(data, hash) when is_binary(data) do
    encode_zeros(data) <> encode(:binary.decode_unsigned(data), hash)
  end

  def encode(0, hash), do: hash

  def encode(data, hash) do
    character = <<Enum.at(@characters, rem(data, @base))>>
    encode(div(data, @base), character <> hash)
  end

  defp encode_zeros(""), do: ""
  defp encode_zeros(data) do
    <<Enum.at(@characters, 0)>>
    |> String.duplicate(leading_zeros(data))
  end

  defp leading_zeros(data) do
    :binary.bin_to_list(data)
    |> Enum.find_index(&(&1 != 0))
  end
end
