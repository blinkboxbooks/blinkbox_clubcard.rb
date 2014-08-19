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

# A general Ireland Clubcard.
class Blinkbox::Clubcard::Ireland < Blinkbox::Clubcard
  BIN_BEGIN = 634000
end

# An Ireland Privilege Clubcard.
class Blinkbox::Clubcard::IrelandPrivilege < Blinkbox::Clubcard
  BIN_BEGIN = 6340023
end

# A ROI Clubcard.
class Blinkbox::Clubcard::ROI < Blinkbox::Clubcard
  BIN_BEGIN = 63400000
  BIN_END   = 63400089
end

# A UK/ROI Tesco Personal Finance Clubcard.
class Blinkbox::Clubcard::UKROITPF < Blinkbox::Clubcard
  BIN_BEGIN = 63400090
  BIN_END   = 63400099
  LENGTH    = 16
end

# A UK Tesco Personal Finance Clubcard.
class Blinkbox::Clubcard::UKTPF < Blinkbox::Clubcard
  BIN_BEGIN = 63400490
  BIN_END   = 63400499
  LENGTH    = 16
end

# ROI Staff Discount Clubcard
class Blinkbox::Clubcard::ROIStaffDiscount < Blinkbox::Clubcard
  BIN_BEGIN = 63400230
  BIN_END   = 63400239
end

# Staff Discount Clubcard
class Blinkbox::Clubcard::StaffDiscount < Blinkbox::Clubcard
  BIN_BEGIN = 63400200
  BIN_END   = 63400299
end

# Clubcard Plus Clubcard
class Blinkbox::Clubcard::Plus < Blinkbox::Clubcard
  BIN_BEGIN = 63400100
  BIN_END   = 63400199
  LENGTH    = 16
end

# Charity Clubcard
class Blinkbox::Clubcard::Charity < Blinkbox::Clubcard
  BIN_BEGIN = 63400698
end
