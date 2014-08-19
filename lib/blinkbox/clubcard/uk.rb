# A standard UK Clubcard
class Blinkbox::Clubcard::UK < Blinkbox::Clubcard
  BIN_BEGIN = 63400400
  BIN_END   = 63400489
end

# A UK Privilege Clubcard
class Blinkbox::Clubcard::UKPrivilege < Blinkbox::Clubcard
  BIN_BEGIN = 6340024
end

# A UK Student Clubcard
class Blinkbox::Clubcard::UKStudent < Blinkbox::Clubcard
  BIN_BEGIN = 63400600
  BIN_END   = 63400697
end
