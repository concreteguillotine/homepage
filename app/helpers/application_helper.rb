module ApplicationHelper
    def admins_only(&block)
        block.call if current_admin.try(:admin?)
    end

    def title(*parts)
        unless parts.empty?
            content_for :title do
                (parts << "Article")
            end
        end
    end
end

