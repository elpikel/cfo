defmodule Cfo.SamplingControllerTest do
  use Cfo.ConnCase

  alias Cfo.Sampling
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, sampling_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    sampling = Repo.insert! %Sampling{}
    conn = get conn, sampling_path(conn, :show, sampling)
    assert json_response(conn, 200)["data"] == %{"id" => sampling.id,
      "place_id" => sampling.place_id,
      "user_id" => sampling.user_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, sampling_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, sampling_path(conn, :create), sampling: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Sampling, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, sampling_path(conn, :create), sampling: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    sampling = Repo.insert! %Sampling{}
    conn = put conn, sampling_path(conn, :update, sampling), sampling: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Sampling, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    sampling = Repo.insert! %Sampling{}
    conn = put conn, sampling_path(conn, :update, sampling), sampling: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    sampling = Repo.insert! %Sampling{}
    conn = delete conn, sampling_path(conn, :delete, sampling)
    assert response(conn, 204)
    refute Repo.get(Sampling, sampling.id)
  end
end
