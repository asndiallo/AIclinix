# frozen_string_literal: true

# Dashboard controller
class DashboardController < ApplicationController
  def index
    @patients = current_user.patients
    @total_patients = @patients.count
    @patients_with_records = @patients.select { |patient| patient.patient_records.present? }
    @patients_without_records = @patients - @patients_with_records
    # ... any other data needed for the dashboard
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end
end
