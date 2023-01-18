class Client < ApplicationRecord

    has_many :memberships
    has_many :gyms, through: :memberships
    
    def total_membership_cost
        total_cost = self.memberships.map{ |membership| membership.charge }.sum
        client_info = {
            name: self.name,
            age: self.age,
            total_membership_cost: total_cost
        }
    end
end
