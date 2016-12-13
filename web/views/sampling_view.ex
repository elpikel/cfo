defmodule Cfo.SamplingView do
  use Cfo.Web, :view

  def render("index.json", %{samplings: samplings}) do
    %{data: render_many(samplings, Cfo.SamplingView, "sampling.json")}
  end

  def render("show.json", %{sampling: sampling}) do
    %{data: render_one(sampling, Cfo.SamplingView, "sampling.json")}
  end

  def render("sampling.json", %{sampling: sampling}) do
    %{id: sampling.id,
      place_id: sampling.place_id,
      user_id: sampling.user_id}
  end
end
