require "test_helper"

class Doctor::PatientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doctor_patients_index_url
    assert_response :success
  end
end
