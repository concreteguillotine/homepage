module ApplicationHelper
end

def admins_only(&block)
    block.call if current_admin.try(:admin?)
end