class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        # self.auditions.actors.map(actor)
        newArray = []
        self.auditions.each do |audition|
            newArray.push(audition.actor)
        end
        newArray
    end

    def locations
        newArray = []
        self.auditions.each do |audition|
            newArray.push(audition.location)
        end
        newArray
    end

    def lead
        if(self.auditions.where(hired: false))
            "No actor has been hired for this role."
        else
            self.auditions.where(hired: true).first
        end
    end

    def understudy
        if(self.auditions.where(hired: true).second == nil)
            "No actor has been hired to understudy this role."
        else
            self.auditions.where(hired: true).second
        end
    end

end