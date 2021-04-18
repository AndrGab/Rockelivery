defmodule Rockelivery.Orders.ReportRunner do
  require Logger

  use GenServer

  alias Rockelivery.Orders.Report

  def start_link(initial_state \\ %{}), do: GenServer.start_link(__MODULE__, initial_state)

  @impl true
  def init(state) do
    Logger.info("Report runner Started")
    schedule_report()
    {:ok, state}
  end

  @impl true
  def handle_info(:generate, state) do
    Logger.info("Generating orders report...")

    Report.create()
    schedule_report()

    {:noreply, state}
  end

  defp schedule_report do
    Process.send_after(self(), :generate, 1000 * 60 * 60 * 24)
  end
end
