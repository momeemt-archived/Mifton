module ManagesHelper

  def than_trust_user
    auth = current_user.authority.manage_pos
    dev = current_user.authority.dev_pos
    if auth == "trust_user" || auth == "operator" || auth == "admin" || dev == "developer"
      return true
    end
    false
  end

  def than_operator
    auth = current_user.authority.manage_pos
    dev = current_user.authority.dev_pos
    if auth == "operator" || auth == "admin" || dev == "developer"
      return true
    end
    false
  end

  def than_admin
    auth = current_user.authority.manage_pos
    dev = current_user.authority.dev_pos
    if auth == "admin" || dev == "developer"
      return true
    end
    false
  end

end
