# frozen_string_literal: true

# Patients controller
class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = current_user.patients # Load only the current user's patients
  end

  def show
    @heart_disease_prediction = (@patient.latest_heart_disease_prediction if @patient.heart_disease_predictions.any?)
  end

  def new
    @patient = current_user.patients.build # Initialize a new patient for the current_user
  end

  def edit; end

  def create
    @patient = current_user.patients.build(patient_params)
    if @patient.save
      redirect_to @patient, notice: 'Patient was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Patient was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_url, notice: 'Patient was successfully destroyed.'
  end

  private

  def set_patient
    @patient = current_user.patients.find(params[:id])  # Ensure user can only manage their own patients
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :date_of_birth, :sex)
  end
end
