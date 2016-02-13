defmodule ExMailChimp.ConfigTest do
  use ExUnit.Case, async: true

  alias ExMailChimp.Config

  setup do
    test_config = Application.get_env(:exmailchimp, :api)
    |> Enum.into(%{})
    {:ok, test_config: test_config}
  end

  test "get returns a map with api_key and data_center", %{test_config: test_config} do
    %{api_key: api_key, data_center: data_center} = Config.get
    assert api_key == Map.get(test_config, :api_key)
    assert data_center == Map.get(test_config, :data_center)
  end

  test "get returns api value based on supplied key", %{test_config: test_config} do
    assert Config.get(:api_key) == Map.get(test_config, :api_key)
    assert Config.get(:data_center) == Map.get(test_config, :data_center)
  end

  test "get returns api value based on supplied String key", %{test_config: test_config} do
    assert Config.get("api_key") == Map.get(test_config, :api_key)
    assert Config.get("data_center") == Map.get(test_config, :data_center)
  end

  test "root_url generates API url based on data_center and version", %{test_config: test_config} do
    data_center = Map.get(test_config, :data_center)
    assert Config.root_url == "https://#{data_center}.api.mailchimp.com/3.0"
  end
end
