defmodule ExMailChimp.Config do
  def get_creds do
    {Application.get_env(:exmailchimp, :api_key),
      Application.get_env(:exmailchimp, :data_center)}
  end
end
