Rails.application.routes.draw do
  resources :chamadas
  resources :contratos
  resources :salas
  resources :agendamentos
  resources :tipo_cursos

  get 'alunos' => "usuarios#alunos"
  get 'responsaveis' => "usuarios#responsaveis"

  get 'meus_agendamentos' => "agendamentos#meus_agendamentos"

  get 'lista_chamada' => "chamadas#lista"

  devise_for :usuarios
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get 'logout' => 'devise/sessions#destroy'
end
