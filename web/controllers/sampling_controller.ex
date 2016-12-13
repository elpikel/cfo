defmodule Cfo.SamplingController do
  use Cfo.Web, :controller

  alias Cfo.Sampling

  def index(conn, _params) do
    samplings = Repo.all(Sampling)
    render(conn, "index.json", samplings: samplings)
  end

  def create(conn, %{"sampling" => sampling_params}) do
    changeset = Sampling.changeset(%Sampling{}, sampling_params)

    case Repo.insert(changeset) do
      {:ok, sampling} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", sampling_path(conn, :show, sampling))
        |> render("show.json", sampling: sampling)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Cfo.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sampling = Repo.get!(Sampling, id)
    render(conn, "show.json", sampling: sampling)
  end

  def update(conn, %{"id" => id, "sampling" => sampling_params}) do
    sampling = Repo.get!(Sampling, id)
    changeset = Sampling.changeset(sampling, sampling_params)

    case Repo.update(changeset) do
      {:ok, sampling} ->
        render(conn, "show.json", sampling: sampling)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Cfo.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sampling = Repo.get!(Sampling, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(sampling)

    send_resp(conn, :no_content, "")
  end
end
