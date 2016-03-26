class AddPortfolioLinkToDevs < ActiveRecord::Migration
  def change
    add_column :devs, :portofolio_link, :string
  end
end
