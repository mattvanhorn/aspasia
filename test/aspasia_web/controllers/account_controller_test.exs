defmodule AspasiaWeb.AccountControllerTest do
  use AspasiaWeb.ConnCase
  import Mox
  @service_mock AspasiaWeb.AccountServiceMock

  setup do
    base_params = %{account: %{name: "Chuck Testa"}}
    {:ok, params: base_params}
  end

  describe "REGISTER" do
    setup :verify_on_exit!

    test "valid parameters yield OK response and body", %{conn: conn, params: params} do
      expect(@service_mock, :register_account, fn _ -> {:ok, %{name: "Chuck Testa"}} end)
      conn = post conn, Routes.account_path(conn, :register), Map.to_list(params)
      assert json_response(conn, :ok) == %{"name" => "Chuck Testa"}
    end

    test "missing parameters yield 422 with error message", %{conn: conn, params: params} do
      expect(@service_mock, :register_account, 2, fn
        ^params ->
          {:ok, raise("We don't want this function to succeed!")}

        _ ->
          {:error, :invalid_param}
      end)

      error_resp = %{"error" => "invalid parameters"}

      # Missing embedded parameter
      account_params = put_in(params.account.name, nil)
      conn = post conn, Routes.account_path(conn, :register), account_params
      assert json_response(conn, :unprocessable_entity) == error_resp

      # Missing top-level parameter
      account_params = put_in(params.account, nil)
      conn = post conn, Routes.account_path(conn, :register), account_params
      assert json_response(conn, :unprocessable_entity) == error_resp
    end

    test "invalid name yields same response as missing name", %{conn: conn, params: params} do
      expect(@service_mock, :register_account, fn _ -> {:error, :invalid_param} end)
      conn2 = post conn, Routes.account_path(conn, :register), Map.to_list(params)

      expect(@service_mock, :register_account, fn _ -> {:error, :missing_param} end)
      conn = post conn, Routes.account_path(conn, :register), Map.to_list(params)

      assert response(conn, :unprocessable_entity) == response(conn2, :unprocessable_entity)
    end
  end
end
