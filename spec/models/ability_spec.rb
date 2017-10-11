require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  subject(:ability) { Ability.new(user) }
  let(:user) { nil }

  describe "User Access" do
    let(:user) { build(:user) }
    it { is_expected.not_to be_able_to(:show, User) }
    it { is_expected.not_to be_able_to(:location, :report) }

    it { is_expected.to be_able_to(:show, Location) }
    it { is_expected.to be_able_to(:show, StockItem) }
    it { is_expected.to be_able_to(:show, Item) }
    it { is_expected.to be_able_to(:save_expiries, Item) }
  end

  describe "Report User Access" do
    let(:user) { build(:report_user) }
    it { is_expected.not_to be_able_to(:show, User) }

    it { is_expected.to be_able_to(:location, :report) }
    it { is_expected.to be_able_to(:show, Location) }
    it { is_expected.to be_able_to(:show, StockItem) }
    it { is_expected.to be_able_to(:show, Item) }
    it { is_expected.to be_able_to(:save_expiries, Item) }
  end

  describe "Admin Access" do
    let(:user) { build(:admin) }

    it { is_expected.to be_able_to(:manage, :all) }
  end
end
