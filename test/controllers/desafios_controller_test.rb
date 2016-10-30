require 'test_helper'

class DesafiosControllerTest < ActionController::TestCase
  setup do
    @desafio = desafios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:desafios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create desafio" do
    assert_difference('Desafio.count') do
      post :create, desafio: { descripcion: @desafio.descripcion, puntos: @desafio.puntos, tipo: @desafio.tipo, titulo: @desafio.titulo }
    end

    assert_redirected_to desafio_path(assigns(:desafio))
  end

  test "should show desafio" do
    get :show, id: @desafio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @desafio
    assert_response :success
  end

  test "should update desafio" do
    patch :update, id: @desafio, desafio: { descripcion: @desafio.descripcion, puntos: @desafio.puntos, tipo: @desafio.tipo, titulo: @desafio.titulo }
    assert_redirected_to desafio_path(assigns(:desafio))
  end

  test "should destroy desafio" do
    assert_difference('Desafio.count', -1) do
      delete :destroy, id: @desafio
    end

    assert_redirected_to desafios_path
  end
end
