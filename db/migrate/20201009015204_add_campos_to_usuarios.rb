class AddCamposToUsuarios < ActiveRecord::Migration[6.0]
  def change
    add_column :usuarios, :nome, :string
    add_column :usuarios, :cpf, :string
    add_column :usuarios, :rg, :string
    add_column :usuarios, :data_nasc, :date
    add_column :usuarios, :endereco, :text
    add_column :usuarios, :telefone, :string
    add_column :usuarios, :grau_instrucao, :integer
    add_column :usuarios, :responsavel_id, :integer
  end
end
