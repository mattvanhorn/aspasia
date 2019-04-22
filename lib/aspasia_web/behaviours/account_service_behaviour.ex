defmodule AspasiaWeb.AccountServiceBehaviour do
  @type user :: map
  @type error :: :invalid_params

  @doc """
  Registers a User with information about their credentials, preferences, etc.
  """
  @callback register_account(account_params :: map) :: {:ok, user} | {:error, error}
end
