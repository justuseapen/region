defmodule RegionWeb.Schema do
  use Absinthe.Schema
  @docs %{
  }

  @desc "A doc"
  object :doc do
    field :id, :id
    field :name, :string
    field :body, :string
  end

  object :location do
    field :id, :id
  end

  query do

  end
end
