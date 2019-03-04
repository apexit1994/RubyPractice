def good_string(string, substring_length)
  if string.length / 2 + 1 < substring_length
    return false
  end
  flag = true
  i = 0
  while i < string.length - substring_length
    if (string[i, substring_length].to_i == (10 ** substring_length) - 1)
      if ((string[i, substring_length].to_i) + 1 != string[i + substring_length, substring_length + 1].to_i)
        flag = false
        flag = good_string(string, substring_length + 1)
        break
      end
    elsif ((string[i, substring_length].to_i) + 1 != string[i + substring_length, substring_length].to_i)
      flag = false
      flag = good_string(string, substring_length + 1)
      break
    end

    if (string[i, substring_length].to_i == (10 ** substring_length) - 1)
      i += substring_length
      substring_length += 1
    else
      i += substring_length
    end
  end
  if flag != 0
    return flag
  end
end


puts good_string "9989991000100110021003", 1
puts good_string "141516", 1
puts good_string "1233", 1
puts good_string "123456789", 1