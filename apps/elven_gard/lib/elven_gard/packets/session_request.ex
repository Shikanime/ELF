defmodule ElvenGard.SessionRequest do
  @moduledoc """
  First LoginRequest packet send by the client
  """

  defstruct session_id: ""

  @type t :: %__MODULE__{
          session_id: String.t()
        }

  @spec parse!(binary) :: t
  def parse!(<<_::size(8), payload::binary>>) do
    payload
    |> String.split()
    |> format()
  end

  defp format(payload) when length(payload) == 5 do
    %__MODULE__{
      session_id: payload[0]
    }
  end
end