defmodule ExMailChimp.Config do
  @version "3.0"

  def get do
    Application.get_env(:exmailchimp, :api, nil)
    |> Enum.into(%{})
  end

  def get(key) when is_atom(key), do: Map.get(get, key)
  def get(key) when is_bitstring(key) do
    Map.get(get, String.to_atom(key))
  end

  def root_url do
    %{api_key: _, data_center: dc} = get
    "https://#{dc}.api.mailchimp.com/#{@version}"
  end
end
