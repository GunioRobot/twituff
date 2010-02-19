class AlterUsersForAuthlogic < ActiveRecord::Migration
  def self.up
    #Removendo a coluna password e criando a crypted_password
    remove_column :users, :password
    add_column :users, :crypted_password, :string,  :null => false

    #Adicionando nullable false para a coluna email
    change_column :users, :email, :string, :null => false

    add_column :users, :password_salt, :string, :null => false
    add_column :users, :persistence_token, :string, :null => false

    # Magic columns, just like ActiveRecord's created_at and updated_at. These are automatically maintained by Authlogic if they are present.
    add_column :users, :last_login_at, :datetime
    add_column :users, :current_login_ip, :string
  end

  def self.down
    add_column :users, :password, :string
    remove_column :users, :crypted_password

    change_column :users, :email, :string, :null => true

    remove_column :users, :password_salt
    remove_column :users, :persistence_token

    remove_column :users, :last_login_at
    remove_column :users, :current_login_ip
  end
end
