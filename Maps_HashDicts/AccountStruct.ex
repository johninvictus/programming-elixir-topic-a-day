defmodule Account do
  defstruct [name: "", age: "", autheticated: false]

  def authenticate(ac = %Account{}) do
    ac.name != "" && ac.autheticated == true
  end
end
