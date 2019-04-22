defmodule AspasiaWeb.AccountController do
  use AspasiaWeb, :controller

  @account_service Application.get_env(:aspasia, :account_service)

  alias Aspasia.Accounts
  alias Aspasia.Accounts.Account

  def register(conn, %{"account" => _} = params) do
    with {:ok, account} <- @account_service.register_account(params) do
      conn
      |> put_status(:ok)
      |> json(account)
    else
      {:error, :missing_param} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{error: "invalid parameters"})

      {:error, :invalid_param} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{error: "invalid parameters"})
    end
  end
end
