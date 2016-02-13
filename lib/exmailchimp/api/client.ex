defmodule ExMailChimp.Api.Client do
  use HTTPoison.Base

  alias ExMailChimp.Config

  defp process_url(uri) do
    Config.root_url <> uri
  end

  defp process_response_body(body) do
    Poison.decode!(body, keys: :atoms)
  end

  defp process_request_headers(headers) do
    encoded_key = Base.encode64(":#{Config.get(:api_key)}")
    headers
    |> Enum.into(%{})
    |> Map.put("Authorization", "Basic #{encoded_key}")
    |> Enum.into([])
  end
end
