defmodule ExMailChimp.ConfigTest do
  use ExUnit.Case, async: true

  test "get_creds returns a map with client_id and client_secret" do
    {api_key, data_center} = ExMailChimp.Config.get_creds
    assert api_key == Application.get_env(:exmailchimp, :api_key)
    assert data_center == Application.get_env(:exmailchimp, :data_center)
  end
end
