#Use bellow command to get the number of redis keys present by pattern.
eval "return #redis.pcall('keys', 'abc:*')" 0
