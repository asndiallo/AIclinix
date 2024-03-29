# frozen_string_literal: true

# PatientRecordsController
class PatientRecordsController < ApplicationController
  before_action :set_patient_record, only: [:show, :edit, :update, :destroy]

  def index
    @patient_records = PatientRecord.all
  end

  def show; end

  def new
    @patient_record = PatientRecord.new
  end

  def edit; end

  def create
    @patient_record = PatientRecord.new(patient_record_params)
    if @patient_record.save
      redirect_to @patient_record, notice: 'Patient record was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @patient_record.update(patient_record_params)
      redirect_to @patient_record, notice: 'Patient record was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient_record.destroy
    redirect_to patient_records_url, notice: 'Patient record was successfully destroyed.'
  end

  private

  def set_patient_record
    @patient_record = if params[:patient_id].nil?
                        PatientRecord.find(params[:id])
                      else
                        PatientRecord.where(patient_id: params[:patient_id]).last
                      end
  end

  def patient_record_params
    params.require(:patient_record).permit(:patient_id, :chest_pain_type, :resting_blood_pressure,
                                           :serum_cholesterol, :fasting_blood_sugar, :resting_ecg_results,
                                           :max_heart_rate_achieved, :exercise_induced_angina, :st_depression,
                                           :st_slope, :number_colored_major_vessels, :thalassemia, :recorded_at)
  end
end
