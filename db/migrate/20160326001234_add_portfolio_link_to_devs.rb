class AddPortfolioLinkToDevs < ActiveRecord::Migration
  def change
    add_column :devs, :portfolio_link, :string
  end
end
