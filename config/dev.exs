use Mix.Config

config :exmailchimp, :api,
  api_key: System.get_env("EXMAILCHIMP_API_KEY"),
  data_center: System.get_env("EXMAILCHIMP_DATA_CENTER")
