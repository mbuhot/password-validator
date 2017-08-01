defmodule PasswordValidator.Validator do
  @moduledoc """
  A
  """

  @doc """
  Validate the given string and return `:ok` or `{:error, errors}` where
  `errors` is a list.
  """
  @callback validate(String.t, list()) :: :ok | {:error, nonempty_list()}

  @spec return_errors_or_ok(list()) :: :ok | {:error, nonempty_list()}
  def return_errors_or_ok(results) do
    errors = for {:error, reason} <- results, do: reason
    if length(errors) == 0 do
      :ok
    else
      {:error, errors}
    end
  end
end